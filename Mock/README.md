# Mock corpus (external generators)

Supplementary data built **outside** `Synthetic Data/_tools/`.

## Layout

| Path | Contents |
|------|----------|
| `Mock/scripts/` | Generators |
| `Mock/third_party/corpus/` | Full sheets (`MOCK-ST`, `MOCK-SLE`, `MOCK-MIX`, `GEN-MOCK-*`) + `manifest.json` |
| `Mock/third_party/corpus/component-crops/` | **Isolated symbol PNGs** (sldeditor IEC/ANSI, Acheron, electronic-symbols, tscircuit, …) + `manifest.jsonl` |
| `Mock/third_party/*` | Cloned symbol repos (`npm run setup`) |

Legacy path `Synthetic Data/Mock/` is retired after migration (stub README only).

PNG exports are flattened **opaque RGB PNG** (not RGBA) so browsers and training tools see a normal `image/png`.

## Generate

```bash
cd Mock
npm install
npm run setup
node scripts/migrate_to_third_party.mjs --prune-collages   # once, if upgrading
npm run setup
node scripts/generate_component_crops.mjs --per 3
node scripts/generate_mixed_sheets.mjs --count 120
node scripts/generate_sldeditor.mjs --count 100
node scripts/generate_all.mjs --count 100
```

Do **not** use `generate_*_collage.mjs` for training sheets — those were stamp collages; use **component crops** instead.

YOLO full sheets: `python "src/Object Detection/SLD Training/build_sld_dataset.py" --mock` (skips `MOCK-COL` / `MOCK-ESL`).
