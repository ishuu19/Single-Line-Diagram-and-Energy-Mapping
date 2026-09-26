# Component Training

CNN classifier for the isolated IEEE 315 symbol crops in `component-symbols/`. Structure is inspired by [CircuitNet](https://github.com/aaanthonyyy/CircuitNet) — see `Inspired/circuitnet.md` for what was borrowed and what was changed.

This is a classification sanity check on single-symbol crops, not the full-sheet detector. Full-sheet detection (finding symbols inside a whole diagram) is tracked separately in `docs/detection.md`.

## Files

| File | Role |
|---|---|
| `config.py` | Paths, image size, schedule, default hyperparameters, augmentation strengths |
| `data.py` | Reads the `train` / `val` splits from `component-symbols/manifest.jsonl`; inverted + padded resize, cached `tf.data`, one-hot labels, MixUp, balanced class weights |
| `model.py` | Geometric augmentation + `RandomDegrade` (scan damage), custom BN-CNN or ImageNet backbone, AdamW + EMA, label smoothing |
| `train.py` | Warmup + cosine LR, early stopping, best checkpoint, CSV + TensorBoard; two-phase fine-tune for backbones |
| `tune.py` | KerasTuner Hyperband over LR, weight decay, dropout, width, label smoothing, MixUp |
| `evaluate.py` | Clean / TTA / degraded accuracy, report, most-confused pairs, confusion matrix |
| `notebooks/component_classification.ipynb` | End-to-end walkthrough |

## Why these choices

The synthetic crops are clean and perfectly balanced (208 train / 52 val per type), so any reasonable CNN will saturate the clean val set. The question that matters for RQ4 is whether the classifier survives real photographed or photocopied sheets. Everything below is aimed at that.

- **Input**: inverted before a padded resize, so ink is bright, paper tint collapses toward 0, aspect ratio is preserved, and padding matches the background.
- **Geometric augmentation**: small rotation, zoom, translation, contrast. No flips — `transformer_dy` vs `transformer_yd` are not mirror-safe. Orientation is already varied in the crops.
- **`RandomDegrade`**: random line thickening/thinning, Gaussian blur, noise, and rectangular occlusion. This is domain randomisation standing in for scan artefacts. It is a saved layer, inert at inference.
- **Regularisation**: MixUp in the pipeline, label smoothing, AdamW weight decay, dropout, EMA weights. Class weights are balanced from the train split (currently all 1.0, kept so uneven future crop runs stay safe).
- **Schedule**: linear warmup then cosine decay; early stopping on `val_loss` with best-weight restore.
- **Backbones**: `--backbone efficientnetv2b0 | mobilenetv3small | convnexttiny` trains a frozen head first, then unfreezes at a tenth of the LR. Compare against the custom CNN on the *degraded* metric, not the clean one.
- **Evaluation**: `clean`, `tta` (averaged softmax over geometric views), and `degraded` (val passed through `RandomDegrade`). Report all three.
- **Classes**: the 40 symbol types that exist as crops. `text` is in `classes.txt` for the detector but only ever appears as a box inside a crop, so it is dropped here.
- **Mixed precision** is enabled automatically on GPU; the logits head stays float32.

### Why no GAN

Two things a GAN could do here, and why neither is worth it now:

1. *More crops* — `Synthetic Data/_tools/components.mjs` already generates unlimited perfectly labelled crops for free. A GAN would only add label noise.
2. *Synthetic → real style transfer* (CycleGAN-style) — needs unpaired real images to learn from, and the only real sheets are the four held-out test drawings in `Electric Sample Data/`. Training on their style leaks the test domain and weakens the RQ4 claim. `RandomDegrade` is the honest substitute. Revisit if extra real drawings that are *not* in the test set are obtained.

## Run

```bash
pip install -r requirements.txt
python tune.py                      # writes outputs/custom_best_hp.json
python train.py --hp custom_best_hp.json
python evaluate.py --model custom
python train.py --backbone efficientnetv2b0 && python evaluate.py --model efficientnetv2b0
tensorboard --logdir logs
```

Outputs per tag: `models/<tag>.keras`, `models/<tag>_best.keras`, `outputs/<tag>_history.{csv,json}`, `outputs/<tag>_metrics.json`, `outputs/<tag>_confusion_matrix.png`. `models/class_names.json` maps logits to names.

Needs `component-symbols/` populated (`node Synthetic\ Data/_tools/components.mjs --per 12`); it is gitignored and lives on Drive. Use `C:\Python313\python.exe` (numpy/sklearn/matplotlib already there); TensorFlow for Python 3.13 needs `tensorflow>=2.20`.
