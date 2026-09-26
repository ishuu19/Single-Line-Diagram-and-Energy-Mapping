// Spec -> tagged model -> Schematex SLD source -> ground-truth graph.

import { PROFILES } from './plants.mjs';

// Deterministic PRNG so every regeneration reproduces identical tags and telemetry.
export function mulberry32(seed) {
  let a = seed >>> 0;
  return function () {
    a = (a + 0x6d2b79f5) >>> 0;
    let t = Math.imul(a ^ (a >>> 15), 1 | a);
    t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t;
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
  };
}

// Tag allocator drawing from the number ranges used on the reference drawing.
function makeTagger(rng) {
  const used = new Set();
  return (prefix, lo, hi) => {
    for (let i = 0; i < 4000; i++) {
      const tag = `${prefix}-${lo + Math.floor(rng() * (hi - lo + 1))}`;
      if (!used.has(tag)) { used.add(tag); return tag; }
    }
    throw new Error(`tag space exhausted for ${prefix}`);
  };
}

const RANGES = {
  TX: [1600, 1699], CB: [300, 399], TA: [700, 799], PM: [1000, 1099],
  DRV: [800, 899], MTR: [1100, 1199], FD: [900, 999], BUS: [400, 499],
  PNL: [1400, 1499], LA: [1200, 1299], CAP: [600, 699], HF: [500, 599],
};

const pick = (rng, [lo, hi]) => lo + rng() * (hi - lo);

// Coarse detection class for each Schematex symbol type.
const CLASS_OF = {
  utility: 'source', generator: 'source', solar: 'source', wind: 'source', ups: 'source',
  transformer: 'transformer', transformer_dy: 'transformer', transformer_yd: 'transformer',
  transformer_yy: 'transformer', transformer_dd: 'transformer',
  autotransformer: 'transformer', transformer_3winding: 'transformer',
  bus: 'bus', bus_tie: 'tie', hub: 'panel',
  breaker: 'breaker', breaker_vacuum: 'breaker', switch: 'switch', switch_load: 'switch',
  ground_switch: 'switch', ats: 'tie', recloser: 'protection', sectionalizer: 'protection',
  fuse: 'protection', fuse_cl: 'protection',
  ct: 'ct', pt: 'ct', relay: 'protection', surge_arrester: 'protection', ground_fault: 'protection',
  motor: 'motor', load: 'load', capacitor_bank: 'load', harmonic_filter: 'load', vfd: 'vfd',
  watthour_meter: 'meter', demand_meter: 'meter',
};

/**
 * Expand a topology spec into a fully tagged electrical model.
 * Every device gets its equipment tag here, so the drawing, the graph and the
 * telemetry all refer to the same identifiers.
 */
export function buildModel(spec) {
  const rng = mulberry32(spec.seed);
  const tag = makeTagger(rng);

  // `attrs` holds only values that are printed on the drawing, so the graph
  // stays fully recoverable from the image. Semantics that are not drawn go in
  // `meta`, which is excluded from extraction scoring.
  const nodes = [];   // { key, tag, type, attrs, meta, role }
  const edges = [];   // { from, to, rel, attrs }
  const meters = [];  // telemetry-bearing devices
  const add = (key, tag, type, attrs = {}, role = null, meta = {}) => {
    nodes.push({ key, tag, type, attrs, meta, role });
    return key;
  };
  const link = (from, to, rel = 'power', attrs = {}) => { edges.push({ from, to, rel, attrs }); };

  const sections = [];

  for (const sec of spec.sections) {
    const busTag = tag('BUS', ...RANGES.BUS);
    const busKey = `bus${sec.key}`;
    add(busKey, busTag, 'bus', { voltage: spec.lv }, 'bus', { configuration: '3P+N', section: sec.key });

    const incomers = [];
    for (let i = 0; i < sec.incomers.length; i++) {
      const inc = sec.incomers[i];
      const sfx = `${sec.key}${i + 1}`;

      const srcKey = add(`src${sfx}`, inc.srcLabel, inc.src, {
        voltage: inc.src === 'utility' ? spec.mv : spec.lv,
        ...(inc.gen ? { rating: inc.gen } : {}),
      }, 'source', { source_type: inc.src, bus_section: sec.key });

      let upstream = srcKey;

      if (inc.arrester) {
        const laTag = tag('LA', ...RANGES.LA);
        add(`la${sfx}`, laTag, 'surge_arrester', { voltage: spec.mv }, 'protection');
        link(srcKey, `la${sfx}`, 'protection');
      }

      let xfmrTag = null;
      if (inc.xfmr) {
        xfmrTag = tag('TX', ...RANGES.TX);
        add(`tx${sfx}`, xfmrTag, inc.xfmr, {
          rating: `${inc.kva} kVA`,
          voltage: `${spec.mv} / ${spec.lv}`,
        }, 'transformer', {
          kva: inc.kva, winding: inc.xfmr.replace('transformer_', ''),
          impedance: `${(4.5 + rng() * 2.5).toFixed(2)}%Z`,
        });
        link(upstream, `tx${sfx}`);
        upstream = `tx${sfx}`;
      }

      const cbTag = tag('CB', ...RANGES.CB);
      add(`mcb${sfx}`, cbTag, inc.mainKind || 'breaker', {
        rating: `${inc.mainType} / ${inc.main} / 3P`,
      }, 'main_breaker', { ampacity: inc.main, ansi_device: '52', bus_section: sec.key });
      link(upstream, `mcb${sfx}`);

      const ctTag = tag('TA', ...RANGES.TA);
      add(`mct${sfx}`, ctTag, 'ct', { rating: `3 CTs / ${inc.ct}` }, 'ct', { ratio: inc.ct, phases: 3 });
      link(`mcb${sfx}`, `mct${sfx}`);
      link(`mct${sfx}`, busKey);

      const pmTag = tag('PM', ...RANGES.PM);
      const meterType = inc.meterKind === 'demand' ? 'demand_meter' : 'watthour_meter';
      add(`mpm${sfx}`, pmTag, meterType, { rating: 'kW / kWh' }, 'meter',
        { channel: 'REMOTE / I01', measures: 'section incomer', bus_section: sec.key });
      link(`mct${sfx}`, `mpm${sfx}`, 'measurement', { note: 'CT secondary' });

      incomers.push({ key: `mcb${sfx}`, cbTag, ctTag, meterTag: pmTag, xfmrTag, srcType: inc.src, srcLabel: inc.srcLabel });
      meters.push({ tag: pmTag, role: 'incomer', sec: sec.key, incomerIdx: incomers.length - 1 });
    }

    sections.push({
      key: sec.key, busKey, busTag, incomers,
      baseKw: sec.baseKw, basePf: +pick(rng, [0.89, 0.93]).toFixed(4),
      feeders: [],
    });
  }

  // Bus tie between the first two sections.
  let tie = null;
  if (spec.tie && sections.length >= 2) {
    const tieTag = tag('CB', ...RANGES.CB);
    const tieType = spec.tie.type === 'ats' ? 'ats' : 'bus_tie';
    add('tie', tieTag, tieType, { rating: `${spec.tie.rating} / 3P / ${spec.tie.note}` }, 'tie',
      { ampacity: spec.tie.rating, normal_position: 'open', links: [sections[0].busTag, sections[1].busTag] });
    link(sections[0].busKey, 'tie');
    link('tie', sections[1].busKey);
    tie = { key: 'tie', tag: tieTag, type: tieType, note: spec.tie.note };
  }

  // Feeders.
  let fi = 0;
  for (const f of spec.feeders) {
    fi++;
    const sec = sections.find((s) => s.key === f.sec);
    const sfx = `f${fi}`;

    const cbTag = tag('CB', ...RANGES.CB);
    add(`${sfx}cb`, cbTag, 'breaker', { rating: `MCCB / ${f.rating} / 3P` }, 'feeder_breaker',
      { ampacity: f.rating, ansi_device: '52', bus_section: sec.key });
    link(sec.busKey, `${sfx}cb`, 'power', { cable: cableFor(f.rating) });

    const ctTag = tag('TA', ...RANGES.TA);
    add(`${sfx}ct`, ctTag, 'ct', { rating: `3 CTs / ${f.ct}` }, 'ct', { ratio: f.ct, phases: 3 });
    link(`${sfx}cb`, `${sfx}ct`);

    const pmTag = tag('PM', ...RANGES.PM);
    add(`${sfx}pm`, pmTag, 'watthour_meter', { rating: 'kW / kWh' }, 'meter',
      { channel: `REMOTE / I0${1 + (fi % 2)}`, bus_section: sec.key });
    link(`${sfx}ct`, `${sfx}pm`, 'measurement', { note: 'CT secondary' });

    let head = `${sfx}ct`;

    if (f.prot) {
      const protTag = tag('CB', ...RANGES.CB);
      add(`${sfx}pr`, protTag, f.prot, { rating: f.rating }, 'protection');
      link(head, `${sfx}pr`);
      head = `${sfx}pr`;
    }

    if (f.panel && f.loads.length > 1) {
      const pnlTag = tag('FD', ...RANGES.FD);
      add(`${sfx}pnl`, pnlTag, 'hub', { rating: '3P+N' }, 'panel',
        { description: 'FEEDER DISTRIBUTION BOARD', bus_section: sec.key });
      link(head, `${sfx}pnl`);
      head = `${sfx}pnl`;
    }

    const branches = [];
    for (let li = 0; li < f.loads.length; li++) {
      const l = f.loads[li];
      const bsfx = `${sfx}l${li + 1}`;
      const prof = PROFILES[l.svc];

      if (l.kind === 'vfd_motor' || l.kind === 'motor') {
        const bcbTag = tag('CB', ...RANGES.CB);
        add(`${bsfx}cb`, bcbTag, 'breaker', { rating: `MCCB / ${branchAmps(l.kw, spec.llv)} / 3P` }, 'branch_breaker');
        link(head, `${bsfx}cb`);
        let up = `${bsfx}cb`;

        let drvTag = null;
        if (l.kind === 'vfd_motor') {
          drvTag = tag('DRV', ...RANGES.DRV);
          add(`${bsfx}drv`, drvTag, 'vfd', { rating: 'VFD / OL' }, 'drive', { duty: '3~', drives: null });
          link(up, `${bsfx}drv`);
          up = `${bsfx}drv`;
        }

        const mtrTag = tag('MTR', ...RANGES.MTR);
        add(`${bsfx}m`, mtrTag, 'motor', {
          rating: `${l.kw} kW / ${l.svc}`,
        }, 'motor', {
          power_kw: l.kw, application: l.svc, service: serviceName(l.svc),
          started_by: drvTag ?? 'DOL', bus_section: sec.key,
        });
        if (drvTag) nodes.find((n) => n.key === `${bsfx}drv`).meta.drives = mtrTag;
        link(up, `${bsfx}m`);
        branches.push({ tag: mtrTag, kw: l.kw, svc: l.svc, drive: drvTag });
      } else {
        const ldKey = `${bsfx}ld`;
        const pnlTag = tag('PNL', ...RANGES.PNL);
        add(ldKey, pnlTag, 'load', {
          rating: `${l.label} / ${l.kw} kW`,
        }, 'load', { power_kw: l.kw, description: l.label, application: l.svc, bus_section: sec.key });
        link(head, ldKey);
        branches.push({ tag: pnlTag, kw: l.kw, svc: l.svc, drive: null });
      }
      void prof;
    }

    if (f.extra) {
      const xTag = tag(f.extra === 'capacitor_bank' ? 'CAP' : 'HF',
        ...(f.extra === 'capacitor_bank' ? RANGES.CAP : RANGES.HF));
      add(`${sfx}x`, xTag, f.extra, { rating: f.extraRating }, 'compensation');
      link(head, `${sfx}x`);
    }

    const peakKw = branches.reduce((a, b) => a + b.kw, 0) || 0;
    const svcMix = branches.length ? branches[0].svc : 'PNL';
    const prof = PROFILES[svcMix];

    const feeder = {
      key: sfx, cbTag, ctTag, meterTag: pmTag, sec: sec.key,
      peakKw: peakKw * (branches.length > 2 ? 0.88 : 0.95), // diversity factor
      svc: svcMix,
      pf: +pick(rng, prof.pf).toFixed(16),
      branches,
    };
    sec.feeders.push(feeder);
    meters.push({ tag: pmTag, role: 'feeder', sec: sec.key, feeder });
  }

  const states = buildStates(spec, sections, tie);

  return {
    ...spec, nodes, edges, meters, sections, tie, states,
    switchable: switchableList(sections, tie),
  };
}

function cableFor(rating) {
  const a = parseInt(rating, 10);
  if (a >= 3000) return '2 x 4#500 MCM';
  if (a >= 1000) return '4#500 MCM';
  if (a >= 600) return '3#350 MCM';
  if (a >= 400) return '3#4/0 AWG';
  if (a >= 250) return '3#2/0 AWG';
  if (a >= 160) return '3#1/0 AWG';
  return '3#4 AWG';
}

function branchAmps(kw, llv) {
  const a = (kw * 1000) / (Math.sqrt(3) * llv * 0.9);
  const frames = [16, 20, 25, 32, 40, 50, 63, 80, 100, 125, 160, 200, 250, 320, 400, 500, 630, 800];
  return `${frames.find((f) => f >= a * 1.25) ?? 1000} A`;
}

const SERVICE_NAMES = {
  CH: 'PACKAGED CHILLER', CHWP: 'CHILLED-WATER PUMP', CWP: 'CONDENSER-WATER PUMP',
  AHU: 'AIR HANDLING UNIT', EF: 'EXHAUST FAN', COMP: 'COMPRESSOR', COND: 'CONDENSER',
  PROC: 'PROCESS DRIVE', MILL: 'GRINDING MILL', BLOW: 'BLOWER', RWP: 'RAW-WATER PUMP',
  PDU: 'IT DISTRIBUTION', CRAC: 'COMPUTER-ROOM AC', LTG: 'LIGHTING', PNL: 'DISTRIBUTION PANEL',
  LIFE: 'LIFE SAFETY', MED: 'MEDICAL EQUIPMENT', BAG: 'BAGGAGE HANDLING', EV: 'EV CHARGING',
  FEED: 'DISTRIBUTION FEEDER',
};
const serviceName = (s) => SERVICE_NAMES[s] ?? s;

// Switchable devices: the main incomer breakers plus the tie.
function switchableList(sections, tie) {
  const out = [];
  for (const s of sections) for (const inc of s.incomers) out.push({ tag: inc.cbTag, kind: 'main', sec: s.key, incomer: inc });
  if (tie) out.push({ tag: tie.tag, kind: 'tie' });
  return out;
}

/**
 * Permitted switching configurations. S0 is the normal running arrangement;
 * S1 is the momentary open-transition step; S2 is the alternate arrangement.
 */
function buildStates(spec, sections, tie) {
  const mains = sections.flatMap((s) => s.incomers.map((i) => ({ tag: i.cbTag, sec: s.key })));
  const closeAll = (v) => Object.fromEntries(mains.map((m) => [m.tag, v]));

  if (sections.length >= 2 && tie) {
    const a = sections[0].incomers[0].cbTag;
    const b = sections[1].incomers[0].cbTag;
    const normal = spec.sections[1].incomers[0].src === 'generator';
    // With a generator on section B the generator sits idle in normal running.
    const s0 = { ...closeAll(true), [b]: !normal, [tie.tag]: normal };
    return [
      { id: 'S0', breakers: { ...s0 }, transition: false, desc: 'NORMAL RUNNING' },
      { id: 'S1', breakers: { ...closeAll(false), [b]: normal ? false : true, [tie.tag]: false }, transition: true, desc: 'OPEN TRANSITION' },
      { id: 'S2', breakers: { ...closeAll(false), [b]: true, [tie.tag]: true }, transition: false, desc: normal ? 'GENERATOR SUPPLYING VIA TIE' : 'SUPPLY B SUPPLYING BOTH SECTIONS' },
    ];
  }

  if (sections.length === 1 && sections[0].incomers.length >= 2) {
    const [p, q] = sections[0].incomers;
    return [
      { id: 'S0', breakers: { ...closeAll(false), [p.cbTag]: true }, transition: false, desc: 'PRIMARY INCOMER' },
      { id: 'S1', breakers: { ...closeAll(false) }, transition: true, desc: 'OPEN TRANSITION' },
      { id: 'S2', breakers: { ...closeAll(false), [q.cbTag]: true }, transition: false, desc: 'STANDBY INCOMER' },
    ];
  }

  return [
    { id: 'S0', breakers: closeAll(true), transition: false, desc: 'NORMAL RUNNING' },
    { id: 'S1', breakers: closeAll(false), transition: true, desc: 'INCOMER OPEN / OUTAGE' },
  ];
}

// ── Schematex SLD source ──────────────────────────────────────────────────────

const q = (s) => `"${String(s).replace(/"/g, "'")}"`;

export function toDSL(m, edgeOrder = 'power-first') {
  const L = [];
  L.push(`sld ${q(`${m.id} — ${m.title}`)}`);
  L.push(`# ${m.subtitle}`);
  L.push(`# ${m.lv}, 3PH, 4W, ${m.hz} Hz`);
  L.push('');

  for (const n of m.nodes) {
    const attrs = [`label: ${q(n.tag)}`];
    for (const [k, v] of Object.entries(n.attrs)) {
      if (v == null || v === '') continue;
      attrs.push(`${k}: ${q(v)}`);
    }
    L.push(`${n.key} = ${n.type} [${attrs.join(', ')}]`);
  }

  L.push('');
  // The router places wires in declaration order and can fail to find a route
  // for a dense sheet, so the order is selectable and the generator retries.
  const rank = (e) => (e.rel === 'measurement' ? 1 : 0);
  const ordered = edgeOrder === 'declared'
    ? [...m.edges]
    : [...m.edges].sort((a, b) => (edgeOrder === 'measurement-first' ? rank(b) - rank(a) : rank(a) - rank(b)));
  for (const e of ordered) {
    // Measurement links carry no annotation: as on a real drawing, the dashed
    // line style is the only cue that distinguishes them from a power path.
    const a = e.attrs.cable ? [`cable: ${q(e.attrs.cable)}`] : [];
    L.push(`${e.from} -> ${e.to}${a.length ? ` [${a.join(', ')}]` : ''}`);
  }
  return L.join('\n') + '\n';
}

// ── Ground-truth graph ────────────────────────────────────────────────────────

function pathToPolyline(d) {
  const nums = String(d).match(/-?\d+(?:\.\d+)?/g)?.map(Number) ?? [];
  const pts = [];
  for (let i = 0; i + 1 < nums.length; i += 2) pts.push([round(nums[i]), round(nums[i + 1])]);
  return pts;
}

const round = (v) => Math.round(v * 100) / 100;

// Schematex marks side labels as `lt-sld-<role>-side`; the trailing "-side"
// must not be matched as part of the role name.
const labelRole = (cn = '') => {
  const m = /lt-sld-([a-z]+)-side/.exec(cn);
  if (m) return m[1];
  return cn.includes('cable') ? 'cable' : 'other';
};

/**
 * Assemble the ground-truth graph, fusing the logical model with the geometry
 * produced by the renderer. Because the graph generates the image, the
 * annotation is exact by construction.
 */
export function toGraph(m, layout, pngScale) {
  const byKey = new Map(m.nodes.map((n) => [n.key, n]));
  const geo = new Map(layout.nodes.map((ln) => [ln.node.id, ln]));

  const nodes = m.nodes.map((n) => {
    const g = geo.get(n.key);
    const bbox = g
      ? [round(g.x - g.halfWidth), round(g.topY), round(g.x + g.halfWidth), round(g.bottomY)]
      : null;

    const text_labels = (g?.labels ?? []).map((l) => ({
      text: l.text,
      role: labelRole(l.className),
      bbox: [round(l.x), round(l.y - l.fontSize), round(l.x + l.width), round(l.y + 3)],
      font_size: l.fontSize,
      placement: 'side',
    }));

    // Some symbols (the panel/hub block) print their tag inside the symbol
    // rather than beside it, so it never reaches the side-label list.
    if (g && !text_labels.some((t) => t.text === n.tag)) {
      text_labels.unshift({
        text: n.tag, role: 'id',
        bbox: [round(g.x - g.halfWidth), round(g.y - 7), round(g.x + g.halfWidth), round(g.y + 5)],
        font_size: 11, placement: 'inside',
      });
    }

    return {
      id: n.tag,
      dsl_id: n.key,
      type: n.type,
      class: CLASS_OF[n.type] ?? 'other',
      role: n.role,
      label: n.tag,
      attributes: n.attrs,   // printed on the drawing — recoverable from the image
      metadata: n.meta,      // not printed — excluded from extraction scoring
      bbox,
      center: g ? [round(g.x), round(g.y)] : null,
      level: g ? g.level : null,
      text_labels,
    };
  });

  const edgeGeo = new Map(layout.edges.map((e) => [`${e.from}->${e.to}`, e]));
  const edges = m.edges.map((e, i) => {
    const g = edgeGeo.get(`${e.from}->${e.to}`);
    return {
      id: `E${String(i + 1).padStart(3, '0')}`,
      source: byKey.get(e.from).tag,
      target: byKey.get(e.to).tag,
      source_dsl_id: e.from,
      target_dsl_id: e.to,
      relationship: e.rel,
      line_style: e.rel === 'measurement' ? 'dashed' : 'solid',
      attributes: e.attrs,
      net: g?.net ?? null,
      polyline: g ? pathToPolyline(g.path) : null,
    };
  });

  const nets = {};
  for (const e of edges) if (e.net != null) (nets[e.net] ??= []).push(e.id);

  return {
    diagram_id: m.id,
    name: m.name,
    title: m.title,
    subtitle: m.subtitle,
    standard: 'IEEE Std 315 (ANSI Y32.2)',
    system: { mv: m.mv, lv: m.lv, ll_voltage_v: m.llv, frequency_hz: m.hz, tz_offset: m.tz },
    image: {
      svg: 'plant.svg', png: 'plant.png',
      width: round(layout.width), height: round(layout.height),
      png_scale: pngScale,
      note: 'bbox coordinates are in SVG user units; multiply by png_scale for PNG pixels',
    },
    counts: {
      nodes: nodes.length,
      edges: edges.length,
      power_edges: edges.filter((e) => e.relationship === 'power').length,
      measurement_edges: edges.filter((e) => e.relationship === 'measurement').length,
      meters: m.meters.length,
    },
    nodes,
    edges,
    nets,
    switch_states: m.states.map((s) => ({
      id: s.id, description: s.desc, open_transition: s.transition,
      breakers: Object.fromEntries(Object.entries(s.breakers).map(([k, v]) => [k, v ? 'closed' : 'open'])),
    })),
    meters: m.meters.map((mt) => ({
      tag: mt.tag, role: mt.role, bus_section: mt.sec,
      measures: mt.role === 'feeder' ? mt.feeder.branches.map((b) => b.tag) : 'section incomer',
    })),
  };
}

export { CLASS_OF };
