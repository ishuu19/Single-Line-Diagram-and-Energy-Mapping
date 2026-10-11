#!/usr/bin/env node
/**
 * basverdoes/ElectricalSymbolLibrary (CC0) symbol stamps -> MOCK-ESL-####
 * Clone: Mock/third_party/ElectricalSymbolLibrary (see setup_third_party.mjs)
 */
import { mkdirSync, writeFileSync, readFileSync, readdirSync, statSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import sharp from 'sharp';
import { Resvg } from '@resvg/resvg-js';
import { loadManifest, saveManifest, nextId } from './lib/manifest.mjs';

const __dir = dirname(fileURLToPath(import.meta.url));
const REPO = join(__dir, '..', '..');
import { CORPUS_ROOT } from './lib/paths.mjs';

/** @deprecated Use generate_component_crops.mjs (isolated crops only). */
const OUT_ROOT = CORPUS_ROOT;
const SYM_ROOT = join(REPO, 'Mock', 'third_party', 'ElectricalSymbolLibrary', 'src', 'symbols');
const PNG_SCALE = 2;
const W = 720;
const H = 900;
const PREFIX = 'MOCK-ESL';

const args = process.argv.slice(2);
let count = 120;
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

function walkSvgs(dir, out = []) {
  for (const name of readdirSync(dir)) {
    const p = join(dir, name);
    if (statSync(p).isDirectory()) walkSvgs(p, out);
    else if (name.endsWith('.svg')) out.push(p);
  }
  return out;
}

const symbolPaths = walkSvgs(SYM_ROOT);
if (!symbolPaths.length) {
  console.error(`No SVGs under ${SYM_ROOT}. Run: node scripts/setup_third_party.mjs`);
  process.exit(1);
}

function symbolPng(svgPath, size) {
  const svg = readFileUtf8(svgPath);
  return new Resvg(svg, {
    fitTo: { mode: 'width', value: size },
    background: 'white',
    font: { loadSystemFonts: true },
  }).render().asPng();
}

function readFileUtf8(p) {
  return readFileSync(p, 'utf8');
}

const { manifestPath, manifest } = loadManifest(OUT_ROOT);
const added = [];
const skipped = [];

for (let n = 0; n < count; n++) {
  const id = nextId(manifest.plants, PREFIX);
  const rng = mulberry32(42000 + manifest.plants.length + n);
  const nSym = 8 + Math.floor(rng() * 10);
  const composites = [];
  const nodes = [];

  for (let s = 0; s < nSym; s++) {
    const svgPath = symbolPaths[Math.floor(rng() * symbolPaths.length)];
    const base = svgPath.split(/[/\\]/).pop().replace('.svg', '');
    const tag = `${base.slice(0, 12).toUpperCase()}-${1000 + n * 30 + s}`;
    const x = Math.floor(30 + rng() * (W - 120));
    const y = Math.floor(60 + rng() * (H - 160));
    const size = 64 + Math.floor(rng() * 56);
    let pngBuf;
    try {
      pngBuf = symbolPng(svgPath, size);
    } catch {
      continue;
    }
    composites.push({ input: pngBuf, left: x, top: y });
    nodes.push({
      id: tag,
      dsl_id: `s${s}`,
      type: base,
      class: 'other',
      role: null,
      label: tag,
      attributes: { esl_path: svgPath.replace(REPO, '').replace(/\\/g, '/') },
      metadata: { mock: true, generator: 'ElectricalSymbolLibrary-cc0' },
      bbox: [x / PNG_SCALE, y / PNG_SCALE, (x + size) / PNG_SCALE, (y + size) / PNG_SCALE],
      center: [(x + size / 2) / PNG_SCALE, (y + size / 2) / PNG_SCALE],
      level: s,
      text_labels: [{
        text: tag, role: 'id',
        bbox: [x / PNG_SCALE, (y + size + 2) / PNG_SCALE, (x + size) / PNG_SCALE, (y + size + 16) / PNG_SCALE],
        font_size: 10, placement: 'side',
      }],
    });
  }

  if (!composites.length) {
    skipped.push(id);
    continue;
  }

  const pngFull = await sharp({
    create: { width: W, height: H, channels: 3, background: { r: 255, g: 255, b: 255 } },
  }).composite(composites).png().toBuffer();
  const pngScaled = await sharp(pngFull).resize(W * PNG_SCALE, H * PNG_SCALE).png().toBuffer();

  const dir = join(OUT_ROOT, id);
  for (const sub of ['drawings', 'graph']) mkdirSync(join(dir, sub), { recursive: true });
  writeFileSync(join(dir, 'drawings', 'plant.png'), pngScaled);
  writeFileSync(join(dir, 'drawings', 'plant.svg'),
    `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 ${W} ${H}"><rect width="100%" height="100%" fill="white"/></svg>`);

  const graph = {
    id,
    title: `ESL collage ${n}`,
    system: { mock: true, source: 'basverdoes/ElectricalSymbolLibrary CC0' },
    nodes,
    edges: [],
    junctions: [],
    texts: [{
      text: `${id} — CC0 symbol collage`,
      role: 'title',
      bbox: [10, 10, 280, 28],
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
    name: 'esl-collage',
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

saveManifest(manifestPath, manifest);
console.log(`\n${added.length} ESL collage sheets -> ${OUT_ROOT}`);
if (skipped.length) console.log(`skipped empty: ${skipped.length}`);
console.log(`symbol pool: ${symbolPaths.length} CC0 SVGs`);
