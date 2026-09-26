# Synthetic data

Generator lives in `_tools/`. Outputs are `PLANT-01`…`PLANT-10` and `GEN-*`. Do not list those folders. Use `manifest.json` or open the one id the user named.

```bash
cd _tools
node generate.mjs --core          # 10 hand-authored plants
node generate.mjs --gen           # bulk tier
node generate.mjs PLANT-01        # one plant
node generate.mjs --no-data       # drawings and graphs only
node generate.mjs --days 7
node verify.mjs --core
node components.mjs --per 12      # isolated symbol crops → ../../component-symbols
```

Runs merge into `manifest.json`. Core specs: `plants.mjs`. Bulk specs: `plants.generated.mjs`.

`attributes` are printed on the drawing. `metadata` is not. Pixel coordinates = SVG bbox × `image.png_scale` (2).
