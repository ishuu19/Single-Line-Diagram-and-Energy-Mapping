// Procedurally generated plant topology specifications — the "bulk" corpus.
//
// Unlike the 10 hand-authored PLANTS in plants.mjs (which mirror the reference
// drawing closely and ship full telemetry), this file produces a large,
// diverse batch of *smaller* single-line diagrams for graph-extraction
// training data. Each spec is built the same way a hand-authored one is
// (sections -> incomers -> [xfmr] -> CB -> CT -> bus, feeders -> CB -> CT ->
// [panel] -> loads), but:
//
//   - node count is kept to a precise 10-25 node band (~1/3 to 1/2 of the
//     27-81 node range of the core corpus) by validating each candidate
//     spec against the real builder (buildModel) and trimming/growing it
//     until it lands in range;
//   - topology, domain, voltage system and load mix are drawn from a wide
//     archetype pool with a per-spec seeded RNG, so no two plants are
//     structurally identical;
//   - `bulk: true` tells generate.mjs that a rare unroutable topology in this
//     batch should be skipped and logged rather than aborting the whole run
//     (telemetry inclusion is controlled the same way as the core tier, via
//     generate.mjs's --no-data/--days flags).
//
// Regeneration is fully deterministic: GEN_SEED_BASE fixes the design RNG,
// and each spec's own `seed` fixes tag allocation, exactly as in plants.mjs.

import { mulberry32 } from './build.mjs';
import { buildModel } from './build.mjs';
import { vfd, dol, load } from './plants.mjs';

const GEN_SEED_BASE = 424242;
const MIN_NODES = 10;
const MAX_NODES = 25;

const choice = (rng, arr) => arr[Math.floor(rng() * arr.length)];
const int = (rng, lo, hi) => lo + Math.floor(rng() * (hi - lo + 1));
const chance = (rng, p) => rng() < p;

// ── Voltage / frequency / timezone systems ─────────────────────────────────
// Each tuple is a plausible real-world MV/LV pairing so generated drawings
// stay electrically sane (voltage ratios, Hz-region-appropriate tz offsets).
const SYSTEMS = [
  { mv: '13.8kV', lv: '480Y/277V', llv: 480, hz: 60, tz: ['-04:00', '-05:00', '-06:00', '-07:00', '-08:00'] },
  { mv: '12.47kV', lv: '208Y/120V', llv: 208, hz: 60, tz: ['-05:00', '-06:00'] },
  { mv: '11kV', lv: '400Y/230V', llv: 400, hz: 50, tz: ['+00:00', '+01:00', '+02:00', '+08:00'] },
  { mv: '22kV', lv: '400Y/230V', llv: 400, hz: 50, tz: ['+10:00', '+07:00'] },
  { mv: '20kV', lv: '400Y/230V', llv: 400, hz: 50, tz: ['+01:00', '+02:00'] },
  { mv: '33kV', lv: '400Y/230V', llv: 400, hz: 50, tz: ['+05:30', '+02:00'] },
  { mv: '6.6kV', lv: '400Y/230V', llv: 400, hz: 50, tz: ['+09:00'] },
  { mv: '138kV', lv: '13.8kV', llv: 13800, hz: 60, tz: ['-06:00', '-05:00'] },
];

// ── Domain archetypes ───────────────────────────────────────────────────────
// `services` entries: { svc, kind, kwRange, label? }. `label` only matters
// for kind:'load' (fed to the load() helper as the panel text).
const ARCHETYPES = [
  {
    domain: 'Office Tower', title: 'OFFICE TOWER / ELECTRICAL DISTRIBUTION',
    subtitle: 'BUILDING SERVICES SINGLE-LINE DIAGRAM', allowsGenerator: true, allowsRenewable: false,
    services: [
      { svc: 'LTG', kind: 'load', kwRange: [30, 90], label: 'FLOOR LIGHTING' },
      { svc: 'PNL', kind: 'load', kwRange: [40, 110], label: 'TENANT PANEL' },
      { svc: 'CRAC', kind: 'vfd_motor', kwRange: [15, 45] },
      { svc: 'EF', kind: 'motor', kwRange: [7, 22] },
    ],
  },
  {
    domain: 'Retail Store', title: 'RETAIL FACILITY / ELECTRICAL DISTRIBUTION',
    subtitle: 'STORE SERVICES SINGLE-LINE DIAGRAM', allowsGenerator: false, allowsRenewable: false,
    services: [
      { svc: 'LTG', kind: 'load', kwRange: [20, 55], label: 'SALES FLOOR LIGHTING' },
      { svc: 'PNL', kind: 'load', kwRange: [25, 70], label: 'HOUSE PANEL' },
      { svc: 'AHU', kind: 'vfd_motor', kwRange: [11, 30] },
      { svc: 'EF', kind: 'motor', kwRange: [5, 15] },
    ],
  },
  {
    domain: 'School Campus', title: 'SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION',
    subtitle: 'CAMPUS SERVICES SINGLE-LINE DIAGRAM', allowsGenerator: true, allowsRenewable: true,
    services: [
      { svc: 'LTG', kind: 'load', kwRange: [25, 60], label: 'CLASSROOM LIGHTING' },
      { svc: 'PNL', kind: 'load', kwRange: [30, 80], label: 'ADMIN PANEL' },
      { svc: 'AHU', kind: 'vfd_motor', kwRange: [15, 37] },
      { svc: 'EF', kind: 'motor', kwRange: [5, 15] },
    ],
  },
  {
    domain: 'Community Hospital Wing', title: 'HOSPITAL WING / ELECTRICAL DISTRIBUTION',
    subtitle: 'NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM', allowsGenerator: true, allowsRenewable: false,
    services: [
      { svc: 'LIFE', kind: 'load', kwRange: [25, 60], label: 'LIFE SAFETY BRANCH' },
      { svc: 'MED', kind: 'load', kwRange: [30, 75], label: 'CRITICAL BRANCH' },
      { svc: 'AHU', kind: 'vfd_motor', kwRange: [15, 37] },
      { svc: 'LTG', kind: 'load', kwRange: [20, 45], label: 'WARD LIGHTING' },
    ],
  },
  {
    domain: 'Water Pump Station', title: 'WATER PUMP STATION / ELECTRICAL DISTRIBUTION',
    subtitle: 'PUMPING PLANT SINGLE-LINE DIAGRAM', allowsGenerator: false, allowsRenewable: false, dualIncomerBias: true,
    services: [
      { svc: 'RWP', kind: 'vfd_motor', kwRange: [22, 75] },
      { svc: 'BLOW', kind: 'vfd_motor', kwRange: [15, 45] },
      { svc: 'PNL', kind: 'load', kwRange: [15, 40], label: 'DOSING PANEL' },
    ],
  },
  {
    domain: 'Light Manufacturing Workshop', title: 'MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION',
    subtitle: 'PROCESS POWER SINGLE-LINE DIAGRAM', allowsGenerator: true, allowsRenewable: false, allowsCompensation: true,
    services: [
      { svc: 'PROC', kind: 'vfd_motor', kwRange: [30, 90] },
      { svc: 'COMP', kind: 'motor', kwRange: [22, 55] },
      { svc: 'PNL', kind: 'load', kwRange: [20, 50], label: 'SHOP AUXILIARIES' },
      { svc: 'LTG', kind: 'load', kwRange: [15, 35], label: 'SHOP LIGHTING' },
    ],
  },
  {
    domain: 'Cold Room Facility', title: 'COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION',
    subtitle: 'REFRIGERATION SINGLE-LINE DIAGRAM', allowsGenerator: true, allowsRenewable: false,
    services: [
      { svc: 'COMP', kind: 'vfd_motor', kwRange: [37, 90] },
      { svc: 'COND', kind: 'motor', kwRange: [15, 37] },
      { svc: 'EF', kind: 'motor', kwRange: [5, 15] },
      { svc: 'PNL', kind: 'load', kwRange: [15, 35], label: 'DOCK PANEL' },
    ],
  },
  {
    domain: 'Telecom Shelter', title: 'TELECOM SITE / ELECTRICAL DISTRIBUTION',
    subtitle: 'SHELTER POWER SINGLE-LINE DIAGRAM', allowsGenerator: true, allowsRenewable: false, smallKva: true,
    services: [
      { svc: 'PDU', kind: 'load', kwRange: [20, 55], label: 'RECTIFIER PDU' },
      { svc: 'CRAC', kind: 'vfd_motor', kwRange: [7, 22] },
      { svc: 'LTG', kind: 'load', kwRange: [4, 12], label: 'SHELTER LIGHTING' },
    ],
  },
  {
    domain: 'EV Charging Hub', title: 'EV CHARGING HUB / ELECTRICAL DISTRIBUTION',
    subtitle: 'CHARGING PLAZA SINGLE-LINE DIAGRAM', allowsGenerator: false, allowsRenewable: true,
    services: [
      { svc: 'EV', kind: 'load', kwRange: [80, 240], label: 'DC FAST CHARGER BANK' },
      { svc: 'PNL', kind: 'load', kwRange: [15, 35], label: 'CANOPY AUXILIARIES' },
      { svc: 'LTG', kind: 'load', kwRange: [10, 25], label: 'FORECOURT LIGHTING' },
    ],
  },
  {
    domain: 'Agricultural Greenhouse', title: 'GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION',
    subtitle: 'CULTIVATION SERVICES SINGLE-LINE DIAGRAM', allowsGenerator: false, allowsRenewable: true,
    services: [
      { svc: 'RWP', kind: 'motor', kwRange: [11, 30] },
      { svc: 'EF', kind: 'vfd_motor', kwRange: [7, 22] },
      { svc: 'LTG', kind: 'load', kwRange: [30, 80], label: 'GROW LIGHTING' },
      { svc: 'PNL', kind: 'load', kwRange: [10, 25], label: 'CONTROL PANEL' },
    ],
  },
  {
    domain: 'Industrial Laundry', title: 'LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION',
    subtitle: 'PROCESS SINGLE-LINE DIAGRAM', allowsGenerator: false, allowsRenewable: false,
    services: [
      { svc: 'PROC', kind: 'vfd_motor', kwRange: [22, 55] },
      { svc: 'COMP', kind: 'motor', kwRange: [15, 37] },
      { svc: 'EF', kind: 'motor', kwRange: [5, 15] },
      { svc: 'PNL', kind: 'load', kwRange: [10, 30], label: 'UTILITY PANEL' },
    ],
  },
  {
    domain: 'Food Processing Plant', title: 'FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION',
    subtitle: 'PROCESS SINGLE-LINE DIAGRAM', allowsGenerator: true, allowsRenewable: false, allowsCompensation: true,
    services: [
      { svc: 'PROC', kind: 'vfd_motor', kwRange: [30, 75] },
      { svc: 'COMP', kind: 'motor', kwRange: [22, 55] },
      { svc: 'COND', kind: 'motor', kwRange: [15, 37] },
      { svc: 'PNL', kind: 'load', kwRange: [10, 30], label: 'PACKAGING PANEL' },
    ],
  },
  {
    domain: 'Marina Boatyard', title: 'MARINA FACILITY / ELECTRICAL DISTRIBUTION',
    subtitle: 'SHORE POWER SINGLE-LINE DIAGRAM', allowsGenerator: true, allowsRenewable: false,
    services: [
      { svc: 'PNL', kind: 'load', kwRange: [30, 80], label: 'SHORE POWER PANEL' },
      { svc: 'EF', kind: 'motor', kwRange: [5, 15] },
      { svc: 'LTG', kind: 'load', kwRange: [10, 25], label: 'DOCK LIGHTING' },
    ],
  },
  {
    domain: 'Mining Conveyor Node', title: 'CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION',
    subtitle: 'MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM', allowsGenerator: false, allowsRenewable: false, allowsCompensation: true, largeKva: true,
    services: [
      { svc: 'MILL', kind: 'vfd_motor', kwRange: [200, 600] },
      { svc: 'BLOW', kind: 'motor', kwRange: [75, 200] },
      { svc: 'PNL', kind: 'load', kwRange: [40, 90], label: 'MCC AUXILIARY BOARD' },
    ],
  },
  {
    domain: 'Apartment Complex', title: 'RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION',
    subtitle: 'HOUSE LOAD SINGLE-LINE DIAGRAM', allowsGenerator: true, allowsRenewable: true,
    services: [
      { svc: 'LTG', kind: 'load', kwRange: [20, 55], label: 'COMMON AREA LIGHTING' },
      { svc: 'PNL', kind: 'load', kwRange: [40, 100], label: 'RISER PANEL' },
      { svc: 'CRAC', kind: 'vfd_motor', kwRange: [11, 30] },
      { svc: 'EF', kind: 'motor', kwRange: [5, 15] },
    ],
  },
  {
    domain: 'Container Reefer Yard', title: 'REEFER YARD / ELECTRICAL DISTRIBUTION',
    subtitle: 'CONTAINER YARD SINGLE-LINE DIAGRAM', allowsGenerator: false, allowsRenewable: false,
    services: [
      { svc: 'PNL', kind: 'load', kwRange: [60, 150], label: 'REEFER RACK PANEL' },
      { svc: 'EF', kind: 'motor', kwRange: [5, 15] },
      { svc: 'LTG', kind: 'load', kwRange: [15, 35], label: 'YARD LIGHTING' },
    ],
  },
  {
    domain: 'Craft Brewery', title: 'BREWERY / ELECTRICAL DISTRIBUTION',
    subtitle: 'PROCESS SINGLE-LINE DIAGRAM', allowsGenerator: false, allowsRenewable: false,
    services: [
      { svc: 'PROC', kind: 'vfd_motor', kwRange: [15, 45] },
      { svc: 'COMP', kind: 'motor', kwRange: [15, 37] },
      { svc: 'COND', kind: 'motor', kwRange: [11, 30] },
      { svc: 'PNL', kind: 'load', kwRange: [10, 25], label: 'CELLAR PANEL' },
    ],
  },
  {
    domain: 'Print & Packaging Shop', title: 'PRINT SHOP / ELECTRICAL DISTRIBUTION',
    subtitle: 'PROCESS SINGLE-LINE DIAGRAM', allowsGenerator: false, allowsRenewable: false,
    services: [
      { svc: 'PROC', kind: 'vfd_motor', kwRange: [15, 37] },
      { svc: 'PNL', kind: 'load', kwRange: [15, 40], label: 'PRESS FLOOR PANEL' },
      { svc: 'LTG', kind: 'load', kwRange: [10, 25], label: 'SHOP LIGHTING' },
    ],
  },
  {
    domain: 'Primary Substation Feeder Bay', title: 'PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY',
    subtitle: 'SINGLE-LINE DIAGRAM / POWER AND PROTECTION', allowsGenerator: false, allowsRenewable: false,
    substation: true,
    services: [
      { svc: 'FEED', kind: 'load', kwRange: [400, 1200], label: 'DISTRIBUTION FEEDER' },
      { svc: 'PNL', kind: 'load', kwRange: [60, 150], label: 'STATION SERVICE' },
    ],
  },
  {
    domain: 'Rooftop Solar Campus', title: 'CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION',
    subtitle: 'SINGLE-LINE DIAGRAM WITH PV ARRAY', allowsGenerator: false, allowsRenewable: true, forceRenewable: true,
    services: [
      { svc: 'PNL', kind: 'load', kwRange: [40, 100], label: 'ACADEMIC BLOCK PANEL' },
      { svc: 'AHU', kind: 'vfd_motor', kwRange: [15, 37] },
      { svc: 'LTG', kind: 'load', kwRange: [15, 35], label: 'SITE LIGHTING' },
    ],
  },
];

const MAIN_FRAMES = ['160 A', '250 A', '400 A', '630 A', '800 A', '1000 A', '1600 A', '2000 A', '2500 A', '3000 A'];
const FEEDER_FRAMES = ['63 A', '100 A', '160 A', '250 A', '400 A'];
const TIE_NOTES_NORMAL = ['NORMALLY OPEN / INTERLOCKED', 'NORMALLY OPEN / KEY INTERLOCKED', 'NORMALLY OPEN / AUTO CLOSE ON LOSS'];
const SITE_TAGS = ['A', 'B', 'C', 'D', 'E', 'North', 'South', 'East', 'West', 'Central'];

const ctFor = (ratingStr) => `${ratingStr.split(' ')[0]}/5 A`;

function pickMain(rng, arch) {
  const pool = arch.smallKva ? MAIN_FRAMES.slice(0, 4) : arch.largeKva ? MAIN_FRAMES.slice(5) : MAIN_FRAMES.slice(1, 8);
  return choice(rng, pool);
}

function pickFeederRating(rng, mainRating) {
  const mainNum = parseInt(mainRating, 10);
  const pool = FEEDER_FRAMES.filter((f) => parseInt(f, 10) < mainNum);
  return pool.length ? choice(rng, pool) : FEEDER_FRAMES[0];
}

function kvaFor(mainRating, sys) {
  const a = parseInt(mainRating, 10);
  return Math.round((a * sys.llv * Math.sqrt(3)) / 1000 / 10) * 10;
}

function buildIncomer(rng, arch, sys, srcKind, label) {
  const main = pickMain(rng, arch);
  const xfmr = srcKind === 'utility' && !chance(rng, 0.12);
  const inc = {
    src: srcKind, srcLabel: label,
    main, mainType: chance(rng, 0.75) ? 'ACB' : 'MCCB',
    ct: ctFor(main),
  };
  if (xfmr) {
    inc.kva = kvaFor(main, sys);
    inc.xfmr = choice(rng, ['transformer_dy', 'transformer_yd']);
  }
  if (srcKind === 'generator') inc.gen = `${Math.round(kvaFor(main, sys) * 0.9 / 10) * 10} kW`;
  if (arch.substation && chance(rng, 0.3)) inc.arrester = true;
  return inc;
}

function makeLoadGroup(rng, arch) {
  const entry = choice(rng, arch.services);
  const kw = int(rng, entry.kwRange[0], entry.kwRange[1]);
  if (entry.kind === 'vfd_motor') return vfd(kw, entry.svc, 1);
  if (entry.kind === 'motor') return dol(kw, entry.svc, 1);
  return load(kw, entry.svc, entry.label, 1);
}

function makeFeeder(rng, arch, sec, mainRating, extraAllowed) {
  const rating = pickFeederRating(rng, mainRating);
  const nLoads = chance(rng, 0.32) ? 2 : 1;
  const loads = [];
  for (let i = 0; i < nLoads; i++) loads.push(...makeLoadGroup(rng, arch));
  const feeder = { sec, rating, ct: ctFor(rating), panel: true, loads };
  if (extraAllowed && arch.allowsCompensation && chance(rng, 0.1)) {
    feeder.extra = chance(rng, 0.5) ? 'capacitor_bank' : 'harmonic_filter';
    feeder.extraRating = feeder.extra === 'capacitor_bank' ? `${int(rng, 50, 200)} kVAR` : '5th / 7th';
  }
  if (arch.substation && chance(rng, 0.2)) feeder.prot = choice(rng, ['recloser', 'sectionalizer', 'fuse']);
  return feeder;
}

// Per-load node cost, mirroring buildModel's branch construction.
const loadCost = (l) => (l.kind === 'vfd_motor' ? 3 : l.kind === 'motor' ? 2 : 1);

/**
 * Reduce nodes to <= MAX_NODES, in order of least structural disruption:
 * demote the costliest motor/VFD load to a plain metered load, then drop
 * surplus loads, then drop surplus feeders (never the last one per section).
 */
function shrink(spec) {
  for (let i = 0; i < 200 && buildModel(spec).nodes.length > MAX_NODES; i++) {
    let costliest = null;
    for (const f of spec.feeders) for (const l of f.loads) {
      if (l.kind !== 'load' && (!costliest || loadCost(l) > loadCost(costliest))) costliest = l;
    }
    if (costliest) { costliest.kind = 'load'; costliest.label ??= 'AUXILIARY PANEL'; continue; }

    const multi = spec.feeders.find((f) => f.loads.length > 1);
    if (multi) { multi.loads.pop(); continue; }

    const bySec = new Map();
    for (const f of spec.feeders) bySec.set(f.sec, (bySec.get(f.sec) ?? 0) + 1);
    const idx = spec.feeders.findIndex((f, j) =>
      bySec.get(f.sec) > 1 && !spec.feeders.slice(j + 1).some((g) => g.sec === f.sec));
    if (idx >= 0) { spec.feeders.splice(idx, 1); continue; }

    break; // structurally at the floor; accept whatever remains
  }
  return spec;
}

/** Add a load/feeder until nodes >= MIN_NODES. */
function grow(rng, arch, spec) {
  for (let i = 0; i < 50 && buildModel(spec).nodes.length < MIN_NODES; i++) {
    const under3 = spec.feeders.filter((f) => f.loads.length < 3);
    if (under3.length && chance(rng, 0.6)) {
      under3[0].loads.push(...makeLoadGroup(rng, arch));
    } else {
      const sec = choice(rng, spec.sections).key;
      const mainRating = spec.sections.find((s) => s.key === sec).incomers[0].main;
      spec.feeders.push(makeFeeder(rng, arch, sec, mainRating, false));
    }
  }
  return spec;
}

function generateSpec(i) {
  const rng = mulberry32(GEN_SEED_BASE + i * 97 + 11);
  const arch = choice(rng, ARCHETYPES);
  const sys = choice(rng, arch.substation ? SYSTEMS.slice(-1) : SYSTEMS.slice(0, -1));
  const tz = choice(rng, sys.tz);

  const twoSection = !arch.substation && chance(rng, 0.26);
  const dualIncomer = !twoSection && (arch.dualIncomerBias ? chance(rng, 0.4) : chance(rng, 0.12));

  const sections = [];
  const sectionKeys = twoSection ? ['A', 'B'] : ['A'];
  for (const key of sectionKeys) {
    const incomers = [];
    const n1 = key === 'A' ? 1 : 1;
    void n1;
    const primaryLabel = `${sys.mv} ${key === 'A' ? 'SUPPLY A' : 'SUPPLY B'}`;
    incomers.push(buildIncomer(rng, arch, sys, 'utility', primaryLabel));

    if (dualIncomer && key === 'A') {
      const secondKind = arch.allowsGenerator && chance(rng, 0.5) ? 'generator' : 'utility';
      const label = secondKind === 'generator' ? 'STANDBY GENERATOR' : `${sys.mv} STANDBY`;
      incomers.push(buildIncomer(rng, arch, sys, secondKind, label));
    }

    if ((arch.forceRenewable || arch.allowsRenewable) && !twoSection && chance(rng, arch.forceRenewable ? 0.7 : 0.22)) {
      const kwp = int(rng, 100, 600);
      const solar = { src: 'solar', srcLabel: `PV ARRAY ${kwp} kW`, main: choice(rng, MAIN_FRAMES.slice(0, 5)), mainType: 'MCCB' };
      solar.ct = ctFor(solar.main);
      incomers.push(solar);
    }

    sections.push({
      key, baseKw: +(rng() * 12).toFixed(1),
      incomers,
    });
  }

  let tie = null;
  let tieType = null;
  if (twoSection) {
    const bGenerator = sections[1] && dualIncomer === false && arch.allowsGenerator && chance(rng, 0.4);
    if (bGenerator) {
      sections[1].incomers = [buildIncomer(rng, arch, sys, 'generator', 'STANDBY GENERATOR')];
      tieType = 'ats';
    }
    const rating = choice(rng, MAIN_FRAMES.slice(2, 8));
    tie = { rating, type: tieType ?? undefined, note: tieType === 'ats' ? 'AUTOMATIC TRANSFER / OPEN TRANSITION' : choice(rng, TIE_NOTES_NORMAL) };
  }

  const feeders = [];
  for (const s of sections) {
    const mainRating = s.incomers[0].main;
    const nFeeders = int(rng, 1, twoSection ? 2 : 3);
    for (let k = 0; k < nFeeders; k++) feeders.push(makeFeeder(rng, arch, s.key, mainRating, true));
  }

  const siteTag = choice(rng, SITE_TAGS);
  const spec = {
    id: `GEN-${String(i + 1).padStart(4, '0')}`,
    seed: 500000 + i * 131 + 17,
    name: `${arch.domain} — Site ${siteTag}-${int(rng, 1, 99)}`,
    title: arch.title,
    subtitle: arch.subtitle,
    mv: sys.mv, lv: sys.lv, llv: sys.llv, hz: sys.hz, tz,
    sections: sections.map((s) => ({ key: s.key, baseKw: s.baseKw, incomers: s.incomers })),
    tie,
    feeders,
    bulk: true,
  };

  shrink(spec);
  grow(rng, arch, spec);
  shrink(spec);

  return spec;
}

export function makeGeneratedPlants(count = 1500) {
  const out = [];
  for (let i = 0; i < count; i++) out.push(generateSpec(i));
  return out;
}

// A small margin over 1500: a rare random topology can be unroutable by the
// orthogonal wire router, and generate.mjs skips (rather than replaces) those
// - see its handling of spec.bulk failures. The margin absorbs that loss
// without needing to re-seed or renumber anything.
export const GENERATED_PLANTS = makeGeneratedPlants(1550);
