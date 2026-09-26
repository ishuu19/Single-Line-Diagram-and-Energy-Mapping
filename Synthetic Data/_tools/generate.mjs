// Corpus generator: builds drawings, ground-truth graphs and telemetry.
//
//   node generate.mjs                 all plants
//   node generate.mjs PLANT-01        one plant
//   node generate.mjs --no-data       drawings and graphs only
//   node generate.mjs --days 7        shorter telemetry window

import { mkdirSync, writeFileSync, existsSync, readFileSync } from 'node:fs';
import { resolve, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';
import { render } from 'schematex';
import { parseSLDDSL, layoutSLD, lintSLD } from 'schematex/sld';
import { Resvg } from '@resvg/resvg-js';
import { PLANTS } from './plants.mjs';
import { GENERATED_PLANTS } from './plants.generated.mjs';
import { buildModel, toDSL, toGraph } from './build.mjs';
import { generateSeries } from './series.mjs';

const ROOT = resolve(dirname(fileURLToPath(import.meta.url)), '..');
const PNG_SCALE = 2;

const argv = process.argv.slice(2);
const FLAGS_WITH_VALUE = new Set(['--days']);
const only = argv.filter((a, i) => !a.startsWith('--') && !FLAGS_WITH_VALUE.has(argv[i - 1]));
const noData = argv.includes('--no-data');
const coreOnly = argv.includes('--core');
const genOnly = argv.includes('--gen');
const daysArg = argv.indexOf('--days');
const DAYS = daysArg >= 0 ? Number(argv[daysArg + 1]) : 30;

// `--core` limits the run to the 10 hand-authored reference plants; `--gen`
// limits it to the procedurally generated batch. Both honour --no-data/--days
// the same way; neither tier skips telemetry by default any more.
const ALL_PLANTS = coreOnly ? PLANTS : genOnly ? GENERATED_PLANTS : [...PLANTS, ...GENERATED_PLANTS];

/**
 * Apply the drawing convention the reference uses but Schematex does not:
 * measurement links (CT to meter) are drawn dashed, power paths solid.
 */
function dashMeasurementLinks(svg, model) {
  const meas = new Set(model.edges.filter((e) => e.rel === 'measurement').map((e) => `${e.from}|${e.to}`));
  return svg.replace(
    /<path ([^>]*?)data-from="([^"]+)" data-to="([^"]+)" class="lt-sld-wire"\/>/g,
    (full, head, from, to) =>
      meas.has(`${from}|${to}`)
        ? `<path ${head}data-from="${from}" data-to="${to}" class="lt-sld-wire" stroke-dasharray="6 4"/>`
        : full
  );
}

/** Junction dots — "filled dot = electrical junction" — as a detection class. */
function extractJunctions(svg) {
  const out = [];
  const re = /<circle cx="([-\d.]+)" cy="([-\d.]+)" r="([-\d.]+)" class="lt-sld-dot"\/>/g;
  for (const m of svg.matchAll(re)) {
    const [x, y, r] = [Number(m[1]), Number(m[2]), Number(m[3])];
    out.push({
      center: [Math.round(x * 100) / 100, Math.round(y * 100) / 100],
      bbox: [x - r, y - r, x + r, y + r].map((v) => Math.round(v * 100) / 100),
    });
  }
  return out;
}

const manifest = [];
const skipped = [];
const t0 = Date.now();

for (const spec of ALL_PLANTS) {
  if (only.length && !only.includes(spec.id)) continue;
  const started = Date.now();

  const model = buildModel(spec);

  // The orthogonal router can fail to route a dense sheet depending on the
  // order wires are declared in, so try each ordering and keep the first that
  // lays out. Strict parse throughout: a bad drawing must fail loudly - except
  // for the bulk procedurally generated tier, where a rare unroutable random
  // topology should be skipped and reported rather than aborting the batch.
  let dsl, layout, order, layoutErr;
  for (const o of ['power-first', 'declared', 'measurement-first']) {
    try {
      const candidate = toDSL(model, o);
      layout = layoutSLD(parseSLDDSL(candidate), {});
      dsl = candidate; order = o;
      break;
    } catch (err) {
      layoutErr = err;
      if (o === 'measurement-first' && !spec.bulk) {
        throw new Error(`${spec.id}: no workable layout - ${err.message}`);
      }
    }
  }
  if (!layout) {
    console.log(`${spec.id.padEnd(9)} SKIPPED  no workable layout - ${layoutErr.message}`);
    skipped.push({ id: spec.id, reason: layoutErr.message });
    continue;
  }

  const svg = dashMeasurementLinks(render(dsl), model);
  const lint = lintSLD(dsl) ?? [];

  const dir = `${ROOT}/${spec.id}`;
  for (const sub of ['drawings', 'graph', 'data']) mkdirSync(`${dir}/${sub}`, { recursive: true });

  writeFileSync(`${dir}/drawings/plant.sld`, dsl);
  writeFileSync(`${dir}/drawings/plant.svg`, svg);

  const png = new Resvg(svg, {
    fitTo: { mode: 'zoom', value: PNG_SCALE },
    background: 'white',
    font: { loadSystemFonts: true },
  }).render().asPng();
  writeFileSync(`${dir}/drawings/plant.png`, png);

  const graph = toGraph(model, layout, PNG_SCALE);
  graph.junctions = extractJunctions(svg);
  graph.counts.junctions = graph.junctions.length;
  writeFileSync(`${dir}/graph/graph.json`, JSON.stringify(graph, null, 2));

  // Edge list + node list in plain CSV, for tooling that prefers tables to JSON.
  writeFileSync(`${dir}/graph/nodes.csv`,
    'id,type,class,role,label,rating,bbox_x0,bbox_y0,bbox_x1,bbox_y1\n' +
    graph.nodes.map((n) => [
      n.id, n.type, n.class, n.role ?? '', JSON.stringify(n.label),
      JSON.stringify(n.attributes.rating ?? ''), ...(n.bbox ?? ['', '', '', '']),
    ].join(',')).join('\n') + '\n');
  writeFileSync(`${dir}/graph/edges.csv`,
    'id,source,target,relationship,line_style,net,cable\n' +
    graph.edges.map((e) => [
      e.id, e.source, e.target, e.relationship, e.line_style, e.net ?? '',
      JSON.stringify(e.attributes.cable ?? ''),
    ].join(',')).join('\n') + '\n');

  let series = null;
  if (!noData) series = await generateSeries(model, `${dir}/data`, DAYS);

  manifest.push({
    id: spec.id, name: spec.name, title: spec.title,
    system: graph.system,
    drawing: { svg: `${spec.id}/drawings/plant.svg`, png: `${spec.id}/drawings/plant.png`, sld: `${spec.id}/drawings/plant.sld`, width: graph.image.width, height: graph.image.height, png_scale: PNG_SCALE },
    graph: { json: `${spec.id}/graph/graph.json`, ...graph.counts, wire_order: order },
    data: series ? { dir: `${spec.id}/data`, ...series } : null,
    lint: lint.length ? lint : 'clean',
  });

  const secs = ((Date.now() - started) / 1000).toFixed(1);
  console.log(
    `${spec.id.padEnd(9)} ${String(graph.counts.nodes).padStart(3)} nodes  ` +
    `${String(graph.counts.edges).padStart(3)} edges  ` +
    `${String(graph.counts.meters).padStart(2)} meters  ` +
    `${String(Math.round(graph.image.width)).padStart(5)}x${String(Math.round(graph.image.height)).padEnd(5)}  ` +
    `${series ? `${(series.rows / 1000).toFixed(0)}k rows  ` : ''}${secs}s` +
    `${lint.length ? `  LINT:${lint.length}` : ''}`
  );
}

// Merge into any existing manifest rather than overwriting it outright, so a
// filtered/partial run (e.g. --gen on its own, or a single plant id) doesn't
// wipe out entries for plants this invocation didn't touch.
let prior = [];
if (existsSync(`${ROOT}/manifest.json`)) {
  try { prior = JSON.parse(readFileSync(`${ROOT}/manifest.json`, 'utf8')).plants ?? []; } catch { /* start fresh */ }
}
const touched = new Set(manifest.map((p) => p.id));
const merged = [...prior.filter((p) => !touched.has(p.id)), ...manifest]
  .sort((a, b) => a.id.localeCompare(b.id, undefined, { numeric: true }));

// telemetry_days varies per plant across the corpus (core vs. generated tier
// may use different --days windows, or no data at all), so summarise rather
// than report a single figure that would only describe the last run.
const dayCounts = [...new Set(merged.map((p) => p.data?.days ?? 0))].sort((a, b) => a - b);

writeFileSync(`${ROOT}/manifest.json`, JSON.stringify({
  corpus: 'Synthetic SLD corpus for graph-extraction research',
  generator: 'schematex 1.1.0 (IEEE Std 315 / ANSI Y32.2 symbols)',
  generated_utc: new Date().toISOString(),
  telemetry_days: dayCounts.length === 1 ? dayCounts[0] : dayCounts,
  png_scale: PNG_SCALE,
  plants: merged,
}, null, 2));

console.log(`\n${manifest.length} plant(s) generated (${merged.length} total in manifest) in ${((Date.now() - t0) / 1000).toFixed(1)}s -> ${ROOT}`);
if (skipped.length) console.log(`${skipped.length} skipped (unroutable layout): ${skipped.map((s) => s.id).join(', ')}`);
