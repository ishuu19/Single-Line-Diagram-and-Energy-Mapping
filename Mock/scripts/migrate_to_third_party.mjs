#!/usr/bin/env node
/** Move Synthetic Data/Mock -> Mock/third_party/corpus; drop collage-only sheet rows. */
import { existsSync, mkdirSync, renameSync, readFileSync, writeFileSync, rmSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { CORPUS_ROOT, REPO } from './lib/paths.mjs';

const legacy = join(REPO, 'Synthetic Data', 'Mock');
const args = process.argv.slice(2);
const pruneCollages = args.includes('--prune-collages');

if (!existsSync(legacy)) {
  console.log('No legacy Synthetic Data/Mock folder.');
  process.exit(0);
}

mkdirSync(dirname(CORPUS_ROOT), { recursive: true });

if (!existsSync(CORPUS_ROOT)) {
  renameSync(legacy, CORPUS_ROOT);
  console.log(`Moved ${legacy} -> ${CORPUS_ROOT}`);
} else {
  console.log(`Target exists: ${CORPUS_ROOT} (merge manually if needed)`);
}

const manifestPath = join(CORPUS_ROOT, 'manifest.json');
if (!existsSync(manifestPath)) process.exit(0);

const manifest = JSON.parse(readFileSync(manifestPath, 'utf8'));
const collageRe = /^MOCK-(COL|ESL)-/;
const before = manifest.plants.length;
const kept = [];
const dropped = [];

for (const p of manifest.plants) {
  if (pruneCollages && collageRe.test(p.id)) {
    dropped.push(p.id);
    if (pruneCollages) {
      const dir = join(CORPUS_ROOT, p.id);
      if (existsSync(dir)) rmSync(dir, { recursive: true, force: true });
    }
    continue;
  }
  if (!p.kind) p.kind = collageRe.test(p.id) ? 'collage' : 'full-sheet';
  kept.push(p);
}

manifest.plants = kept;
manifest.corpus_root = 'Mock/third_party/corpus';
writeFileSync(manifestPath, JSON.stringify(manifest, null, 2));
console.log(`manifest: ${before} -> ${kept.length} (dropped ${dropped.length} collage rows)`);

if (existsSync(legacy) && legacy !== CORPUS_ROOT) {
  mkdirSync(legacy, { recursive: true });
  writeFileSync(
    join(legacy, 'README.txt'),
    'Mock corpus moved to Mock/third_party/corpus/\n',
  );
}
