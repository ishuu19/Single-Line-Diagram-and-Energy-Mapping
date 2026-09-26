# Agents

Final-year project: recover a typed electrical graph from a single-line diagram, then run spatial-temporal analytics on it. Full research design is `plan.md`. Do not open it unless the task is experiment design, metrics, or the thesis write-up.

## Read order

1. `docs/STATUS.md` — what is true right now. Stop here if it answers the task.
2. `docs/MAP.md` — where a file lives. Use it instead of listing the repo.
3. The one doc the map names for this task.

Do not re-read old chats. Decisions already made are in `docs/LOG.md` and `docs/detection.md`.

## Do not scan

- `Synthetic Data/GEN-*` and `Synthetic Data/PLANT-*` (1,508 + 10 plants, telemetry CSVs, PNGs). Open one plant only when the user names its id.
- `component-symbols/images/` and `component-symbols/labels/` (generated crops).
- `Electric Sample Data/data/` (reference CSVs).

Search code under `Synthetic Data/_tools/` and docs. Never grep the corpus.

## When you finish

If project state changed, edit `docs/STATUS.md` in place and append one dated line to `docs/LOG.md`. Keep STATUS under one screen. Do not paste chat transcripts into it.
