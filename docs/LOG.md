# Log

One line per change. Newest at the bottom. Do not copy transcripts here.

- 2026-09-26 — Repo created on `main` and pushed to github.com/ishuu19/Single-Line-Diagram-and-Energy-Mapping. First commit `10ec011`.
- 2026-09-26 — Detection direction set: public electronics datasets do not cover IEEE 315 SLD classes (breaker, bus, CT, VFD, watthour meter, load). Record in `docs/detection.md`. Graph step should follow AITEE (detect, mask, trace wires), not CircuitNet's blob detector.
- 2026-09-26 — Added `Synthetic Data/_tools/components.mjs` to render isolated Schematex symbols with nameplate text and YOLO boxes (`symbol` + `text`) into `component-symbols/`. Partial output only (`*_00`).
- 2026-09-26 — Added `AGENTS.md`, `docs/STATUS.md`, `docs/MAP.md`, this log, and `.cursorindexingignore` so later sessions do not re-read chats or the bulk corpus.
- 2026-09-26 — Removed the unpushed root commit `10ec011`. `.gitignore` now excludes `Synthetic Data/*/data/`, `Electric Sample Data/data/`, and `component-symbols/`. Those folders stay on disk and are copied to Drive. Drawings and graphs are still meant for git.
- 2026-09-26 — Added private dataset Google Drive folder link to `README.md`.
- 2026-09-26 — Skeleton for `src/Object Detection/Component Training/`: CNN classifier over isolated symbol crops (41 classes, `component-symbols/manifest.jsonl` as labels), structure inspired by CircuitNet (`Inspired/circuitnet.md`). No training run yet — `component-symbols/` only has partial data (`*_00` per class, no val split).
- 2026-09-26 — Component classifier tuned for small line-drawing data: inverted + padded resize, manifest train/val splits, balanced class weights, in-model augmentation (no flips — winding symbols are mirror-sensitive), BN conv blocks + global pooling, AdamW with warmup + cosine decay, early stopping, mixed precision on GPU. TF not installed locally, so only the non-TF parts were smoke-tested. Found `component-symbols/` already holds 8,320 train + 2,080 val crops — STATUS was stale. `text` has no crops, so the classifier uses 40 classes.
- 2026-09-26 — Component classifier extended: KerasTuner Hyperband (`tune.py`), MixUp + label smoothing + EMA, `RandomDegrade` scan-damage layer, optional ImageNet backbones with two-phase fine-tune, and clean/TTA/degraded evaluation. Decided against GANs: crops are free from the generator, and style transfer would need the held-out real sheets. Reasoning in the folder README.
