#!/usr/bin/env node
/**
 * Collage sheets: stamp isolated Schematex symbols (IEEE 315) on a canvas.
 * Visual diversity without Synthetic Data/_tools; not the sldeditor npm UI.
 */
import { mkdirSync, writeFileSync, readFileSync, existsSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import sharp from 'sharp';
import { render } from 'schematex';
import { parseSLDDSL, layoutSLD } from 'schematex/sld';
import { Resvg } from '@resvg/resvg-js';

const __dir = dirname(fileURLToPath(import.meta.url));
const REPO = join(__dir, '..', '..');
import { CORPUS_ROOT } from './lib/paths.mjs';

/** @deprecated Use generate_component_crops.mjs for symbols; use mixed/ST/SLE for full sheets. */
const OUT_ROOT = CORPUS_ROOT;
const PNG_SCALE = 2;
const W = 640;
const H = 800;

const SYMBOL_TYPES = [
  'utility', 'generator', 'solar', 'wind', 'ups', 'transformer', 'bus', 'breaker',
  'switch', 'contactor', 'ats', 'fuse', 'ct', 'relay', 'motor', 'load', 'vfd',
  'watthour_meter', 'capacitor_bank', 'surge_arrester',
];

const args = process.argv.slice(2);
let count = 40;
for (let i = 0; i < args.length; i++) {
  if (args[i] === '--count' && args[i + 1]) count = Number(args[++i]);
}

function mulberry32(seed) {
  let a = seed >>> 0;
  return () => {
    a = (a + 0x6d2b79f5) >>> 0;
    let t = Math.imul(a ^ (a >>> 15), 1 | a);
    t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t;
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
  };
}

function symbolSvg(type, tag) {
  const dsl = `
sld "stamp"
SRC = utility [label: "SRC", voltage: "480V"]
DEV = ${type} [label: "${tag}"]
SRC -> DEV
`.trim();
  const ast = parseSLDDSL(dsl);
  layoutSLD(ast, {});
  return render(dsl);
}

const manifestPath = join(OUT_ROOT, 'manifest.json');
const manifest = existsSync(manifestPath)
  ? JSON.parse(readFileSync(manifestPath, 'utf8'))
  : { plants: [], generator: 'Mock/scripts (external)' };

const existing = new Set(manifest.plants.map((p) => p.id));
const added = [];

function nextColId(plants) {
  let max = 0;
  for (const p of plants) {
    const m = /^MOCK-COL-(\d+)$/.exec(p.id);
    if (m) max = Math.max(max, Number(m[1]));
  }
  return `MOCK-COL-${String(max + 1).padStart(4, '0')}`;
}

for (let n = 0; n < count; n++) {
  const id = nextColId(manifest.plants);
  if (existing.has(id)) continue;

  const rng = mulberry32(9000 + n);
  const nSym = 6 + Math.floor(rng() * 8);
  const nodes = [];
  const composites = [];

  for (let s = 0; s < nSym; s++) {
    const type = SYMBOL_TYPES[Math.floor(rng() * SYMBOL_TYPES.length)];
    const tag = `${type.slice(0, 3).toUpperCase()}-${1000 + n * 20 + s}`;
    const x = Math.floor(40 + rng() * (W - 140));
    const y = Math.floor(80 + rng() * (H - 180));
    const size = 72 + Math.floor(rng() * 48);
    let svg;
    try {
      svg = symbolSvg(type, tag);
    } catch {
      continue;
    }
    const pngBuf = new Resvg(svg, {
      fitTo: { mode: 'width', value: size },
      background: 'white',
      font: { loadSystemFonts: true },
    }).render().asPng();
    composites.push({ input: pngBuf, left: x, top: y });
    nodes.push({
      id: tag,
      dsl_id: `s${s}`,
      type,
      class: type,
      role: null,
      label: tag,
      attributes: {},
      metadata: { mock: true, generator: 'schematex-stamp-collage' },
      bbox: [x / PNG_SCALE, y / PNG_SCALE, (x + size) / PNG_SCALE, (y + size) / PNG_SCALE],
      center: [(x + size / 2) / PNG_SCALE, (y + size / 2) / PNG_SCALE],
      level: s,
      text_labels: [{
        text: tag, role: 'id',
        bbox: [x / PNG_SCALE, (y + size + 4) / PNG_SCALE, (x + size) / PNG_SCALE, (y + size + 18) / PNG_SCALE],
        font_size: 11, placement: 'side',
      }],
    });
  }

  const base = sharp({
    create: { width: W, height: H, channels: 3, background: { r: 255, g: 255, b: 255 } },
  });
  const pngFull = await base.composite(composites).png().toBuffer();
  const pngScaled = await sharp(pngFull).resize(W * PNG_SCALE, H * PNG_SCALE).png().toBuffer();

  const dir = join(OUT_ROOT, id);
  for (const sub of ['drawings', 'graph']) mkdirSync(join(dir, sub), { recursive: true });
  writeFileSync(join(dir, 'drawings', 'plant.png'), pngScaled);
  writeFileSync(join(dir, 'drawings', 'plant.svg'),
    `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 ${W} ${H}"><rect width="100%" height="100%" fill="white"/></svg>`);

  const graph = {
    id,
    title: `Collage ${n}`,
    system: { mock: true },
    nodes,
    edges: [],
    junctions: [],
    texts: [{
      text: `${id} — symbol collage`,
      role: 'title',
      bbox: [10, 10, 200, 30],
      font_size: 14,
      placement: 'title',
    }],
    meters: [],
    switch_states: [],
    counts: { nodes: nodes.length, edges: 0, junctions: 0, meters: 0 },
    image: {
      width: W,
      height: H,
      png_scale: PNG_SCALE,
      png_width: W * PNG_SCALE,
      png_height: H * PNG_SCALE,
      direction: 'TB',
      x_offset: 0,
      y_offset: 0,
    },
  };
  writeFileSync(join(dir, 'graph', 'graph.json'), JSON.stringify(graph, null, 2));

  manifest.plants.push({
    id,
    name: 'schematex-collage',
    title: graph.title,
    drawing: {
      png: `${id}/drawings/plant.png`,
      svg: `${id}/drawings/plant.svg`,
      width: W,
      height: H,
      png_scale: PNG_SCALE,
    },
    graph: { json: `${id}/graph/graph.json`, ...graph.counts },
    data: null,
  });
  added.push(id);
  process.stdout.write(`+ ${id}  ${nodes.length} symbols\n`);
}

writeFileSync(manifestPath, JSON.stringify(manifest, null, 2));
console.log(`\n${added.length} collage sheets -> ${OUT_ROOT}`);
