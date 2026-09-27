# Map

Open the row for the task. Do not explore siblings.

| Task | Open |
|---|---|
| What is true now | `docs/STATUS.md` |
| Why a choice was made | `docs/LOG.md` (newest at bottom) |
| Research questions, metrics, stages | `plan.md` — only for design or write-up |
| Corpus layout, graph.json fields, telemetry rules | `Synthetic Data/README.md`, then `plan.md` §9.2 if they disagree |
| Regenerate or verify plants | `Synthetic Data/_tools/generate.mjs`, `verify.mjs`. Commands in `Synthetic Data/AGENTS.md` |
| Plant specs | `_tools/plants.mjs` (core), `_tools/plants.generated.mjs` (bulk) |
| Graph + telemetry construction | `_tools/build.mjs`, `_tools/series.mjs` |
| One named plant | `Synthetic Data/<ID>/graph/graph.json` only. Skip `data/` unless the task is telemetry |
| Isolated symbol crops | `Synthetic Data/_tools/components.mjs`, `component-symbols/data.yaml` |
| External test symbol crops (CGHD) | `src/Object Detection/Component Training/build_cghd_test_crops.py` → `component-symbols-test/` |
| Train / evaluate the crop classifier on Kaggle | `src/Object Detection/Component Training/notebooks/kaggle_component_training.ipynb`, then that folder's `README.md` |
| Detector dataset choice | `docs/detection.md` |
| Real evaluation sheets | `Electric Sample Data/drawings/plant.pdf` and `Electric Sample Data/data/` |

`manifest.json` under `Synthetic Data/` is the corpus index. Prefer it over listing plant folders.
