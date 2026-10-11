#!/usr/bin/env node
/**
 * sldeditor (npm) diagrams -> Synthetic Data/Mock/ as MOCK-SLE-####
 */
import { mkdirSync, writeFileSync } from 'node:fs';
import { join } from 'node:path';
import { compile, buildExportSvg } from 'sldeditor';
import { pngFromSvg } from './lib/png.mjs';
import { CORPUS_ROOT } from './lib/paths.mjs';
import { buildDiagram, templateCount } from './lib/sldeditor_templates.mjs';
import { graphFromSldeditor } from './lib/graph_from_sldeditor.mjs';
import { loadManifest, saveManifest, nextId } from './lib/manifest.mjs';

const OUT_ROOT = CORPUS_ROOT;
const PNG_SCALE = 2;
const PREFIX = 'MOCK-SLE';

const args = process.argv.slice(2);
let count = 200;
for (let i = 0; i < args.length; i++) {
  if (args[i] === '--count' && args[i + 1]) count = Number(args[++i]);
}

const { manifestPath, manifest } = loadManifest(OUT_ROOT);
const added = [];
const skipped = [];

for (let n = 0; n < count; n++) {
  const id = nextId(manifest.plants, PREFIX);
  const seed = manifest.plants.length + n;
  const { diagram, title, archetype } = buildDiagram(seed);

  let model;
  let svg;
  try {
    model = compile(diagram);
    const errors = model.diagnostics.filter((d) => d.severity === 'error');
    if (errors.length) {
      skipped.push({ id, reason: errors[0].message });
      continue;
    }
    svg = buildExportSvg(model, {
      title,
      background: 'white',
      labelMode: diagram.meta?.labelMode,
      labelFontSize: diagram.meta?.labelFontSize,
    });
  } catch (err) {
    skipped.push({ id, reason: err.message });
    continue;
  }

  const dir = join(OUT_ROOT, id);
  for (const sub of ['drawings', 'graph']) mkdirSync(join(dir, sub), { recursive: true });

  writeFileSync(join(dir, 'drawings', 'plant.sld.json'), JSON.stringify(diagram, null, 2));
  writeFileSync(join(dir, 'drawings', 'plant.svg'), svg);

  const png = await pngFromSvg(svg, {
    fitTo: { mode: 'zoom', value: PNG_SCALE },
    background: 'white',
  });
  writeFileSync(join(dir, 'drawings', 'plant.png'), png);

  const system = { nominal_lv: '480V', frequency_hz: 50, mock: true, source: 'sldeditor-0.24.0' };
  const graph = graphFromSldeditor({
    id, title, diagram, model, svg, pngScale: PNG_SCALE, system,
  });
  writeFileSync(join(dir, 'graph', 'graph.json'), JSON.stringify(graph, null, 2));

  manifest.plants.push({
    id,
    kind: 'full-sheet',
    name: archetype,
    title,
    archetype,
    system,
    drawing: {
      json: `${id}/drawings/plant.sld.json`,
      svg: `${id}/drawings/plant.svg`,
      png: `${id}/drawings/plant.png`,
      width: graph.image.width,
      height: graph.image.height,
      png_scale: PNG_SCALE,
    },
    graph: { json: `${id}/graph/graph.json`, ...graph.counts },
    data: null,
  });
  added.push(id);
  process.stdout.write(`+ ${id}  ${graph.counts.nodes} nodes  ${graph.counts.edges} edges\n`);
}

saveManifest(manifestPath, manifest);
console.log(`\n${added.length} sldeditor sheets -> ${OUT_ROOT}`);
if (skipped.length) console.log(`skipped: ${skipped.length} (first: ${skipped[0]?.reason})`);
console.log(`templates: ${templateCount()} archetypes`);
