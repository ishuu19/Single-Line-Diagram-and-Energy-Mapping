// Telemetry generation: meter_trends.csv, sensor_register.csv, switch_states.csv
//
// Semantics are reproduced from the supplied reference dataset:
//  - energy_kwh is a cumulative register, advanced by kw/60 each minute
//  - a de-energised bus reports voltage_ll_v = 0
//  - an open incomer on a bus back-fed through the tie reports 0 kW at nominal volts
//  - an incomer carries the sum of the feeders it supplies plus unmetered section load
//  - feeder meters hold a fixed power factor; incomer power factor is derived
//  - pf is left blank when kVA is zero; MISSING rows blank every measurement

import { createWriteStream } from 'node:fs';
import { mulberry32 } from './build.mjs';
import { PROFILES } from './plants.mjs';

const MIN = 60_000;
const SQRT3 = Math.sqrt(3);

// Python-style float rendering, so 0 serialises as "0.0" exactly as in the reference.
const fmt = (x) => (Number.isInteger(x) ? x.toFixed(1) : String(x));

function gauss(rng) {
  let u = 0, v = 0;
  while (u === 0) u = rng();
  while (v === 0) v = rng();
  return Math.sqrt(-2 * Math.log(u)) * Math.cos(2 * Math.PI * v);
}

const isoUtc = (ms) => new Date(ms).toISOString().slice(0, 19) + 'Z';
const isoLocal = (ms, tz) => {
  const sign = tz[0] === '-' ? -1 : 1;
  const [hh, mm] = tz.slice(1).split(':').map(Number);
  return new Date(ms + sign * (hh * 60 + mm) * MIN).toISOString().slice(0, 19) + tz;
};

// Start at local midnight on 1 July 2025 and run for `days`.
function startMs(tz) {
  const sign = tz[0] === '-' ? -1 : 1;
  const [hh, mm] = tz.slice(1).split(':').map(Number);
  return Date.UTC(2025, 6, 1) - sign * (hh * 60 + mm) * MIN;
}

/** Per-minute switching schedule: normal running with planned maintenance windows. */
function buildSchedule(model, days, rng) {
  const states = model.states;
  const normal = states[0];
  const alt = states[2] ?? states[0];
  const trans = states[1];
  const events = [];
  const nEvents = 1 + (rng() < 0.45 ? 1 : 0);

  for (let i = 0; i < nEvents; i++) {
    const day = 5 + Math.floor(rng() * (days - 10)) + i * 9;
    if (day >= days - 1) continue;
    const hour = 8 + Math.floor(rng() * 8);
    const dur = 60 + Math.floor(rng() * 5) * 60; // 1-5 hours
    const start = (day * 24 + hour) * 60;
    events.push({ start, dur });
  }

  return (i) => {
    for (const e of events) {
      if (i === e.start || i === e.start + e.dur + 1) return trans;
      if (i > e.start && i <= e.start + e.dur) return alt;
    }
    return normal;
  };
}

/** Which incomers energise which bus sections under a given breaker configuration. */
function solveFeed(model, closed) {
  const secs = model.sections;
  const own = new Map();
  for (const s of secs) own.set(s.key, s.incomers.filter((i) => closed[i.cbTag]));

  const feeds = new Map(); // section key -> incomers supplying it
  for (const s of secs) feeds.set(s.key, [...own.get(s.key)]);

  if (model.tie && closed[model.tie.tag] && secs.length >= 2) {
    const [a, b] = secs;
    if (own.get(a.key).length && !own.get(b.key).length) feeds.set(b.key, [...own.get(a.key)]);
    if (own.get(b.key).length && !own.get(a.key).length) feeds.set(a.key, [...own.get(b.key)]);
  }
  return feeds;
}

/** Deterministic load shape for one metered circuit. */
function makeLoad(peakKw, svc, seed) {
  const p = PROFILES[svc] ?? PROFILES.PNL;
  const rng = mulberry32(seed);
  const util = 0.62 + rng() * 0.22;
  const phase = (rng() - 0.5) * 1.5;
  let walk = 0;
  return (hourLocal, isWeekend) => {
    const cyc = 0.5 * (1 + Math.cos((2 * Math.PI * (hourLocal - p.peak + phase)) / 24));
    walk = walk * 0.9985 + gauss(rng) * 0.006;
    walk = Math.max(-0.12, Math.min(0.12, walk));
    const lvl = (1 - p.amp) + p.amp * cyc;
    const day = isWeekend ? p.weekend : 1;
    const kw = peakKw * util * lvl * day * (1 + walk) * (1 + gauss(rng) * p.noise);
    return Math.max(0, kw);
  };
}

const kvarOf = (kw, pf) => kw * Math.tan(Math.acos(pf));

async function write(stream, text) {
  if (!stream.write(text)) await new Promise((r) => stream.once('drain', r));
}

/**
 * Generate all three CSVs for one plant.
 * Returns a summary used for the corpus manifest.
 */
export async function generateSeries(model, outDir, days = 30) {
  const rng = mulberry32(model.seed + 7777);
  const total = days * 24 * 60;
  const t0 = startMs(model.tz);
  const V = model.llv;

  // Registered meters, in drawing order.
  const meters = model.meters.map((m) => ({ ...m }));

  // Feeder load models, plus one circuit held on standby and rotated into duty
  // partway through the month (mirrors the reference dataset).
  const rotateIdx = meters.filter((m) => m.role === 'feeder').length > 3
    ? 2 + Math.floor(rng() * 2) : -1;
  let fSeen = 0;
  for (const m of meters) {
    if (m.role !== 'feeder') continue;
    m.load = makeLoad(m.feeder.peakKw, m.feeder.svc, model.seed * 31 + fSeen * 17);
    m.pf = m.feeder.pf;
    m.dutyFrom = fSeen === rotateIdx ? (3 + Math.floor(rng() * 7)) * 24 * 60 : 0;
    fSeen++;
  }
  for (const s of model.sections) {
    s.baseLoad = makeLoad(s.baseKw, 'PNL', model.seed * 13 + s.key.charCodeAt(0));
  }

  // Comms dropouts.
  const gaps = [];
  const nGaps = 2 + Math.floor(rng() * 3);
  for (let i = 0; i < nGaps; i++) {
    const m = meters[Math.floor(rng() * meters.length)];
    const start = Math.floor(rng() * (total - 60));
    gaps.push({ tag: m.tag, start, end: start + 10 + Math.floor(rng() * 25) });
  }
  const isMissing = (tag, i) => gaps.some((g) => g.tag === tag && i >= g.start && i < g.end);

  const schedule = buildSchedule(model, days, rng);
  const switchTags = model.switchable.map((s) => s.tag);

  // ── sensor_register.csv ────────────────────────────────────────────────────
  const UNITS = [['kw', 'kW'], ['kvar', 'kvar'], ['kva', 'kVA'], ['pf', '1'],
    ['current_a', 'A'], ['voltage_ll_v', 'V'], ['energy_kwh', 'kWh']];
  const reg = ['sensor_id,units'];
  for (const m of meters) for (const [f, u] of UNITS) reg.push(`${m.tag}.${f},${u}`);
  const regStream = createWriteStream(`${outDir}/sensor_register.csv`);
  await write(regStream, reg.join('\n') + '\n');
  await new Promise((r) => regStream.end(r));

  // ── meter_trends.csv + switch_states.csv ───────────────────────────────────
  const trends = createWriteStream(`${outDir}/meter_trends.csv`);
  const switches = createWriteStream(`${outDir}/switch_states.csv`);
  await write(trends, 'timestamp_utc,timestamp_local,meter_id,state_id,kw,kvar,kva,pf,current_a,voltage_ll_v,energy_kwh,quality\n');
  await write(switches, `timestamp,state,${switchTags.join(',')}\n`);

  const energy = new Map(meters.map((m) => [m.tag, 0]));
  const stateCount = {};
  let tBuf = [], sBuf = [];

  for (let i = 0; i < total; i++) {
    const ms = t0 + i * MIN;
    const utc = isoUtc(ms);
    const loc = isoLocal(ms, model.tz);
    const locDate = new Date(ms + (model.tz[0] === '-' ? -1 : 1) *
      (Number(model.tz.slice(1, 3)) * 60 + Number(model.tz.slice(4))) * MIN);
    const hourLocal = locDate.getUTCHours() + locDate.getUTCMinutes() / 60;
    const weekend = locDate.getUTCDay() === 0 || locDate.getUTCDay() === 6;

    const st = schedule(i);
    stateCount[st.id] = (stateCount[st.id] ?? 0) + 1;
    const closed = st.breakers;
    const feeds = solveFeed(model, closed);

    sBuf.push(`${utc},${st.id},${switchTags.map((t) => (closed[t] ? 'true' : 'false')).join(',')}`);

    // Real power drawn on each section this minute.
    const secKw = new Map(), secKvar = new Map();
    for (const s of model.sections) {
      const live = feeds.get(s.key).length > 0;
      let kw = 0, kvar = 0;
      if (live) {
        const b = s.baseLoad(hourLocal, weekend);
        kw += b; kvar += kvarOf(b, s.basePf);
        if (!st.transition) {
          for (const m of meters) {
            if (m.role !== 'feeder' || m.sec !== s.key || i < m.dutyFrom) continue;
            const f = m.load(hourLocal, weekend);
            kw += f; kvar += kvarOf(f, m.pf);
          }
        }
      }
      secKw.set(s.key, kw); secKvar.set(s.key, kvar);
    }

    for (const m of meters) {
      const secLive = feeds.get(m.sec).length > 0;
      let kw = 0, kvar = 0, volts = secLive ? V : 0;

      if (m.role === 'feeder') {
        if (secLive && !st.transition && i >= m.dutyFrom) {
          kw = m.load(hourLocal, weekend);
          kvar = kvarOf(kw, m.pf);
        }
      } else {
        // Incomer: carries every section it supplies, shared with any parallel incomer.
        const inc = model.sections.find((s) => s.key === m.sec).incomers[m.incomerIdx];
        if (closed[inc.cbTag]) {
          for (const s of model.sections) {
            const sup = feeds.get(s.key);
            if (!sup.includes(inc)) continue;
            kw += secKw.get(s.key) / sup.length;
            kvar += secKvar.get(s.key) / sup.length;
          }
          // Incomer metering is independent of the feeder meters, so it does not
          // sum to them exactly.
          const j = 1 + gauss(rng) * 0.0015;
          kw *= j; kvar *= j;
        }
        volts = secLive ? V : 0;
      }

      if (kw < 1e-9) { kw = 0; kvar = 0; }
      const kva = Math.hypot(kw, kvar);
      const pf = kva > 0 ? kw / kva : null;
      const amps = kva > 0 && volts > 0 ? (kva * 1000) / (SQRT3 * volts) : 0;
      energy.set(m.tag, energy.get(m.tag) + kw / 60);

      if (isMissing(m.tag, i)) {
        tBuf.push(`${utc},${loc},${m.tag},${st.id},,,,,,,,MISSING`);
      } else {
        tBuf.push(`${utc},${loc},${m.tag},${st.id},${fmt(kw)},${fmt(kvar)},${fmt(kva)},` +
          `${pf === null ? '' : pf},${fmt(amps)},${volts},${energy.get(m.tag)},GOOD`);
      }
    }

    if (tBuf.length >= 4000) { await write(trends, tBuf.join('\n') + '\n'); tBuf = []; }
    if (sBuf.length >= 4000) { await write(switches, sBuf.join('\n') + '\n'); sBuf = []; }
  }

  if (tBuf.length) await write(trends, tBuf.join('\n') + '\n');
  if (sBuf.length) await write(switches, sBuf.join('\n') + '\n');
  await new Promise((r) => trends.end(r));
  await new Promise((r) => switches.end(r));

  return {
    days, interval_s: 60, rows: total * meters.length, meters: meters.length,
    start_utc: isoUtc(t0), end_utc: isoUtc(t0 + (total - 1) * MIN),
    state_minutes: stateCount,
    switchable_breakers: switchTags,
    dropouts: gaps.map((g) => ({ meter: g.tag, minutes: g.end - g.start })),
  };
}
