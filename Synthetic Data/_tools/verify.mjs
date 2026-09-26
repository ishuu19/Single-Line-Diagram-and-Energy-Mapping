// Corpus self-test.
//
// Checks three things, in order of importance:
//  1. Recoverability - every attribute in the ground truth is actually printed
//     on the drawing, so the graph is derivable from the image alone.
//  2. Electrical validity - the rule set from plan.md section 4.3.
//  3. Telemetry consistency - the CSVs describe the same plant as the graph.
//
//   node verify.mjs            verify every plant present
//   node verify.mjs PLANT-01   verify one

import { readFileSync, existsSync, createReadStream } from 'node:fs';
import { resolve, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';
import { createInterface } from 'node:readline';
import { PLANTS } from './plants.mjs';
import { GENERATED_PLANTS } from './plants.generated.mjs';

const ROOT = resolve(dirname(fileURLToPath(import.meta.url)), '..');
const argvAll = process.argv.slice(2);
const only = argvAll.filter((a) => !a.startsWith('--'));
const coreOnly = argvAll.includes('--core');
const genOnly = argvAll.includes('--gen');
const ALL_PLANTS = coreOnly ? PLANTS : genOnly ? GENERATED_PLANTS : [...PLANTS, ...GENERATED_PLANTS];

let failures = 0;
const report = [];

const norm = (s) => String(s).replace(/\s+/g, ' ').trim().toLowerCase();

/** Trace every load back to a source node through power edges only. */
function reachability(graph) {
  const up = new Map();
  for (const e of graph.edges) {
    if (e.relationship !== 'power') continue;
    (up.get(e.target) ?? up.set(e.target, []).get(e.target)).push(e.source);
  }
  const sources = new Set(graph.nodes.filter((n) => n.class === 'source').map((n) => n.id));
  const memo = new Map();
  const reaches = (id, seen = new Set()) => {
    if (sources.has(id)) return true;
    if (memo.has(id)) return memo.get(id);
    if (seen.has(id)) return false;
    seen.add(id);
    const r = (up.get(id) ?? []).some((p) => reaches(p, seen));
    memo.set(id, r);
    return r;
  };
  return reaches;
}

function hasCycle(graph) {
  const adj = new Map();
  for (const e of graph.edges) {
    if (e.relationship !== 'power') continue;
    (adj.get(e.source) ?? adj.set(e.source, []).get(e.source)).push(e.target);
  }
  const state = new Map();
  const walk = (n) => {
    if (state.get(n) === 1) return true;
    if (state.get(n) === 2) return false;
    state.set(n, 1);
    for (const m of adj.get(n) ?? []) if (walk(m)) return true;
    state.set(n, 2);
    return false;
  };
  return graph.nodes.some((n) => walk(n.id));
}

async function readCsvHead(path, n) {
  const rl = createInterface({ input: createReadStream(path), crlfDelay: Infinity });
  const out = [];
  for await (const line of rl) { out.push(line); if (out.length >= n) break; }
  rl.close();
  return out;
}

async function scanTrends(path, graph) {
  const issues = [];
  const rl = createInterface({ input: createReadStream(path), crlfDelay: Infinity });
  const lastEnergy = new Map();
  const seenMeters = new Set();
  const states = new Set();
  let rows = 0, header = null, missing = 0;

  for await (const line of rl) {
    if (!header) { header = line.split(','); continue; }
    if (!line) continue;
    rows++;
    const c = line.split(',');
    const [, , meter, state, kw, kvar, kva, pf, amps, volts, energy, quality] = c;
    seenMeters.add(meter);
    states.add(state);

    if (quality === 'MISSING') { missing++; continue; }

    // pf must be blank exactly when kVA is zero.
    const kvaN = Number(kva);
    if (kvaN === 0 && pf !== '') issues.push(`pf present at zero kVA (${meter})`);
    if (kvaN > 0 && pf === '') issues.push(`pf blank at non-zero kVA (${meter})`);

    // kVA must equal hypot(kW, kvar).
    if (rows % 5000 === 0) {
      const h = Math.hypot(Number(kw), Number(kvar));
      if (Math.abs(h - kvaN) > 1e-6) issues.push(`kVA != hypot(kW,kvar) at row ${rows}`);
      const v = Number(volts);
      if (v > 0) {
        const a = (kvaN * 1000) / (Math.sqrt(3) * v);
        if (Math.abs(a - Number(amps)) > 1e-6) issues.push(`current inconsistent at row ${rows}`);
      } else if (Number(amps) !== 0) issues.push(`current non-zero at zero volts, row ${rows}`);
    }

    // Cumulative energy register must never decrease.
    const e = Number(energy);
    if (lastEnergy.has(meter) && e < lastEnergy.get(meter) - 1e-9) {
      issues.push(`energy_kwh decreased for ${meter}`);
    }
    lastEnergy.set(meter, e);
  }
  rl.close();

  const graphMeters = new Set(graph.meters.map((m) => m.tag));
  for (const m of graphMeters) if (!seenMeters.has(m)) issues.push(`meter ${m} in graph but absent from trends`);
  for (const m of seenMeters) if (!graphMeters.has(m)) issues.push(`meter ${m} in trends but absent from graph`);

  const graphStates = new Set(graph.switch_states.map((s) => s.id));
  for (const s of states) if (!graphStates.has(s)) issues.push(`state ${s} in trends but not declared in graph`);

  return { rows, missing, issues: [...new Set(issues)].slice(0, 8), meters: seenMeters.size, states: [...states].sort() };
}

for (const spec of ALL_PLANTS) {
  if (only.length && !only.includes(spec.id)) continue;
  const dir = `${ROOT}/${spec.id}`;
  if (!existsSync(`${dir}/graph/graph.json`)) continue;

  const graph = JSON.parse(readFileSync(`${dir}/graph/graph.json`, 'utf8'));
  const svg = readFileSync(`${dir}/drawings/plant.svg`, 'utf8');
  const errs = [];

  // ── 1. Recoverability ──────────────────────────────────────────────────────
  for (const n of graph.nodes) {
    // Long values wrap across several text runs, so compare against the runs
    // joined back together rather than against any single run.
    const drawn = norm(n.text_labels.map((t) => t.text).join(' '));
    if (!n.text_labels.some((t) => t.text === n.id)) errs.push(`${n.id}: tag not printed on drawing`);
    for (const [k, v] of Object.entries(n.attributes)) {
      if (!drawn.includes(norm(v))) errs.push(`${n.id}: attribute ${k}="${v}" is not printed`);
    }
    if (!n.bbox) errs.push(`${n.id}: missing bbox`);
  }

  // Every printed label must sit inside the canvas.
  for (const n of graph.nodes) {
    for (const t of n.text_labels) {
      if (t.bbox[0] < -1 || t.bbox[1] < -1 || t.bbox[2] > graph.image.width + 1 || t.bbox[3] > graph.image.height + 1) {
        errs.push(`${n.id}: label "${t.text}" outside canvas`);
      }
    }
  }

  // ── 2. Structure and electrical validity ───────────────────────────────────
  const ids = graph.nodes.map((n) => n.id);
  if (new Set(ids).size !== ids.length) errs.push('duplicate node ids');
  const idSet = new Set(ids);
  for (const e of graph.edges) {
    if (!idSet.has(e.source)) errs.push(`edge ${e.id}: unknown source ${e.source}`);
    if (!idSet.has(e.target)) errs.push(`edge ${e.id}: unknown target ${e.target}`);
    if (!e.polyline || e.polyline.length < 2) errs.push(`edge ${e.id}: missing geometry`);
  }

  const reaches = reachability(graph);
  for (const n of graph.nodes) {
    if (['motor', 'load'].includes(n.class) && !reaches(n.id)) errs.push(`${n.id}: no path back to a source`);
  }
  if (hasCycle(graph)) errs.push('power path contains a cycle');

  // Measurement links must run from a CT to a meter, and every meter must have one.
  const meterIds = new Set(graph.nodes.filter((n) => n.class === 'meter').map((n) => n.id));
  const fed = new Set();
  for (const e of graph.edges.filter((x) => x.relationship === 'measurement')) {
    const s = graph.nodes.find((n) => n.id === e.source);
    const t = graph.nodes.find((n) => n.id === e.target);
    if (s.class !== 'ct' || t.class !== 'meter') errs.push(`edge ${e.id}: measurement link is not CT->meter`);
    if (e.line_style !== 'dashed') errs.push(`edge ${e.id}: measurement link not marked dashed`);
    fed.add(e.target);
  }
  for (const m of meterIds) if (!fed.has(m)) errs.push(`${m}: meter has no CT association`);

  // Dashed styling must actually be present in the rendered SVG.
  const dashed = (svg.match(/class="lt-sld-wire" stroke-dasharray/g) ?? []).length;
  if (dashed !== graph.counts.measurement_edges) {
    errs.push(`svg has ${dashed} dashed wires, graph declares ${graph.counts.measurement_edges}`);
  }

  // Motors must sit behind a protective device.
  const inbound = new Map();
  for (const e of graph.edges) if (e.relationship === 'power') inbound.set(e.target, e.source);
  for (const n of graph.nodes.filter((x) => x.class === 'motor')) {
    let up = inbound.get(n.id), hops = 0, ok = false;
    while (up && hops++ < 4) {
      const c = graph.nodes.find((x) => x.id === up).class;
      if (c === 'breaker' || c === 'protection') { ok = true; break; }
      up = inbound.get(up);
    }
    if (!ok) errs.push(`${n.id}: motor not downstream of a protective device`);
  }

  // ── 3. Telemetry ───────────────────────────────────────────────────────────
  let dataSummary = 'no data';
  if (existsSync(`${dir}/data/meter_trends.csv`)) {
    const [regHead] = await readCsvHead(`${dir}/data/sensor_register.csv`, 1);
    if (regHead !== 'sensor_id,units') errs.push('sensor_register header mismatch');

    const [swHead, swFirst] = await readCsvHead(`${dir}/data/switch_states.csv`, 2);
    const swCols = swHead.split(',').slice(2);
    const declared = Object.keys(graph.switch_states[0].breakers);
    if (swCols.sort().join('|') !== declared.sort().join('|')) {
      errs.push(`switch_states columns ${swCols} != graph breakers ${declared}`);
    }
    // The first logged row must match the declared S0 configuration.
    const s0 = graph.switch_states.find((s) => s.id === 'S0');
    const first = swFirst.split(',');
    swHead.split(',').slice(2).forEach((tag, i) => {
      const logged = first[2 + i] === 'true' ? 'closed' : 'open';
      if (s0.breakers[tag] !== logged) errs.push(`S0 ${tag}: graph says ${s0.breakers[tag]}, log says ${logged}`);
    });

    const t = await scanTrends(`${dir}/data/meter_trends.csv`, graph);
    errs.push(...t.issues);
    dataSummary = `${(t.rows / 1000).toFixed(0)}k rows, ${t.meters} meters, states ${t.states.join('/')}, ${t.missing} MISSING`;
  }

  failures += errs.length;
  report.push({ id: spec.id, nodes: graph.counts.nodes, edges: graph.counts.edges, errs, dataSummary });
}

for (const r of report) {
  const status = r.errs.length ? `FAIL (${r.errs.length})` : 'PASS';
  console.log(`${r.id.padEnd(9)} ${status.padEnd(9)} ${String(r.nodes).padStart(3)}n/${String(r.edges).padStart(3)}e  ${r.dataSummary}`);
  for (const e of r.errs.slice(0, 10)) console.log(`            - ${e}`);
  if (r.errs.length > 10) console.log(`            ... ${r.errs.length - 10} more`);
}
console.log(`\n${report.length} plant(s), ${failures} issue(s)`);
process.exit(failures ? 1 : 0);
