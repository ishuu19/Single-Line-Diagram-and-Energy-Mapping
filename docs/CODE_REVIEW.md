# Code review: mistakes and inconsistencies

Date: 2026-10-12. Scope: `src/Object Detection/` (Component Training, SLD Training, `nbkit/`, the v3 notebook), `src/kaggle_runner/jobs.json`, and the docs that describe them. Everything below was fixed on 2026-10-12 (see the Status column at the end of each section and section G).

How it was checked: read every Python file and the 81 cells of `kaggle-sld-pipeline-v3.ipynb`, compiled all `.py` files (no syntax errors, `node --check` clean on `_tools/*.mjs`), loaded the data and the committed models locally, and ran the wire tracer with true boxes on 3 `sld-sheets-v3` test sheets (edge recall 0.87 / 0.75 / 1.0, so the tracer itself works).

## A. Things that stop the run

| # | Where | Problem | Fix |
|---|---|---|---|
| A1 | Notebook cell 12 (third `nb.ok`) | `man.type.nunique() >= len(CLASS_NAMES)` compares 66 symbol types in the manifest with 67 names in `classes.txt` (the 67th is `text`, which is never a crop). Verified on `Data/component-symbols`: 66 types, 67 names, `text` not in the manifest. The check fails, so the notebook stops with `CHECK FAILED` before any training. | Compare against `set(CLASS_NAMES) - {"text"}`, or use `cdata.classifier_classes`. Only the *missing* types should be reported. |
| A2 | Notebook cells 11 and 46 on a local PC | `nb.io.link()` refuses to replace a real folder. `Data/component-symbols`, `Data/component-symbols-test-printed` and `Data/sld-sheets` are real folders here, so it raises `FileExistsError`. The notebook also hard-codes `/kaggle/working` and `/kaggle/input`. It only works on Kaggle or Colab. | Run it on Kaggle/Colab, or use the scripts locally (section E). |
| A3 | `kaggle_runner/jobs.json`, job `sld-pipeline-v3` | Attaches `sld-sheets-v2` (23 compacted classes, split by sheet id, no `build_info.json`) and `sld-component-dataset` (the old crop set). The notebook and the docs expect the 2026-10-04 release (`sld-sheets-v3`, 42 classes, structure split; `component-symbols-v4`, 140,056 crops with a `val` split). With the old datasets the run is not the run STATUS describes, and the old crop set has no `val` split. | Upload both v3/v4 zips to Kaggle and change the slugs in `jobs.json`. |
| A4 | Notebook cell 43 | `COMP_TAG = globals().get("COMP_TAG") or next(...)`. Part A sets `COMP_TAG`, but cell 43 first deletes `clf`, `scored` and so on and then loads the classifier by `COMP_TAG` from `Component Training/models`. If `restore()` copied nothing (Kaggle without an attached models dataset and `COMP_EPOCHS = 0`) the `next(...)` raises `StopIteration` with no message. Same pattern in `reclassify.load_classifier` (default weights). | Raise a clear `FileNotFoundError` naming the folder and the tags searched. |

## B. Wrong or inconsistent numbers and results

| # | Where | Problem |
|---|---|---|
| B1 | Detector epochs, four values | Notebook cell 3: `SLD_EPOCHS = 20`. `SLD Training/config.py`: `EPOCHS = 25`. `STATUS.md` (v3 batch bullet): `SLD_EPOCHS=60`. `SLD Training/README.md`: `train_sld.py --epochs 60`. Commit `92e9fdd` says 60 to 25. Pick one. Note also that cell 3 writes `SLD_EPOCHS =20` and `is_smoke()` treats anything below 20 as a smoke run, so 20 is exactly the edge. |
| B2 | Resize differs between training and inference | Training (`data._decode_uint8`) uses `tf.image.resize_with_pad(..., antialias=True)` and rounds to uint8. `reclassify._crop` and `nbkit.classifier.score_sets` call `resize_with_pad` without `antialias` and keep float. Sheet crops and the notebook's accuracy numbers therefore see a slightly different image from the one the model was trained on. Small but systematic, and it matters most for thin lines at 128 px. |
| B3 | `copy_paste=0.1` in `AUG` (`nbkit/sheets.py`) and `train_sld.train` | Ultralytics `copy_paste` needs segmentation masks. The labels are plain boxes, so this setting does nothing. The notebook's augmentation panels also do not draw it. Either remove it or stop describing it as applied. |
| B4 | Cell 21 and cell 12 messages | Say validation is "carved from train" and the test split "stays untouched". The v4 manifest has a real `val` split (134,056 / 3,000 / 3,000), so `train_val_rows` uses it and nothing is carved. The text is stale, not the logic. |
| B5 | Cell 47 comment | "data.yaml lists only the symbol types present in the corpus". The v3 release uses the fixed 42-class list (`config.DETECTOR_CLASSES`). The check `len(ctx.classes) >= 20` is far too loose to catch a v2 (23-class) dataset being attached, which is what A3 would do. Tighten to `== len(config.DETECTOR_CLASSES)`. |
| B6 | Saved classifier names | Cell 24 calls `ctrain.callbacks("v3")` and saves `v3.keras`, but never calls `ctrain.save_class_names("v3", ...)`. Only the folder-wide `class_names.json` is written, which `train.py` itself marks as "last run only; prefer `<tag>.names.json`". `reclassify.load_classifier` and `evaluate.py` then fall back to it (this already prints a warning for `custom_best` locally). Two checkpoints with different class lists would silently share one file. |
| B7 | `custom_best.keras` and `notebook_best.keras` are stale | Both were trained before the audit fixes (different split, no half-turn rule, 40-66 classes). Cell 32 still scores them against the new held-out sets and may pick them. `STATUS.md` already says retrain is pending; the notebook comparison between `v3_best` and `custom_best` is not like for like. |
| B8 | `STATUS.md` header facts | "Repo: `main` @ `10ec011`" is the first commit; HEAD is `c18026c`. STATUS also still describes `sld-sheets-v2` as the current sheets in two bullets while the Next section says v3. `Synthetic Data/README.md` still says "10 plants" (STATUS admits this). |

## C. Code that is wrong or fragile

| # | File | Problem |
|---|---|---|
| C1 | `Component Training/data.py` (`load_class_names`, `read_manifest`, `rows_from_yolo_labels`) | `open(path)` / `read_text()` without `encoding="utf-8"`. Works today (the manifest is ASCII, checked with cp1252), but the next non-ASCII font name or label on a Windows machine breaks it. `nbkit` and `SLD Training` do pass `encoding`. |
| C2 | `Component Training/tune.py` | `keras-tuner` is in `requirements.txt` but is not installed in this environment (`pip list`), so `tune.py` fails on import here. Also `tuner.oracle.get_best_trials(args.trials)` uses the *near*-mode trial count in wide (Hyperband) mode. |
| C3 | `Component Training/evaluate.py` | `load_datasets(class_names=...)` builds the training dataset just to get `val_ds` (class weights over 134k labels, dataset graph). Wasted work.  |
| C4 | Notebook cell 32 | `(PRINTED / "manifest.jsonl").open()` is never closed and has no `strip()` guard, so one blank line (unlike `load_manifest`, which guards) raises `JSONDecodeError`. |
| C5 | `SLD Training/config.py` | `SHEETS_DIR = Data/sld-sheets` points at the *old* 23-class, id-split dataset (no `build_info.json`). `graph_eval.py`, `predict_graph.py`, `train_sld.py --data` default to it, and `build_sld_dataset.py` (no `--refresh`) exits with "old compacted class ids". The v3 dataset lives in `Data/sld-sheets-v3` and nothing points at it. Locally you must pass `--data` or edit `config`. |
| C6 | `SLD Training/requirements.txt` | Missing `opencv-python`, `tqdm` (both imported by `nbkit/sheets.py`) and `tensorflow` (needed by `reclassify.py`). Present locally by accident. |
| C7 | `wires.py` performance | `_scan_line` does `next(idx for idx, seg in enumerate(segs_all) if seg[0] == s0)` for every segment (quadratic per row), and `net_edges` runs one geodesic MCP per member of a net. Big bus nets on a 3,000+ px sheet are slow; it is not wrong. |
| C8 | `build_sld_dataset.py` docstring | Refers to `notebooks/kaggle_sld_training.ipynb`. The files are `kaggle-sld-stage-b.ipynb` / `kaggle-sld-pipeline-v3.ipynb` (hyphens, different names). `SLD Training/README.md` has the same wrong underscore names (`kaggle_sld_pipeline.ipynb`, `kaggle_sld_training.ipynb`). |
| C9 | Git | `__pycache__/*.pyc` files are tracked (`git status` shows two modified). They are rewritten on every run and make the tree dirty. Add `__pycache__/` to `.gitignore` and `git rm --cached` them. |

## D. Documentation that disagrees with the code

- `docs/MAP.md` row for held-out printed crops says "(zip committed)"; STATUS says "no `*.zip` in git" and the folder is gitignored.
- STATUS quotes the 99.5 % result for `notebook_best` in the Done list, and later says all earlier scores used the old split and metrics. Mark the 99.5 % figure as superseded where it is quoted.
- STATUS says the v3 notebook was "smoke-tested locally on a repo copy"; the current notebook has changed since (Colab/Drive cells, `SLD_EPOCHS` edit, Part A/B module handling). It has never run on Kaggle or Colab after those changes.

## E. Suggested order to get it running

1. Fix A1 (one line in cell 12), tighten B5, and set B1 to one agreed value.
2. Upload `component-symbols-v4.zip` and `sld-sheets-v3.zip` from `Data/releases/2026-10-04/` and update `jobs.json` (A3). Push the repo first: the notebook clones `main`, and local `main` equals `origin/main` (`c18026c`), so a clean push is already done.
3. Fix B6 (write `v3.names.json`) and B2 (use `antialias=True` and uint8 rounding in `reclassify._crop` and `score_sets`) before the long run, otherwise the numbers you get cannot be compared with the training metrics.
4. For a local check without Kaggle: `cd "src/Object Detection/Component Training"` then `python evaluate.py --model custom_best --split test`; and in `SLD Training`, `python graph_eval.py --split test --limit 20` after pointing `config.SHEETS_DIR` and `DATA_YAML` at `Data/sld-sheets-v3` (C5).

## F. Checked and fine

`wires.trace` and `graph_eval.score_sheet` on true boxes; `sld_data` coordinate conversions; `build_sld_dataset` split logic (structure hash, `PLANT-*` always test); `data.train_val_rows` with the `val` split; `train.lr_schedule` and two-phase backbone fit; `train_sld` child-process progress bars; `nbkit.io.locate`/`link`/`bundle` guards; manifest has no duplicate files (140,056 unique) and the committed `custom_best.keras` loads and matches `class_names.json` (66 outputs).

## G. Fix status (2026-10-12)

| Item | Status |
|---|---|
| A1 | Fixed: cell 12 ignores `text` when comparing `classes.txt` with the manifest. |
| A2 | Cell 3 now stops with a clear message when `/kaggle/input` does not exist and it is not Colab. Local runs: use the scripts. |
| A3 | `jobs.json` v3 job now attaches `anayedeshan/component-symbols-v4` and `anayedeshan/sld-sheets-v3`. **You must upload the two release zips (unpacked) under those slugs.** |
| A4 | `load_classifier` and cell 43/44 raise a clear error naming the folder and the tags searched. |
| B1 | `SLD_EPOCHS = 25` in the notebook, `config.EPOCHS = 25`, README and STATUS agree. |
| B2 | `reclassify._crop` and `score_sets` use `antialias=True` and uint8 rounding, like training. |
| B3 | `copy_paste` removed from `AUG`; `train_sld.train` defaults to 0.0. |
| B4, B5 | Cell 12/21 messages corrected; cell 47 now requires `ctx.classes == config.DETECTOR_CLASSES`. |
| B6 | Cell 24 writes `v3.names.json` and `v3_best.names.json`. |
| B7 | Not a code bug: cell 32 scores `v3_best` and `custom_best` on the same held-out sets and keeps the better one. Retrain to replace `custom_best`. |
| B8, D | STATUS, MAP and LOG corrected (commit hash, epochs, superseded 99.5 %, zip not committed). |
| C1 | `data.py` reads files as UTF-8. |
| C2 | `tune.py` uses its own count for best trials in wide mode (`keras-tuner` still has to be installed to run it). |
| C3 | `evaluate.py` builds only the validation pipeline. |
| C4 | Cell 32 reads the printed manifest with a closed file and a blank-line guard. |
| C5 | `SLD Training/config.py` `SHEETS_DIR` is `Data/sld-sheets-v3`. |
| C6 | `SLD Training/requirements.txt` lists pandas, tqdm, opencv-python, tensorflow. |
| C7 | `wires._scan_line` no longer searches the segment list for every segment (same output: 3 test sheets give identical scores). |
| C8 | README / `build_sld_dataset.py` notebook names corrected. |
| C9 | The 11 tracked `__pycache__` files are removed from the index (`.gitignore` already ignored them). |

Verified locally: all Python files compile; wire tracer scores unchanged on 3 v3 sheets; `evaluate.py --model custom_best --split test` runs (77 % clean, the old checkpoint on the new held-out drawings, so retraining is needed); the v3 notebook's cells were executed end to end against a copy of the repo with the real datasets attached (`COMP_EPOCHS = 0`, `SLD_EPOCHS = 0`, 6 test sheets). Training itself was not run (it needs the GPU).
