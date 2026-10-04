"""Append the GEN-V3-* plants to an existing Data/sld-sheets-v2 (same fixed classes, same split rule).

  python _add_v3_sheets.py <dest>                     # e.g. ../../../Data/sld-sheets-v2
  python _add_v3_sheets.py <dest> --split-by id       # only if <dest> was built with --split-by id
"""
import argparse
import json
from collections import Counter
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

import build_sld_dataset as b
from config import SYNTHETIC_DIR

ap = argparse.ArgumentParser()
ap.add_argument("dest", type=Path)
ap.add_argument("--split-by", choices=b.SPLIT_BY, default="structure")
args = ap.parse_args()
dest = args.dest
b.SHEETS_DIR, b.GRAPHS_DIR, b.DATA_YAML = dest, dest / "graphs", dest / "data.yaml"
if not (dest / "classes.txt").is_file():
    raise SystemExit(f"{dest}/classes.txt not found; build the dataset first (_pack_sld_sheets.py)")
b.check_classes_file(dest)   # exits if dest still uses the old compacted class ids
b.check_split_rule(dest, args.split_by)
manifest = json.loads((SYNTHETIC_DIR / "manifest.json").read_text(encoding="utf-8"))
ids = [p["id"] for p in manifest["plants"] if p["id"].startswith("GEN-V3-")
       and (SYNTHETIC_DIR / p["id"] / "graph" / "graph.json").is_file()
       and (SYNTHETIC_DIR / p["id"] / "drawings" / "plant.png").is_file()]


def one(pid):
    c = Counter()
    return pid, b.write_sheet(pid, c, args.split_by), c


splits, counts, added = Counter(), Counter(), {}
with ThreadPoolExecutor(8) as ex:
    for pid, split, c in ex.map(one, ids):
        added[pid] = split
        splits[split] += 1
        counts.update(c)

b.check_consistency(dest, added)
split_path = dest / "split.json"
table = json.loads(split_path.read_text(encoding="utf-8"))
table.update(added)
split_path.write_text(json.dumps(table), encoding="utf-8")
print(f"{len(ids)} V3 sheets -> {dict(splits)}; v2 now {len(table)} sheets (split by {args.split_by})")
print(f"boxes: {b.report(counts)}")
