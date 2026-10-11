#!/usr/bin/env node
/** Shallow-clone open symbol libraries (no Schematex / basverdoes ESL). */
import { existsSync, mkdirSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { execSync } from 'node:child_process';

const __dir = dirname(fileURLToPath(import.meta.url));
const root = join(__dir, '..', 'third_party');
mkdirSync(root, { recursive: true });

const REPOS = [
  { dir: 'electrical_template', url: 'https://github.com/AcheronProject/electrical_template.git' },
  { dir: 'electronic-symbols', url: 'https://github.com/chris-pikul/electronic-symbols.git' },
  { dir: 'circuit-symbol-svg', url: 'https://github.com/generalistprogrammer/circuit-symbol-svg.git' },
  { dir: 'SchematicSymbolsSVG', url: 'https://github.com/sjgallagher2/SchematicSymbolsSVG.git' },
  { dir: 'Inkscape_electric_Symbols', url: 'https://github.com/upb-lea/Inkscape_electric_Symbols.git' },
  { dir: 'schemalib', url: 'https://github.com/pacuserra/schemalib.git' },
  { dir: 'schematic-symbols', url: 'https://github.com/tscircuit/schematic-symbols.git' },
];

for (const { dir, url } of REPOS) {
  const dest = join(root, dir);
  if (existsSync(dest)) {
    console.log(`skip ${dir}`);
    continue;
  }
  console.log(`clone ${dir}`);
  execSync(`git clone --depth 1 ${url} ${dir}`, { cwd: root, stdio: 'inherit' });
}

console.log('Done. Run: node scripts/generate_component_crops.mjs --per 3');
