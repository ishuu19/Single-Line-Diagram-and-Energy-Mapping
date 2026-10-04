# Component Training

CNN classifier for the isolated IEEE 315 symbol crops in `component-symbols/`. Structure is inspired by [CircuitNet](https://github.com/aaanthonyyy/CircuitNet) — see `Inspired/circuitnet.md` for what was borrowed and what was changed.

This is a classification sanity check on single-symbol crops, not the full-sheet detector. Full-sheet detection (finding symbols inside a whole diagram) is tracked separately in `docs/detection.md`.

## Files

| File | Role |
|---|---|
| `config.py` | Paths, image size, schedule, default hyperparameters, augmentation strengths |
| `data.py` | Reads `component-symbols/manifest.jsonl`: the `val` split if present, else a stable 3% hash carve-out of `train`. Inverted + padded antialiased resize, uint8 cache, one-hot labels, label-aware 180° turns (`HALF_TURN_SAFE` only), MixUp, balanced class weights |
| `model.py` | Geometric jitter + `RandomDegrade` (scan damage), custom BN-CNN or ImageNet backbone, AdamW, label smoothing |
| `train.py` | Warmup + cosine LR, early stopping and best checkpoint (both on `val_loss`), per-run CSV + TensorBoard; two-phase fine-tune for backbones; `--deterministic` for reproducible kernels |
| `tune.py` | `--mode near` (default): Bayesian search one notch either side of `DEFAULT_HP`. `--mode wide`: Hyperband over the full space. Both include `degrade_prob`. Backbones: LR capped at 1e-3 and frozen for `FREEZE_EPOCHS`, as in `train.py` |
| `evaluate.py` | Clean / TTA / degraded accuracy, report, most-confused pairs, confusion matrix. `--split printed-test` scores the held-out printed crops, `--split cghd-test` the CGHD crops; `--out-suffix _raw` keeps a second set of outputs |
| `normalise_test_crops.py` | Flattens paper, snaps ink to black and pads external crops to a square so they match the Schematex domain. Idempotent: raw crops are copied to `images/test_raw` (refuses if that backup no longer matches `images/test`; `--reset-raw` re-copies) |
| `build_cghd_test_crops.py` | Export held-out **test** crops from [CGHD](https://huggingface.co/datasets/lowercaseonly/cghd) → `component-symbols-test/` (see below) |
| `cghd_to_sld.json` | Maps CGHD class names onto the SLD vocabulary used in training |
| `notebooks/component_classification.ipynb` | End-to-end walkthrough |
| `notebooks/kaggle_component_training.ipynb` | Kaggle runner: clones/pulls the repo, links the attached crop datasets, then calls the scripts above. No logic of its own |
| `notebooks/colab_component_training.ipynb` | Older Colab runner |

### Held-out printed test crops (`component-symbols-test-printed/`)

198 crops (3 per type, 66 types) rendered by `Synthetic Data/_tools/components_test.mjs` with a style regime never used in training: fonts (Tahoma, Georgia, Courier New, Trebuchet, Candara, Corbel), stroke widths 0.6/1.15/2.3, four new paper tints, scales 0.75/1.3/1.45, 180° orientation, zoom 3, fresh seeds. Printed, not hand drawn. Committed to the repo (1 MB) so Kaggle gets it with `git pull`.

```bash
python evaluate.py --model notebook_best --split printed-test
```

`notebook_best` (99.5% clean val) scores **36% clean / 39% TTA / 37% degraded** here. By factor: orientation 0° 59%, 270° 46%, 90° and 180° 21%; scale 1.3 52%, 0.75 28%, 1.45 32%; Courier New 24% vs Trebuchet 48%. Errors are mostly within family (transformer_dy → transformer_dd, switch → sectionalizer, breaker → contactor). The classifier has learned the training regime's typography and geometry, not the symbols; this is the target for the next round of augmentation.

### External test crops (`component-symbols-test/`)

Training uses Schematex crops in `component-symbols/`. For domain-shift checks without touching `Electric Sample Data`, export hand-drawn symbol crops from CGHD (CC0, separate source):

```bash
# Full set (~1k mappable crops). Set HF_TOKEN in the environment if Hub rate-limits you.
python build_cghd_test_crops.py --refresh

# Or point at a local CGHD tree (Kaggle zip / git clone):
python build_cghd_test_crops.py --cghd-root "D:/datasets/cghd" --refresh
```

Outputs: `images/test/`, YOLO `labels/test/`, `classes.txt`, `manifest.jsonl` (`split: test`, `source: cghd`). Every non-dry run deletes `images/test_raw`, since `images/test` then holds fresh raw crops. If a copy arrives without `manifest.jsonl` (e.g. a Kaggle upload), `data.py` rebuilds the rows from `labels/test/*.txt`, mapping ids through the shipped `classes.txt`.

Score raw first, then normalised — the gap between the two is the domain shift the classifier has to survive:

```bash
python evaluate.py --model custom_best --split cghd-test --out-suffix _raw
python normalise_test_crops.py --preview 6
python evaluate.py --model custom_best --split cghd-test
```

The dataset is test-only by design.

## Why these choices

The synthetic crops are clean and balanced (about 1,500 per type; 3% of `train` is held out as val), so any reasonable CNN will saturate the clean val set. That val set is drawn from the same generator, styles and fonts as train, so it is optimistic: use it for early stopping and checkpoint choice, and report the printed / CGHD test sets. The question that matters for RQ4 is whether the classifier survives real photographed or photocopied sheets. Everything below is aimed at that.

- **Input**: inverted before a padded resize, so ink is bright, paper tint collapses toward 0, aspect ratio is preserved, and padding matches the background.
- **Geometric augmentation**: small rotation, zoom, translation, contrast. No flips — `transformer_dy` vs `transformer_yd` are not mirror-safe. Orientation is already varied in the crops (0/90/270). A 180° turn is added in `tf.data` (before MixUp) only for types listed in `config.HALF_TURN_SAFE`; a blind half-turn would swap dy/yd, diode/rectifier direction, battery polarity, NO/NC slants and upside-down letters.
- **`RandomDegrade`**: random line thickening, Gaussian blur, noise, and rectangular occlusion, applied per sample to about half of each batch. This is domain randomisation standing in for scan artefacts. Leaving the rest of the batch clean matters: when every training image was degraded, BatchNorm statistics drifted from the clean val distribution and val accuracy swung 20+ points between epochs. It is a saved layer, inert at inference.
- **Regularisation**: MixUp in the pipeline, label smoothing, AdamW weight decay, dropout. Class weights are balanced from the train split (currently all 1.0, kept so uneven future crop runs stay safe). Train accuracy/loss are reported on MixUp-blended, label-smoothed batches, so they sit well below val; compare val across runs, not train.
- **Schedule**: linear warmup then cosine decay over `EPOCHS`. Keep `EPOCHS` short enough for the decay to finish — the low-LR tail is where val stabilises. Early stopping (patience 30) is a safety net, not the intended exit.
- **Backbones**: `--backbone efficientnetv2b0 | mobilenetv3small | convnexttiny` trains a frozen head first, then unfreezes at a tenth of the LR. Compare against the custom CNN on the *degraded* metric, not the clean one.
- **Evaluation**: `clean`, `tta` (averaged softmax over small rotation/zoom/shift/contrast views; no 180° views), and `degraded` (every image passed through `RandomDegrade`, fixed seed). Report all three. The per-class report averages over classes present in truth or predictions.
- **Classes**: the 66 symbol types that exist as crops: Schematex's 40 plus 26 hand-drawn in `Synthetic Data/_tools/symbols_extra.mjs` (panel, feeder, CT test block, fused voltage block, DC supply, NO/NC contacts, terminal block, chiller, aux load, battery, inverter, rectifier, EV charger, soft starter, reactor, ground, NGR, static switch, pushbutton, pilot light, overload, fused disconnect, coil, compressor, heat exchanger). Each new type has 2–4 drawing variants, several copied from the drawing conventions of the real sheet (`Data/Electric Sample Data/drawings/plant.pdf`: dashed panel boxes, inline test/fuse/terminal blocks, knife contacts, pump/fan motors, diagonal 3~ VFD, boxed kW/kWh meters); common Schematex types also get alternative drawings 35% of the time. `text` is in `classes.txt` for the detector but only ever appears as a box inside a crop, so it is dropped here.
- **Mixed precision** is enabled automatically on GPU; the logits head stays float32.

### Why no GAN

Two things a GAN could do here, and why neither is worth it now:

1. *More crops* — `Synthetic Data/_tools/components.mjs` already generates unlimited perfectly labelled crops for free. A GAN would only add label noise.
2. *Synthetic → real style transfer* (CycleGAN-style) — needs unpaired real images to learn from, and the only real sheets are the four held-out test drawings in `Electric Sample Data/`. Training on their style leaks the test domain and weakens the RQ4 claim. `RandomDegrade` is the honest substitute. Revisit if extra real drawings that are *not* in the test set are obtained.

## Run on Kaggle

Upload `notebooks/kaggle_component_training.ipynb` as a Kaggle notebook, attach the training crops and the CGHD test crops as datasets, turn on GPU + Internet, run top to bottom. It clones (or `git pull`s) this repo into `/kaggle/working` and runs the scripts below; artefacts are copied to `/kaggle/working/component_train_outputs`.

## Run

```bash
pip install -r requirements.txt
python tune.py                      # near search, ~12 trials; writes outputs/custom_best_hp.json + custom_near_trials.json
python train.py --hp custom_best_hp.json
python evaluate.py --model custom
python train.py --backbone efficientnetv2b0 && python evaluate.py --model efficientnetv2b0
tensorboard --logdir logs
```

Tuning runs at a constant LR for up to `TUNE_MAX_EPOCHS`, so trial scores rank configurations; the final `train.py` run with the winning `--hp` (full cosine schedule) is the number to report. A trial only counts as an improvement if it beats the baseline's 96.4% by more than the run-to-run spread — check `<tag>_near_trials.json`, not just the top score.

Outputs per tag: `models/<tag>.keras` and `models/<tag>_best.keras`, each with a `<stem>.names.json` mapping logits to names; `outputs/<tag>_history.{csv,json}` (overwritten each run); `outputs/<model>_<split>_metrics.json` and `outputs/<model>_<split>_confusion_matrix.png` from `evaluate.py`. `models/class_names.json` is the last run's order and only a fallback; `evaluate.py` checks the name count against the model's outputs.

Needs `Data/component-symbols/` populated (`node Synthetic\ Data/_tools/components_all.mjs --per 1516 --test 1000`, one process per type: 66 types, 99,056 train + 1,000 test, ~0.7 GB; `--val N` adds a separate validation split, otherwise `data.py` holds out 3% of `train`; `test` is never used for training decisions); it is gitignored and lives on Drive. Use `C:\Python313\python.exe` (numpy/sklearn/matplotlib already there); TensorFlow for Python 3.13 needs `tensorflow>=2.20`.
