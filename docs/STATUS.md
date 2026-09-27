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
- Symbol-crop script: `Synthetic Data/_tools/components.mjs` → `component-symbols/` (YOLO). 40 symbol classes + a `text` class (41 names in `data.yaml`). On disk and on Drive: 8,320 `train` + 2,080 `val` crops in `manifest.jsonl`, 40 symbol types (`text` never appears as a crop). Default run is `node components.mjs --per 12`.
- Symbol-crop classifier in `src/Object Detection/Component Training/` (CircuitNet-inspired, see `Inspired/circuitnet.md`). Kaggle run with gated augmentation: 99.5% clean / 99.5% TTA / 99.3% degraded val; checkpoint committed as `models/notebook_best.keras`. Runner: `notebooks/kaggle_component_training.ipynb` (clone/pull repo, link attached datasets, call the scripts). Colab notebook is older.
- External **test-only** crops: CGHD → `component-symbols-test/` via `build_cghd_test_crops.py` + `cghd_to_sld.json`. 16 crops on disk from partial HF cache; ~1,083 mappable when all CGHD images are available. `normalise_test_crops.py` maps them to the Schematex domain; `evaluate.py --split cghd-test` scores them (`--out-suffix _raw` for the un-normalised pass). On the 16 crops `notebook_best` scores 0% raw and 0% clean / 6% degraded normalised: the domain gap is not closed.

## Not started

- Annotation of the four real sheets (`Electric Sample Data/drawings/plant.pdf` only; no ground-truth JSON).
- Stage 1 LLM baseline, Stage 2 detector training, Stage 3 fusion, Stage 4 analytics.
- Full CGHD image download for `component-symbols-test/` (Hub rate-limited here; ~1k mappable crops once images are cached). Script: `build_cghd_test_crops.py`. Decision record: `docs/detection.md`.

## Next

Run the Kaggle notebook against the full CGHD test upload (~1k crops) to get a real domain-shift number; the 16-crop score is not meaningful. Then convert synthetic `graph.json` boxes to YOLO labels for full sheets. Real sheets stay held out.

## Conventions that affect results

- Edge types: `power` | `measurement` | `control` (bulk graphs may also use `protection`). Dashed line = measurement. Filled dot = junction; bare crossing = no edge.
- Score extraction against `attributes` (printed on the drawing). `metadata` is not drawn.
- `bbox` in `graph.json` is SVG user units. Pixel bbox = bbox × `image.png_scale` (2).
- Real sheets are test-only until the final transfer eval.
