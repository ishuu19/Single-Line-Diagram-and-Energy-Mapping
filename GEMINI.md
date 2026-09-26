# FYP — Single-Line Diagram and Energy Mapping

Recover a typed electrical graph from a single-line diagram, then run spatial-temporal analytics on it. Full research design is `plan.md`. Do not open `plan.md` unless the task is experiment design, metrics, or the thesis write-up.

## Read order

1. `docs/STATUS.md` — what is true right now. Stop here if it answers the task.
2. `docs/MAP.md` — where a file lives. Use it instead of listing the repo.
3. The one doc the map names for this task.

Do not re-read old chats. Decisions already made are in `docs/LOG.md` and `docs/detection.md`.

## Do not scan

These paths are huge and are gitignored / Drive-hosted. Never grepping or bulk-reading them:

- `Synthetic Data/GEN-*` and `Synthetic Data/PLANT-*` (1,508 + 10 plants, CSVs, PNGs). Open **one** plant only when the user names its id.
- `component-symbols/images/` and `component-symbols/labels/`
- `Electric Sample Data/data/`

Search code under `Synthetic Data/_tools/` and under `docs/`. Never grep the corpus.

## When you finish

If project state changed, edit `docs/STATUS.md` in place and append one dated line to `docs/LOG.md`. Keep STATUS under one screen. Do not paste chat transcripts into it.

## Token budget

Prefer `docs/STATUS.md` and `docs/MAP.md` over directory listings. Prefer named plant ids over `find` / `ls -R` on `Synthetic Data/`. Prefer editing generator code in `_tools/` over reading plant PNGs.
