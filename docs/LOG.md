# Log

One line per change. Newest at the bottom. Do not copy transcripts here.

- 2026-09-26 — Repo created on `main` and pushed to github.com/ishuu19/Single-Line-Diagram-and-Energy-Mapping. First commit `10ec011`.
- 2026-09-26 — Detection direction set: public electronics datasets do not cover IEEE 315 SLD classes (breaker, bus, CT, VFD, watthour meter, load). Record in `docs/detection.md`. Graph step should follow AITEE (detect, mask, trace wires), not CircuitNet's blob detector.
- 2026-09-26 — Added `Synthetic Data/_tools/components.mjs` to render isolated Schematex symbols with nameplate text and YOLO boxes (`symbol` + `text`) into `component-symbols/`. Partial output only (`*_00`).
- 2026-09-26 — Added `AGENTS.md`, `docs/STATUS.md`, `docs/MAP.md`, this log, and `.cursorindexingignore` so later sessions do not re-read chats or the bulk corpus.
- 2026-09-26 — Removed the unpushed root commit `10ec011`. `.gitignore` now excludes `Synthetic Data/*/data/`, `Electric Sample Data/data/`, and `component-symbols/`. Those folders stay on disk and are copied to Drive. Drawings and graphs are still meant for git.
- 2026-09-26 — Added private dataset Google Drive folder link to `README.md`.
