# CircuitNet

[aaanthonyyy/CircuitNet](https://github.com/aaanthonyyy/CircuitNet) — hand-drawn schematic sketch recognizer. Three stages: classical image processing to detect components, a CNN to classify them (5 classes: resistor, capacitor, inductor, voltage source, current source), then netlist + SVG generation. See `docs/detection.md` for why we don't reuse its dataset.

## What we borrowed

- The classification-notebook shape: Keras `image_dataset_from_directory`-style loading, a small Conv2D/MaxPooling stack, accuracy/loss curves, a confusion matrix, `sklearn.classification_report`.
- Repo layout: a data-loading module, a model module, a training notebook, `requirements.txt`.

## What we changed

- Detection is already solved for these crops — `component-symbols/manifest.jsonl` and the YOLO labels from `Synthetic Data/_tools/components.mjs` give the exact type and bbox per crop, so we skip CircuitNet's classical-CV detection stage entirely.
- 41 classes (IEEE 315 symbols + `text`) instead of 5 RLC/source classes.
- Labels come from `manifest.jsonl` / YOLO label files, not per-class folders.
- No circuit-generation stage here; that is Stage 3/4 in `plan.md`, not this folder.

Implementation: `src/Object Detection/Component Training/`.
