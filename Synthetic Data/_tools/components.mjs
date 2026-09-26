// Isolated SLD symbol crops for object detection.
//
// Each image is one Schematex symbol (IEEE 315 / ANSI, or IEC 60617) plus the
// nameplate text that belongs to it. Nothing else from a sheet is drawn.
// Boxes are YOLO: the symbol class, and a separate `text` class for every
// printed label (tag, rating, voltage, and letters that sit inside the glyph).
//
//   node components.mjs
//   node components.mjs --per 12

import { mkdirSync, writeFileSync, rmSync } from 'node:fs';
import { resolve, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';
import { render } from 'schematex';
import { parseSLDDSL, layoutSLD } from 'schematex/sld';
import { Resvg } from '@resvg/resvg-js';

const ROOT = resolve(dirname(fileURLToPath(import.meta.url)), '..', '..', 'component-symbols');
const ZOOM = 4;
const PAD = 16;

const TYPES = [
  'utility', 'generator', 'solar', 'wind', 'ups',
  'transformer', 'transformer_dy', 'transformer_yd', 'transformer_yy', 'transformer_dd',
  'autotransformer', 'transformer_3winding',
  'bus', 'bus_tie', 'hub',
  'breaker', 'breaker_vacuum', 'switch', 'switch_load', 'contactor', 'ground_switch',
  'ats', 'recloser', 'sectionalizer', 'fuse', 'fuse_cl',
  'ct', 'pt', 'relay', 'surge_arrester', 'ground_fault', 'rcd',
  'motor', 'load', 'capacitor_bank', 'harmonic_filter', 'vfd',
  'watthour_meter', 'demand_meter', 'consumer_unit',
];

const TEXT_CLASS = 'text';
const CLASSES = [...TYPES, TEXT_CLASS];
const CLASS_ID = new Map(CLASSES.map((name, i) => [name, i]));

const FONTS = ['Arial', '"Segoe UI"', 'Calibri', 'Verdana', 'Consolas', '"Times New Roman"'];
const PLACEMENTS = ['right', 'left', 'below', 'above'];
const PAPERS = [
  { bg: '#ffffff', ink: '#222222', muted: '#555555' },
  { bg: '#f7f4ea', ink: '#1a1a1a', muted: '#4a453c' },
  { bg: '#f3f6fb', ink: '#1a365d', muted: '#3d5a80' },
  { bg: '#ffffff', ink: '#111111', muted: '#333333' },
];

const perArg = process.argv.indexOf('--per');
const PER = perArg >= 0 ? Number(process.argv[perArg + 1]) : 12;

function mulberry32(seed) {
  let a = seed >>> 0;
  return function () {
    a = (a + 0x6d2b79f5) >>> 0;
    let t = Math.imul(a ^ (a >>> 15), 1 | a);
    t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t;
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
  };
}

function hash(s) {
  let h = 2166136261;
  for (const c of s) h = Math.imul(h ^ c.charCodeAt(0), 16777619);
  return h >>> 0;
}

const pick = (rng, list) => list[Math.floor(rng() * list.length)];
const rand = (rng, lo, hi) => lo + rng() * (hi - lo);
const nint = (rng, lo, hi) => lo + Math.floor(rng() * (hi - lo + 1));

function xml(s) {
  return String(s).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
}

function nameplate(type, rng) {
  const kv = pick(rng, ['480V', '400Y/230V', '208V', '600V', '4.16kV', '13.8kV', '20kV', '33kV', '138kV']);
  const amp = pick(rng, ['63 A', '100 A', '200 A', '400 A', '630 A', '800 A', '1200 A', '2000 A']);
  const kva = pick(rng, ['150 kVA', '500 kVA', '750 kVA', '1000 kVA', '1500 kVA', '2000 kVA', '15 MVA']);
  const kw = pick(rng, ['15 kW', '22 kW', '37 kW', '75 kW', '100 HP', '250 kW', '500 kW', '2 MW']);
  const tag = (prefix, lo, hi) => `${prefix}-${nint(rng, lo, hi)}`;

  const byType = {
    utility: () => ({ label: pick(rng, ['UTILITY', 'GRID', 'HV SOURCE', `${kv} SUPPLY ${pick(rng, ['A', 'B'])}`]), voltage: kv }),
    generator: () => ({ label: pick(rng, [tag('GEN', 1, 9), 'EMERGENCY GEN', 'DIESEL GEN']), rating: kw, voltage: kv }),
    solar: () => ({ label: pick(rng, ['PV ARRAY', tag('PV', 1, 6)]), rating: pick(rng, ['100 kW', '250 kW', '500 kW', '1 MW']), voltage: kv }),
    wind: () => ({ label: pick(rng, ['WIND TURBINE', tag('WT', 1, 8)]), rating: pick(rng, ['500 kW', '1 MW', '2 MW', '3 MW']), voltage: kv }),
    ups: () => ({ label: pick(rng, [tag('UPS', 1, 4), 'UPS SYSTEM']), rating: pick(rng, ['20 kVA', '40 kVA', '80 kVA', '100 kVA']), voltage: kv }),
    transformer: () => ({ label: tag('TX', 1600, 1699), rating: kva, voltage: `${pick(rng, ['13.8kV', '20kV', '33kV', '138kV'])}/${pick(rng, ['480V', '400V', '4.16kV'])}` }),
    autotransformer: () => ({ label: tag('TX', 1600, 1699), rating: kva, voltage: `${pick(rng, ['138kV', '69kV'])}/${pick(rng, ['69kV', '34.5kV'])}` }),
    transformer_3winding: () => ({ label: tag('TX', 1600, 1699), rating: kva, voltage: '138/13.8/4.16kV' }),
    bus: () => ({ label: tag('BUS', 400, 499), voltage: kv }),
    bus_tie: () => ({ label: tag('CB', 300, 399), rating: `${amp} / 3P / N.O.` }),
    hub: () => ({ label: tag('FD', 900, 999), rating: '3P+N' }),
    breaker: () => ({ label: tag('CB', 300, 399), rating: `MCCB / ${amp} / 3P`, voltage: kv }),
    breaker_vacuum: () => ({ label: tag('CB', 300, 399), rating: `VCB / ${amp} / 3P`, voltage: kv }),
    switch: () => ({ label: tag('DS', 1, 40), rating: `${amp} / 3P` }),
    switch_load: () => ({ label: tag('LS', 1, 40), rating: `${amp} / 3P` }),
    contactor: () => ({ label: tag('K', 1, 40), rating: `${amp} / 3P` }),
    ground_switch: () => ({ label: tag('GS', 1, 20), rating: amp }),
    ats: () => ({ label: tag('ATS', 1, 6), rating: amp, voltage: kv }),
    recloser: () => ({ label: tag('R', 1, 20), rating: amp }),
    sectionalizer: () => ({ label: tag('S', 1, 20), rating: amp }),
    fuse: () => ({ label: tag('FU', 1, 40), rating: pick(rng, ['40 A', '65 A', '100 A', '200 A']) }),
    fuse_cl: () => ({ label: tag('FU', 1, 40), rating: pick(rng, ['40 A CL', '100 A CL', '200 A CL']) }),
    ct: () => ({ label: tag('TA', 700, 799), rating: pick(rng, ['3 CTs / 200/5 A', '3 CTs / 400/5 A', '3 CTs / 800/5 A', '3 CTs / 1200/5 A']) }),
    pt: () => ({ label: tag('PT', 1, 30), rating: pick(rng, ['14400/120 V', '13800/120 V', '480/120 V']) }),
    relay: () => ({
      label: tag('RY', 1, 40),
      rating: pick(rng, ['Overcurrent', 'Differential', 'Undervoltage', 'Frequency']),
      device: pick(rng, ['51', '50', '87', '27', '59', '81', '86', '67']),
    }),
    surge_arrester: () => ({ label: tag('LA', 1200, 1299), voltage: kv }),
    ground_fault: () => ({ label: tag('GF', 1, 20), rating: pick(rng, ['30 mA', '100 mA', '300 mA']) }),
    rcd: () => ({ label: tag('RCD', 1, 20), rating: pick(rng, ['30 mA', '100 mA', '300 mA']) }),
    motor: () => ({ label: tag('MTR', 1100, 1199), rating: kw, voltage: kv }),
    load: () => ({ label: pick(rng, [tag('LP', 1, 40), 'PANEL', 'FEEDER', 'CHILLER']), rating: amp, voltage: kv }),
    capacitor_bank: () => ({ label: tag('CAP', 600, 699), rating: pick(rng, ['50 kVAR', '100 kVAR', '150 kVAR', '300 kVAR']) }),
    harmonic_filter: () => ({ label: tag('HF', 500, 599), rating: pick(rng, ['100 kVAR', '5th', '7th / 150 kVAR']) }),
    vfd: () => ({ label: tag('DRV', 800, 899), rating: kw, voltage: kv }),
    watthour_meter: () => ({ label: tag('PM', 1000, 1099), rating: pick(rng, ['kW / kWh', 'kWh', 'kW / kvar']) }),
    demand_meter: () => ({ label: tag('PM', 1000, 1099), rating: pick(rng, ['kW demand', 'kVA demand']) }),
    consumer_unit: () => ({ label: pick(rng, [tag('DB', 1, 12), 'CONSUMER UNIT', 'PANELBOARD']), rating: amp }),
  };

  const plate = (byType[type] ?? byType.transformer)();
  if (type.startsWith('transformer_')) {
    plate.label = tag('TX', 1600, 1699);
    plate.rating = kva;
    plate.voltage = `${pick(rng, ['13.8kV', '20kV', '33kV'])}/${pick(rng, ['480V', '400Y/230V', '208V'])}`;
  }
  return plate;
}

function keepFields(plate, mode) {
  if (mode === 'bare') return {};
  if (mode === 'tag') return { label: plate.label, device: plate.device };
  if (mode === 'tag_rating') return { label: plate.label, rating: plate.rating, device: plate.device };
  return plate;
}

function dslFor(type, standard, fields) {
  const attrs = [];
  for (const key of ['label', 'rating', 'voltage', 'device']) {
    if (fields[key]) attrs.push(`${key}: "${String(fields[key]).replace(/"/g, "'")}"`);
  }
  const head = `sld "crop" [standard: ${standard}]`;
  const body = attrs.length ? `n = ${type} [${attrs.join(', ')}]` : `n = ${type}`;
  return `${head}\n${body}\n`;
}

function extractStyle(svg) {
  const m = svg.match(/<style>([\s\S]*?)<\/style>/);
  if (!m) throw new Error('style block missing');
  return m[1];
}

function extractSymbol(svg, type) {
  if (type === 'bus') {
    const m = svg.match(/<line [^>]*class="lt-sld-bus"[^/]*\/>/);
    if (!m) throw new Error('bus line missing');
    return m[0];
  }
  const marker = `data-type="${type}"`;
  const at = svg.indexOf(marker);
  if (at < 0) throw new Error(`symbol group missing for ${type}`);
  const start = svg.lastIndexOf('<g', at);
  let depth = 0;
  for (let i = start; i < svg.length; i++) {
    if (svg.startsWith('<g', i)) depth++;
    else if (svg.startsWith('</g>', i)) {
      depth--;
      if (depth === 0) return svg.slice(start, i + 4);
    }
  }
  throw new Error(`unbalanced symbol group for ${type}`);
}

function attr(tag, name) {
  const m = tag.match(new RegExp(`${name}="([^"]*)"`));
  return m ? Number(m[1]) : null;
}

function busBox(markup) {
  const x1 = attr(markup, 'x1');
  const y1 = attr(markup, 'y1');
  const x2 = attr(markup, 'x2');
  const y2 = attr(markup, 'y2');
  const pad = 3;
  return {
    x0: Math.min(x1, x2) - pad,
    y0: Math.min(y1, y2) - pad,
    x1: Math.max(x1, x2) + pad,
    y1: Math.max(y1, y2) + pad,
    cx: (x1 + x2) / 2,
    cy: (y1 + y2) / 2,
  };
}

function symbolBox(node) {
  return {
    x0: node.x - node.halfWidth,
    y0: node.topY,
    x1: node.x + node.halfWidth,
    y1: node.bottomY,
    cx: node.x,
    cy: node.y,
  };
}

function xform(x, y, cx, cy, deg, scale) {
  const rad = (deg * Math.PI) / 180;
  const dx = (x - cx) * scale;
  const dy = (y - cy) * scale;
  const c = Math.cos(rad);
  const s = Math.sin(rad);
  return [cx + c * dx - s * dy, cy + s * dx + c * dy];
}

function xformBox(box, cx, cy, deg, scale) {
  const corners = [[box.x0, box.y0], [box.x1, box.y0], [box.x1, box.y1], [box.x0, box.y1]];
  const pts = corners.map(([x, y]) => xform(x, y, cx, cy, deg, scale));
  const xs = pts.map((p) => p[0]);
  const ys = pts.map((p) => p[1]);
  return { x0: Math.min(...xs), y0: Math.min(...ys), x1: Math.max(...xs), y1: Math.max(...ys) };
}

function withCenter(box) {
  return { ...box, cx: (box.x0 + box.x1) / 2, cy: (box.y0 + box.y1) / 2 };
}

function internalTexts(markup, originX, originY) {
  const out = [];
  const re = /<text\b([^>]*)>([^<]*)<\/text>/g;
  for (const m of markup.matchAll(re)) {
    const tag = m[1];
    const text = m[2].replace(/&amp;/g, '&').replace(/&lt;/g, '<').replace(/&gt;/g, '>');
    if (!text.trim()) continue;
    const x = attr(tag, 'x') ?? 0;
    const y = attr(tag, 'y') ?? 0;
    const fontSize = attr(tag, 'font-size') ?? 11;
    const anchor = /text-anchor="([^"]*)"/.exec(tag)?.[1] ?? 'start';
    const width = text.length * fontSize * 0.62;
    let x0 = originX + x;
    if (anchor === 'middle') x0 -= width / 2;
    else if (anchor === 'end') x0 -= width;
    out.push({
      text,
      role: 'glyph',
      fontSize,
      x0,
      y0: originY + y - fontSize,
      x1: x0 + width,
      y1: originY + y + 3,
    });
  }
  return out;
}

function placeLabels(box, labels, placement) {
  const gap = 3;
  const blockH = labels.reduce((sum, l) => sum + l.fontSize + gap, 0);
  let y = placement === 'below'
    ? box.y1 + 10
    : placement === 'above'
      ? box.y0 - 6 - blockH
      : box.cy - blockH / 2;
  return labels.map((l) => {
    const x = placement === 'right'
      ? box.x1 + 8
      : placement === 'left'
        ? box.x0 - 8 - l.width
        : box.cx - l.width / 2;
    const item = {
      text: l.text,
      role: l.role,
      fontSize: l.fontSize,
      x,
      y: y + l.fontSize,
    };
    y += l.fontSize + gap;
    item.x0 = item.x;
    item.y0 = item.y - item.fontSize;
    item.x1 = item.x + l.width;
    item.y1 = item.y + 3;
    return item;
  });
}

function restyle(css, { font, ink, muted, stroke }) {
  return css
    .replace(/font-family:[^;]+;/, `font-family: ${font}, "Helvetica Neue", sans-serif;`)
    .replaceAll('#222222', ink)
    .replaceAll('#111111', ink)
    .replaceAll('#555555', muted)
    .replace(/stroke-width:\s*([\d.]+)/g, (_, n) => `stroke-width: ${(Number(n) * stroke).toFixed(2)}`);
}

function closeBlade(markup) {
  if (!markup.includes('data-sld-role="blade"')) return markup;
  return markup.replace(/<line ([^>]*data-sld-role="blade"[^>]*)\/>/, (full, attrs) => {
    const next = attrs
      .replace(/x2="[^"]*"/, 'x2="0"')
      .replace(/y2="[^"]*"/, 'y2="-14"');
    return `<line ${next}/>`;
  });
}

function yoloLine(className, box, crop) {
  const w = box.x1 - box.x0;
  const h = box.y1 - box.y0;
  if (w < 1 || h < 1) return null;
  const cx = (box.x0 + box.x1) / 2 - crop.x;
  const cy = (box.y0 + box.y1) / 2 - crop.y;
  const vals = [cx / crop.w, cy / crop.h, w / crop.w, h / crop.h];
  if (vals.some((v) => !Number.isFinite(v))) return null;
  const clamped = vals.map((v) => Math.min(1, Math.max(0, v)));
  return `${CLASS_ID.get(className)} ${clamped.map((v) => v.toFixed(6)).join(' ')}`;
}

function renderSample(type, index) {
  const rng = mulberry32(hash(`${type}:${index}`));
  const standard = rng() < 0.55 ? 'ansi' : 'iec';
  const mode = pick(rng, ['full', 'full', 'tag_rating', 'tag', 'bare']);
  const fields = keepFields(nameplate(type, rng), mode);
  const orientation = pick(rng, [0, 0, 0, 90, 270]);
  const scale = pick(rng, [0.9, 1, 1, 1.15]);
  const placement = pick(rng, PLACEMENTS);
  const paper = pick(rng, PAPERS);
  const font = pick(rng, FONTS);
  const stroke = pick(rng, [0.85, 1, 1.35, 1.8]);
  const closed = rng() < 0.35;
  const idSize = pick(rng, [11, 12, 13]);
  const ratingSize = pick(rng, [9, 10, 11]);

  const dsl = dslFor(type, standard, fields);
  const ast = parseSLDDSL(dsl);
  const layout = layoutSLD(ast);
  const node = layout.nodes[0];
  const svg = render(dsl);

  let markup = extractSymbol(svg, type);
  if (closed) markup = closeBlade(markup);

  const rawBox = type === 'bus' ? busBox(markup) : symbolBox(node);
  const symBox = withCenter(xformBox(rawBox, rawBox.cx, rawBox.cy, orientation, scale));

  const measured = new Map(node.labels.map((l) => [l.text, l]));
  const external = [];
  for (const [key, role, size] of [['label', 'id', idSize], ['rating', 'rating', ratingSize], ['voltage', 'voltage', ratingSize]]) {
    const text = fields[key];
    if (!text) continue;
    if (markup.includes(`>${xml(text)}<`)) continue;
    const hit = measured.get(text);
    const base = hit?.fontSize ?? size;
    const width = (hit?.width ?? text.length * base * 0.62) * (size / base) * 1.08;
    external.push({ text, role, fontSize: size, width });
  }
  const placed = external.length ? placeLabels(symBox, external, placement) : [];

  const glyphOriginX = type === 'bus' ? 0 : node.x;
  const glyphOriginY = type === 'bus' ? 0 : node.y;
  const glyphs = internalTexts(markup, glyphOriginX, glyphOriginY).map((g) => {
    const moved = xformBox(g, rawBox.cx, rawBox.cy, orientation, scale);
    return { ...g, ...moved, role: 'glyph' };
  });

  const boxes = [symBox, ...placed, ...glyphs];
  const crop = {
    x: Math.min(...boxes.map((b) => b.x0)) - PAD,
    y: Math.min(...boxes.map((b) => b.y0)) - PAD,
    x1: Math.max(...boxes.map((b) => b.x1)) + PAD,
    y1: Math.max(...boxes.map((b) => b.y1)) + PAD,
  };
  crop.w = crop.x1 - crop.x;
  crop.h = crop.y1 - crop.y;

  const style = restyle(extractStyle(svg), { font, ink: paper.ink, muted: paper.muted, stroke });
  const spin = `translate(${rawBox.cx},${rawBox.cy}) rotate(${orientation}) scale(${scale}) translate(${-rawBox.cx},${-rawBox.cy})`;
  const texts = placed.map((l) => (
    `<text x="${l.x.toFixed(2)}" y="${l.y.toFixed(2)}" font-size="${l.fontSize}" class="${l.role === 'id' ? 'lt-sld-id-side' : 'lt-sld-rating-side'}">${xml(l.text)}</text>`
  )).join('\n');

  const sheet = `<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" width="${crop.w.toFixed(2)}" height="${crop.h.toFixed(2)}" viewBox="${crop.x.toFixed(2)} ${crop.y.toFixed(2)} ${crop.w.toFixed(2)} ${crop.h.toFixed(2)}">
<style>${style}</style>
<rect x="${crop.x.toFixed(2)}" y="${crop.y.toFixed(2)}" width="${crop.w.toFixed(2)}" height="${crop.h.toFixed(2)}" fill="${paper.bg}"/>
<g transform="${spin}">${markup}</g>
${texts}
</svg>`;

  const png = new Resvg(sheet, {
    fitTo: { mode: 'zoom', value: ZOOM },
    background: paper.bg,
    font: {
      loadSystemFonts: false,
      defaultFontFamily: 'Arial',
      fontFiles: [
        'C:/Windows/Fonts/arial.ttf',
        'C:/Windows/Fonts/calibri.ttf',
        'C:/Windows/Fonts/verdana.ttf',
        'C:/Windows/Fonts/consola.ttf',
        'C:/Windows/Fonts/times.ttf',
        'C:/Windows/Fonts/segoeui.ttf',
      ],
    },
  }).render();

  const lines = [yoloLine(type, symBox, crop)];
  const textBoxes = [...placed, ...glyphs].map((b) => ({
    text: b.text,
    role: b.role,
    yolo: yoloLine(TEXT_CLASS, b, crop),
  })).filter((b) => b.yolo);
  for (const b of textBoxes) lines.push(b.yolo);

  return {
    png: png.asPng(),
    label: lines.filter(Boolean).join('\n') + '\n',
    meta: {
      type,
      standard,
      orientation,
      scale,
      placement: external.length ? placement : 'none',
      mode,
      closed: closed && markup.includes('y2="-14"'),
      font,
      paper: paper.bg,
      fields,
      texts: textBoxes.map(({ text, role }) => ({ text, role })),
    },
  };
}

rmSync(ROOT, { recursive: true, force: true });
for (const split of ['train', 'val']) {
  mkdirSync(`${ROOT}/images/${split}`, { recursive: true });
  mkdirSync(`${ROOT}/labels/${split}`, { recursive: true });
}

const manifest = [];
const failures = [];
let train = 0;
let val = 0;

for (const type of TYPES) {
  for (let i = 0; i < PER; i++) {
    const split = i % 5 === 4 ? 'val' : 'train';
    const stem = `${type}_${String(i).padStart(2, '0')}`;
    try {
      const sample = renderSample(type, i);
      writeFileSync(`${ROOT}/images/${split}/${stem}.png`, sample.png);
      writeFileSync(`${ROOT}/labels/${split}/${stem}.txt`, sample.label);
      manifest.push({ file: `images/${split}/${stem}.png`, split, ...sample.meta });
      if (split === 'train') train++;
      else val++;
    } catch (err) {
      failures.push({ type, i, error: err.message });
      console.error(`FAIL ${stem}: ${err.message}`);
    }
  }
  console.log(`${type.padEnd(22)} ${PER} variants`);
}

writeFileSync(`${ROOT}/classes.txt`, CLASSES.join('\n') + '\n');
writeFileSync(`${ROOT}/data.yaml`, [
  `path: ${ROOT.replaceAll('\\', '/')}`,
  'train: images/train',
  'val: images/val',
  `nc: ${CLASSES.length}`,
  'names:',
  ...CLASSES.map((name, i) => `  ${i}: ${name}`),
  '',
].join('\n'));
writeFileSync(`${ROOT}/manifest.jsonl`, manifest.map((row) => JSON.stringify(row)).join('\n') + '\n');

console.log(`\n${train} train  ${val} val  ${failures.length} failed`);
console.log(ROOT);
