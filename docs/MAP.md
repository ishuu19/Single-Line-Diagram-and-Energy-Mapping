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
| Isolated symbol crops | `Synthetic Data/_tools/components.mjs`, hand-drawn types in `_tools/symbols_extra.mjs`, `component-symbols/data.yaml` |
| External test symbol crops (CGHD) | `src/Object Detection/Component Training/build_cghd_test_crops.py` → `Data/component-symbols-test/` |
| Held-out printed test crops | `Synthetic Data/_tools/components_test.mjs` → `Data/component-symbols-test-printed/` (zip committed) |
| Train / evaluate the crop classifier on Kaggle | `src/Object Detection/Component Training/notebooks/kaggle_component_training.ipynb`, then that folder's `README.md` |
| Detector dataset choice | `docs/detection.md` |
| Full-sheet detection + wire tracing → graph | `src/Object Detection/SLD Training/README.md`, then `wires.py`; edit only `notebooks/kaggle-sld-pipeline.ipynb` (never `Results/*.ipynb`) |
| Run a notebook on Kaggle GPU from this PC (Kaggle API) | `src/kaggle_runner/README.md`, `run.py`, `jobs.json` |
| Real evaluation sheets | `Data/Electric Sample Data/drawings/plant.pdf` and `Data/Electric Sample Data/data/` |

`manifest.json` under `Synthetic Data/` is the corpus index. Prefer it over listing plant folders.
