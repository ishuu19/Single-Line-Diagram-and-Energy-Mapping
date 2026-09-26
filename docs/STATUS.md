# Status

Updated: 2026-09-26

## Now

Synthetic corpus exists and is the development set. Real sheets are the untouched test set. Object-detection work has started: isolated symbol crops, not a trained model.

## Done

- Research plan in `plan.md` (RQ1–RQ4, metrics, four stages).
- Generator in `Synthetic Data/_tools/` (Schematex 1.1.0). Core `PLANT-01`…`PLANT-10` plus bulk `GEN-0001`… with 1,508 usable plants. Spec: `plan.md` §9.2.
- Each plant: `drawings/plant.sld|svg|png`, `graph/graph.json` (and csv), `data/*.csv`.
- `node verify.mjs` checks recoverability, §4.3 electrical validity, and telemetry. Core tier was verified clean. `Synthetic Data/README.md` still says "10 plants" and is stale — trust `plan.md` §9.2.
- Repo has no commits. Origin `https://github.com/ishuu19/Single-Line-Diagram-and-Energy-Mapping.git` is empty. Do not commit `Synthetic Data/*/data/`, `Electric Sample Data/data/`, or `component-symbols/` — those stay on Drive. Drawings and `graph/` stay in git.
- Symbol-crop script: `Synthetic Data/_tools/components.mjs` → `component-symbols/` (YOLO, gitignored). 40 symbol classes + a `text` class (41 names in `data.yaml`). On disk so far: 40 train images (`*_00.png` only) and matching labels. Val is empty. Default run is `node components.mjs --per 12`.

## Not started

- Annotation of the four real sheets (`Electric Sample Data/drawings/plant.pdf` only; no ground-truth JSON).
- Stage 1 LLM baseline, Stage 2 detector training, Stage 3 fusion, Stage 4 analytics.
- Public dataset download (CGHD, CircuitHub9K, AITEE, Digitize-HCD). Decision record: `docs/detection.md`.

## Next

Finish the symbol-crop run (`--per 12`), then convert synthetic `graph.json` boxes to YOLO labels for full sheets. Real sheets stay held out.

## Conventions that affect results

- Edge types: `power` | `measurement` | `control` (bulk graphs may also use `protection`). Dashed line = measurement. Filled dot = junction; bare crossing = no edge.
- Score extraction against `attributes` (printed on the drawing). `metadata` is not drawn.
- `bbox` in `graph.json` is SVG user units. Pixel bbox = bbox × `image.png_scale` (2).
- Real sheets are test-only until the final transfer eval.
