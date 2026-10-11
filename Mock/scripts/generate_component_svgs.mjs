#!/usr/bin/env node
/**
 * Labeled component SVGs for train/val/test from Mock/third_party libraries.
 * Output: corpus/component-svgs/{train,val,test}/*.svg + manifest.jsonl + split.json
 */
import { mkdirSync, writeFileSync, readFileSync, existsSync, appendFileSync } from 'node:fs';
import { join, relative, basename } from 'node:path';
import { compile, buildExportSvg, LIBRARY } from 'sldeditor';
import { REPO, CORPUS_ROOT, SVGS_ROOT } from './lib/paths.mjs';
import { walkSvgsSync, slug } from './lib/crop_io.mjs';
import { wrapLabeledSvg, tagFromMeta } from './lib/normalize_labeled_svg.mjs';
import { createHash } from 'node:crypto';
import { hashSplit } from './lib/split.mjs';
import { isLikelySymbolSheet, cropsFromSymbolSheet } from './lib/sheet_crop.mjs';

function shortHash(s) {
  return createHash('md5').update(s).digest('hex').slice(0, 8);
}

const TP = join(REPO, 'Mock', 'third_party');

const args = process.argv.slice(2);
let limit = 0;
let append = false;
for (let i = 0; i < args.length; i++) {
  if (args[i] === '--limit' && args[i + 1]) limit = Number(args[++i]);
  if (args[i] === '--append') append = true;
}

const manifestPath = join(SVGS_ROOT, 'manifest.jsonl');
const splits = { train: 0, val: 0, test: 0 };
const seen = new Set();

mkdirSync(join(SVGS_ROOT, 'train'), { recursive: true });
mkdirSync(join(SVGS_ROOT, 'val'), { recursive: true });
mkdirSync(join(SVGS_ROOT, 'test'), { recursive: true });
if (!append) writeFileSync(manifestPath, '');

function stableId(parts) {
  return parts.filter(Boolean).join('::');
}

function writeRecord(record) {
  if (limit && seen.size >= limit) return false;
  if (seen.has(record.id)) return true;
  seen.add(record.id);

  const split = hashSplit(record.stableKey);
  splits[split]++;
  const filename = `${slug(record.id)}.svg`;
  const outPath = join(SVGS_ROOT, split, filename);
  const labeled = wrapLabeledSvg(record.svg, record.label);
  writeFileSync(outPath, labeled);

  const row = {
    id: record.id,
    split,
    path: relative(CORPUS_ROOT, outPath).replace(/\\/g, '/'),
    label: record.label,
    class: record.class,
    source: record.source,
    type: record.type,
    standard: record.standard ?? null,
    category: record.category ?? null,
    from_sheet: record.from_sheet ?? false,
    sheet: record.sheet ?? null,
  };
  appendFileSync(manifestPath, `${JSON.stringify(row)}\n`);
  return true;
}

function dirnameLeaf(rel) {
  const parts = rel.split('/');
  parts.pop();
  return parts.length ? parts.join('/') : '_root';
}

async function ingestFile(source, svgPath, meta) {
  if (limit && seen.size >= limit) return false;
  const rel = relative(join(TP, source), svgPath).replace(/\\/g, '/');
  const svg = readFileSync(svgPath, 'utf8');
  if (!svg.includes('<svg')) return true;
  const sheetBase = slug(basename(svgPath, '.svg'));
  const type = meta.type || sheetBase;

  if (isLikelySymbolSheet(svgPath, svg)) {
    const cells = await cropsFromSymbolSheet(svg, `${source}-${sheetBase}`);
    if (cells.length) {
      process.stdout.write(`sheet ${rel} -> ${cells.length} crops\n`);
    }
    for (const cell of cells) {
      const stableKey = stableId([source, rel, cell.cellId]);
      const id = `${source}-${shortHash(stableKey)}`;
      const label = `${sheetBase.toUpperCase()}-${cell.cellId.split('-').pop()}`;
      if (!writeRecord({
        id,
        stableKey,
        svg: cell.svg,
        label,
        class: `${type}__cell`,
        source,
        type: cell.cellId,
        standard: meta.standard,
        category: meta.category,
        from_sheet: true,
        sheet: rel,
      })) return false;
    }
    if (cells.length) return true;
  }

  const stableKey = stableId([source, type, meta.standard, rel]);
  const id = `${source}-${shortHash(stableKey)}`;
  const label = tagFromMeta({ ...meta, type, name: meta.name || type });
  if (!writeRecord({
    id,
    stableKey,
    svg,
    label,
    class: type,
    source,
    type,
    standard: meta.standard,
    category: meta.category,
    from_sheet: false,
    sheet: null,
  })) return false;
  return true;
}

console.log('Labeled component SVGs (third_party sources)\n');

outer: for (const [kind] of LIBRARY) {
  for (const standard of ['iec', 'ansi']) {
    const diagram = {
      version: '1',
      meta: { title: kind, labelMode: 'id', symbolStandard: standard },
      elements: [{ id: 'E1', kind, name: `${kind.toUpperCase()}` }],
      layout: { E1: { at: [72, 72] } },
      wires: [],
    };
    try {
      const model = compile(diagram);
      const svg = buildExportSvg(model, { background: 'white', title: kind, labelMode: 'id' });
      const stableKey = stableId(['sldeditor', kind, standard]);
      const id = `sldeditor-${standard}-${kind}`;
      const label = `${kind.toUpperCase()}-${standard.toUpperCase()}`;
      if (!writeRecord({
        id,
        stableKey,
        svg,
        label,
        class: kind,
        source: 'sldeditor',
        type: kind,
        standard,
      })) break outer;
    } catch (e) {
      process.stderr.write(`skip sldeditor ${kind}: ${e.message}\n`);
    }
    if (limit && seen.size >= limit) break outer;
  }
}

const esRoot = join(TP, 'electronic-symbols');
const esManifest = join(esRoot, 'manifest.json');
if (existsSync(esManifest) && (!limit || seen.size < limit)) {
  for (const comp of JSON.parse(readFileSync(esManifest, 'utf8'))) {
    const svgPath = join(esRoot, 'SVG', `${comp.filename}.svg`);
    if (!existsSync(svgPath)) continue;
    if (!(await ingestFile('electronic-symbols', svgPath, {
      type: comp.id,
      name: comp.name,
      category: comp.category,
      standard: comp.standard,
    }))) break;
  }
}

for (const p of walkSvgsSync(join(TP, 'circuit-symbol-svg', 'symbols'))) {
  if (limit && seen.size >= limit) break;
  await ingestFile('circuit-symbol-svg', p, { type: slug(basename(p, '.svg')) });
}

for (const sub of ['assets/symbols', 'generated']) {
  const dir = join(TP, 'schematic-symbols', ...sub.split('/'));
  if (!existsSync(dir)) continue;
  for (const p of walkSvgsSync(dir)) {
    if (limit && seen.size >= limit) break;
    await ingestFile('tscircuit', p, { type: slug(basename(p, '.svg')) });
  }
}

for (const lib of ['electrical_template', 'SchematicSymbolsSVG', 'Inkscape_electric_Symbols', 'schemalib']) {
  const root = join(TP, lib);
  if (!existsSync(root)) continue;
  for (const p of walkSvgsSync(root)) {
    if (limit && seen.size >= limit) break;
    const rel = relative(root, p).replace(/\\/g, '/');
    await ingestFile(lib, p, { type: slug(basename(p, '.svg')), name: rel });
  }
}

writeFileSync(join(SVGS_ROOT, 'split.json'), JSON.stringify({
  counts: splits,
  total: seen.size,
  fractions: { val: 0.05, test: 0.10 },
}, null, 2));

console.log(`\n${seen.size} labeled SVGs -> ${SVGS_ROOT}`);
console.log(splits);
