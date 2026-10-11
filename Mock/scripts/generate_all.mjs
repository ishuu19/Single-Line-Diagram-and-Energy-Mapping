#!/usr/bin/env node
/**
 * Schematex-only mock plants -> Synthetic Data/Mock/
 * Does not import Synthetic Data/_tools.
 */
import { mkdirSync, writeFileSync, readFileSync, existsSync } from 'node:fs';
import { join } from 'node:path';
import { render } from 'schematex';
import { parseSLDDSL, layoutSLD, lintSLD } from 'schematex/sld';
import { buildDsl, templateCount } from './lib/templates.mjs';
import { graphFromSchematex, extractJunctions } from './lib/graph_from_layout.mjs';
import { CORPUS_ROOT } from './lib/paths.mjs';
import { pngFromSvg } from './lib/png.mjs';

const OUT_ROOT = CORPUS_ROOT;
const PNG_SCALE = 2;

const args = process.argv.slice(2);
let count = 120;
for (let i = 0; i < args.length; i++) {
  if (args[i] === '--count' && args[i + 1]) count = Number(args[++i]);
}

const manifestPath = join(OUT_ROOT, 'manifest.json');
const manifest = existsSync(manifestPath)
  ? JSON.parse(readFileSync(manifestPath, 'utf8'))
  : { plants: [], generator: 'Mock/scripts/generate_all.mjs (schematex npm 1.1.0)' };

const existing = new Set(manifest.plants.map((p) => p.id));
const added = [];
const skipped = [];

function nextStId(plants) {
  let max = 0;
  for (const p of plants) {
    const m = /^MOCK-ST-(\d+)$/.exec(p.id);
    if (m) max = Math.max(max, Number(m[1]));
  }
  return `MOCK-ST-${String(max + 1).padStart(4, '0')}`;
}

for (let n = 0; n < count; n++) {
  const id = nextStId(manifest.plants);
  if (existing.has(id)) continue;

  const { dsl, title, archetype } = buildDsl(n);
  let ast, layout, svg;
  try {
    ast = parseSLDDSL(dsl);
    layout = layoutSLD(ast, {});
    svg = render(dsl);
  } catch (err) {
    skipped.push({ id, reason: err.message });
    continue;
  }

  const lint = lintSLD(dsl) ?? [];
  const dir = join(OUT_ROOT, id);
  for (const sub of ['drawings', 'graph']) mkdirSync(join(dir, sub), { recursive: true });

  writeFileSync(join(dir, 'drawings', 'plant.sld'), dsl);
  writeFileSync(join(dir, 'drawings', 'plant.svg'), svg);

  const png = await pngFromSvg(svg, {
    fitTo: { mode: 'zoom', value: PNG_SCALE },
    background: 'white',
  });
  writeFileSync(join(dir, 'drawings', 'plant.png'), png);

  const system = { nominal_lv: '480V', frequency_hz: 50, timezone: 'UTC', mock: true };
  const graph = graphFromSchematex({
    id, title, ast, layout, pngScale: PNG_SCALE, system,
  });
  graph.junctions = extractJunctions(svg);
  graph.counts.junctions = graph.junctions.length;
  writeFileSync(join(dir, 'graph', 'graph.json'), JSON.stringify(graph, null, 2));

  const entry = {
    id,
    kind: 'full-sheet',
    name: title,
    title,
    archetype,
    system,
    drawing: {
      svg: `${id}/drawings/plant.svg`,
      png: `${id}/drawings/plant.png`,
      sld: `${id}/drawings/plant.sld`,
      width: graph.image.width,
      height: graph.image.height,
      png_scale: PNG_SCALE,
    },
    graph: { json: `${id}/graph/graph.json`, ...graph.counts },
    data: null,
    lint: lint.length ? lint : 'clean',
  };
  manifest.plants.push(entry);
  added.push(id);
  process.stdout.write(`+ ${id}  ${graph.counts.nodes} nodes  ${graph.counts.edges} edges\n`);
}

writeFileSync(manifestPath, JSON.stringify(manifest, null, 2));
console.log(`\n${added.length} sheets -> ${OUT_ROOT}`);
if (skipped.length) console.log(`skipped: ${skipped.length} (first: ${skipped[0]?.reason})`);
console.log(`templates rotated across ${templateCount()} archetypes`);
