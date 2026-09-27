# Status

Updated: 2026-09-27

## Now

Synthetic corpus exists and is the development set. Real sheets are the untouched test set. Object-detection work has started: isolated symbol crops, not a trained model.

## Done

- Research plan in `plan.md` (RQ1–RQ4, metrics, four stages).
- Generator in `Synthetic Data/_tools/` (Schematex 1.1.0). Core `PLANT-01`…`PLANT-10` plus bulk `GEN-0001`… with 1,508 usable plants. Spec: `plan.md` §9.2.
- Each plant: `drawings/plant.sld|svg|png`, `graph/graph.json` (and csv), `data/*.csv`.
- `node verify.mjs` checks recoverability, §4.3 electrical validity, and telemetry. Core tier was verified clean. `Synthetic Data/README.md` still says "10 plants" and is stale — trust `plan.md` §9.2.
- Repo: `main` @ `10ec011`, origin `https://github.com/ishuu19/Single-Line-Diagram-and-Energy-Mapping.git`.
- Symbol-crop script: `Synthetic Data/_tools/components.mjs` → `component-symbols/` (YOLO). **64 symbol classes** + `text` (65 names): Schematex's 40 plus 24 hand-drawn in `symbols_extra.mjs` (panel, feeder, CT test block, fused voltage block, DC supply, NO/NC contact, terminal block, chiller, aux load, battery, inverter, rectifier, EV charger, soft starter, reactor, ground, NGR, static switch, pushbutton, pilot light, overload, fused disconnect, coil), 2–3 drawings each, plus alternative drawings for 13 common types. Regenerated 2026-09-27 with `--per 260`: 13,312 train + 3,328 val on disk. **Kaggle/Drive copies and `models/notebook_best.keras` are for the old 40-class set; re-upload and retrain.** The 24 new types exist as crops only, not in plant `graph.json`.
- Symbol-crop classifier in `src/Object Detection/Component Training/` (CircuitNet-inspired, see `Inspired/circuitnet.md`). Kaggle run with gated augmentation: 99.5% clean / 99.5% TTA / 99.3% degraded val; checkpoint committed as `models/notebook_best.keras`. Runner: `notebooks/kaggle_component_training.ipynb` (clone/pull repo, link attached datasets, call the scripts). Colab notebook is older.
- Held-out **printed** test crops: `Synthetic Data/_tools/components_test.mjs` → `component-symbols-test-printed/` (192 crops, 3 per type, 64 types, committed). Unseen fonts / strokes / tints / scales / 180° / zoom. `notebook_best` scores 36% clean, 39% TTA, 37% degraded there vs 99.5% val; 0° crops 59%, 90°/180° 21%. The classifier is fitted to the training style, not the symbols.
- External **test-only** crops: CGHD → `component-symbols-test/` via `build_cghd_test_crops.py` + `cghd_to_sld.json`. 16 crops on disk from partial HF cache; ~1,083 mappable when all CGHD images are available. `normalise_test_crops.py` maps them to the Schematex domain; `evaluate.py --split cghd-test` scores them (`--out-suffix _raw` for the un-normalised pass). On the 16 crops `notebook_best` scores 0% raw and 0% clean / 6% degraded normalised: the domain gap is not closed.

## Not started

- Annotation of the four real sheets (`Electric Sample Data/drawings/plant.pdf` only; no ground-truth JSON).
- Stage 1 LLM baseline, Stage 2 detector training, Stage 3 fusion, Stage 4 analytics.
- Full CGHD image download for `component-symbols-test/` (Hub rate-limited here; ~1k mappable crops once images are cached). Script: `build_cghd_test_crops.py`. Decision record: `docs/detection.md`.

## Next

Upload the regenerated 64-class `component-symbols/` to Kaggle, retrain (the 36% printed-test result argues for 180° and wider scale/stroke augmentation at the same time), re-score `--split printed-test` on the 192-crop set. CGHD stays as the harder, hand-drawn check. Then convert synthetic `graph.json` boxes to YOLO labels for full sheets. Real sheets stay held out.

## Conventions that affect results

- Edge types: `power` | `measurement` | `control` (bulk graphs may also use `protection`). Dashed line = measurement. Filled dot = junction; bare crossing = no edge.
- Score extraction against `attributes` (printed on the drawing). `metadata` is not drawn.
- `bbox` in `graph.json` is SVG user units. Pixel bbox = bbox × `image.png_scale` (2).
- Real sheets are test-only until the final transfer eval.
