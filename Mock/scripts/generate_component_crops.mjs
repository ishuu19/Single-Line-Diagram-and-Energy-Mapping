#!/usr/bin/env node
/**
 * Isolated component PNG crops from multiple external libraries (not Schematex / basverdoes ESL).
 */
import { readFileSync, existsSync } from 'node:fs';
import { join, relative, basename } from 'node:path';
import { compile, buildExportSvg, LIBRARY } from 'sldeditor';
import { REPO } from './lib/paths.mjs';
import {
  createManifestWriter, writeCropFromSvg, cropOutPath,
  walkSvgsSync, slug,
} from './lib/crop_io.mjs';
import { pngFromSvg } from './lib/png.mjs';

const TP = join(REPO, 'Mock', 'third_party');
const WIDTHS = [96, 112, 128, 144, 160];

const args = process.argv.slice(2);
let perWidths = 3;
for (let i = 0; i < args.length; i++) {
  if (args[i] === '--per' && args[i + 1]) perWidths = Math.min(5, Number(args[++i]));
}

const log = createManifestWriter();
let n = 0;
const scales = WIDTHS.slice(0, perWidths);

async function fromSvgFile(source, svgPath, meta) {
  const base = slug(basename(svgPath, '.svg'));
  const rel = relative(join(TP, source), svgPath).replace(/\\/g, '/');
  const svg = readFileSync(svgPath, 'utf8');
  if (!svg.includes('<svg')) return;
  for (const w of scales) {
    const outPath = cropOutPath(source, [slug(dirnameLeaf(rel))], `${base}-w${w}`);
    try {
      await writeCropFromSvg(svg, outPath, log, { source, ...meta, file: rel, variant: `w${w}` }, w);
      n++;
    } catch (e) {
      process.stderr.write(`skip ${rel} w${w}: ${e.message}\n`);
    }
  }
}

function dirnameLeaf(rel) {
  const parts = rel.split('/');
  parts.pop();
  return parts.length ? parts.join('/') : '_root';
}

async function sldeditorAll() {
  for (const [kind] of LIBRARY) {
    for (const standard of ['iec', 'ansi']) {
      for (const w of scales) {
        const diagram = {
          version: '1',
          meta: { title: kind, labelMode: 'off', symbolStandard: standard },
          elements: [{ id: 'E1', kind, name: kind }],
          layout: { E1: { at: [72, 72] } },
          wires: [],
        };
        try {
          const model = compile(diagram);
          const svg = buildExportSvg(model, { background: 'white', title: kind });
          const outPath = cropOutPath('sldeditor', [standard], `${slug(kind)}-w${w}`);
          await writeCropFromSvg(svg, outPath, log, {
            source: 'sldeditor',
            type: kind,
            standard,
            variant: `w${w}`,
          }, w);
          n++;
        } catch (e) {
          process.stderr.write(`skip sldeditor ${kind} ${standard}: ${e.message}\n`);
        }
      }
    }
  }
}

async function electronicSymbols() {
  const root = join(TP, 'electronic-symbols');
  const manifestPath = join(root, 'manifest.json');
  if (!existsSync(manifestPath)) return;
  const list = JSON.parse(readFileSync(manifestPath, 'utf8'));
  for (const comp of list) {
    const svgPath = join(root, 'SVG', `${comp.filename}.svg`);
    if (!existsSync(svgPath)) continue;
    await fromSvgFile('electronic-symbols', svgPath, {
      type: comp.id,
      name: comp.name,
      category: comp.category,
      standard: comp.standard,
    });
  }
}

async function walkThirdParty(source, subdir = '', meta = {}) {
  const root = join(TP, source, subdir);
  if (!existsSync(root)) return;
  const svgs = walkSvgsSync(root);
  for (const p of svgs) {
    await fromSvgFile(source, p, { ...meta, library: source });
  }
}

async function tscircuitSymbols() {
  const assets = join(TP, 'schematic-symbols', 'assets', 'symbols');
  const generated = join(TP, 'schematic-symbols', 'generated');
  if (existsSync(assets)) {
    for (const p of walkSvgsSync(assets)) {
      await fromSvgFile('tscircuit', p, { source: 'tscircuit-assets' });
    }
  }
  if (existsSync(generated)) {
    for (const p of walkSvgsSync(generated)) {
      await fromSvgFile('tscircuit', p, { source: 'tscircuit-generated' });
    }
  }
}

async function circuitSymbolSvg() {
  const dir = join(TP, 'circuit-symbol-svg', 'symbols');
  if (!existsSync(dir)) return;
  for (const p of walkSvgsSync(dir)) {
    await fromSvgFile('circuit-symbol-svg', p, { source: 'circuit-symbol-svg' });
  }
}

console.log('Component crops (new sources only; no Schematex/ESL)\n');

await sldeditorAll();
await electronicSymbols();
await circuitSymbolSvg();
await tscircuitSymbols();
await walkThirdParty('electrical_template');
await walkThirdParty('SchematicSymbolsSVG');
await walkThirdParty('Inkscape_electric_Symbols');
await walkThirdParty('schemalib');

console.log(`\n${n} crops written under component-crops/`);
