# Log

One line per change. Newest at the bottom. Do not copy transcripts here.

- 2026-09-26 — Repo created on `main` and pushed to github.com/ishuu19/Single-Line-Diagram-and-Energy-Mapping. First commit `10ec011`.
- 2026-09-26 — Detection direction set: public electronics datasets do not cover IEEE 315 SLD classes (breaker, bus, CT, VFD, watthour meter, load). Record in `docs/detection.md`. Graph step should follow AITEE (detect, mask, trace wires), not CircuitNet's blob detector.
- 2026-09-26 — Added `Synthetic Data/_tools/components.mjs` to render isolated Schematex symbols with nameplate text and YOLO boxes (`symbol` + `text`) into `component-symbols/`. Partial output only (`*_00`).
- 2026-09-26 — Added `AGENTS.md`, `docs/STATUS.md`, `docs/MAP.md`, this log, and `.cursorindexingignore` so later sessions do not re-read chats or the bulk corpus.
- 2026-09-26 — First Colab run of the component classifier: best clean val 96.4% (epoch 59), early-stopped at 80/150 with val swinging 70–96% between epochs. Cause: `RandomDegrade` hit every training image, so clean val was out-of-distribution for BatchNorm. Fixed by per-sample gating (half the batch clean), dropped erosion, EMA removed, `EPOCHS` 150→80 so cosine decay actually completes.
- 2026-09-26 — `tune.py` gained `--mode near` (default): Bayesian search one notch around the 96.4% baseline, `degrade_prob` added to the space, per-trial scores written to `outputs/<tag>_near_trials.json`. Hyperband kept as `--mode wide`.
