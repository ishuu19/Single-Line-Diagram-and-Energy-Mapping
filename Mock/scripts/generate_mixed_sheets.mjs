#!/usr/bin/env node
/** Mixed-type Schematex full sheets -> MOCK-MIX-#### */
import { mkdirSync, writeFileSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { render } from 'schematex';
import { parseSLDDSL, layoutSLD, lintSLD } from 'schematex/sld';
import { buildMixedDsl, templateCount } from './lib/mixed_templates.mjs';
import { graphFromSchematex, extractJunctions } from './lib/graph_from_layout.mjs';
import { loadManifest, saveManifest, nextId } from './lib/manifest.mjs';
import { CORPUS_ROOT } from './lib/paths.mjs';
import { pngFromSvg } from './lib/png.mjs';

const PNG_SCALE = 2;
const PREFIX = 'MOCK-MIX';

const args = process.argv.slice(2);
let count = 120;
for (let i = 0; i < args.length; i++) {
  if (args[i] === '--count' && args[i + 1]) count = Number(args[++i]);
}

const { manifestPath, manifest } = loadManifest(CORPUS_ROOT);
const added = [];

for (let n = 0; n < count; n++) {
  const id = nextId(manifest.plants, PREFIX);
  const seed = manifest.plants.length + n;
  const { dsl, title, archetype } = buildMixedDsl(seed);
  let ast, layout, svg;
  try {
    ast = parseSLDDSL(dsl);
    layout = layoutSLD(ast, {});
    svg = render(dsl);
  } catch (err) {
    continue;
  }

  const dir = join(CORPUS_ROOT, id);
  for (const sub of ['drawings', 'graph']) mkdirSync(join(dir, sub), { recursive: true });

  writeFileSync(join(dir, 'drawings', 'plant.sld'), dsl);
  writeFileSync(join(dir, 'drawings', 'plant.svg'), svg);

  const png = await pngFromSvg(svg, {
    fitTo: { mode: 'zoom', value: PNG_SCALE },
    background: 'white',
  });
  writeFileSync(join(dir, 'drawings', 'plant.png'), png);

  const system = { nominal_lv: '480V', frequency_hz: 50, mock: true, sheet_kind: 'mixed-full' };
  const graph = graphFromSchematex({
    id, title, ast, layout, pngScale: PNG_SCALE, system,
  });
  graph.junctions = extractJunctions(svg);
  graph.counts.junctions = graph.junctions.length;
  writeFileSync(join(dir, 'graph', 'graph.json'), JSON.stringify(graph, null, 2));

  manifest.plants.push({
    id,
    kind: 'full-sheet',
    name: archetype,
    title,
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
    lint: lintSLD(dsl) ?? [],
  });
  added.push(id);
  process.stdout.write(`+ ${id}  ${graph.counts.nodes} nodes\n`);
}

saveManifest(manifestPath, manifest);
console.log(`\n${added.length} mixed sheets -> ${CORPUS_ROOT}`);
console.log(`templates: ${templateCount()}`);
