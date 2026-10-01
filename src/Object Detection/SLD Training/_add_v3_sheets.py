"""Append the GEN-V3-* plants to an existing Data/sld-sheets-v2 (same classes, same hash split)."""
import json
import sys
from collections import Counter
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

import build_sld_dataset as b
from config import SYNTHETIC_DIR

dest = Path(sys.argv[1])
b.SHEETS_DIR, b.GRAPHS_DIR, b.DATA_YAML = dest, dest / "graphs", dest / "data.yaml"
classes = (dest / "classes.txt").read_text(encoding="utf-8").split()
manifest = json.loads((SYNTHETIC_DIR / "manifest.json").read_text(encoding="utf-8"))
ids = [p["id"] for p in manifest["plants"] if p["id"].startswith("GEN-V3-")
       and (SYNTHETIC_DIR / p["id"] / "graph" / "graph.json").is_file()]
new_types = set()
for pid in ids:
    g = json.loads((SYNTHETIC_DIR / pid / "graph" / "graph.json").read_text(encoding="utf-8"))
    new_types |= {n["type"] for n in g["nodes"]}
missing = new_types - set(classes)
if missing:
    sys.exit(f"types not in {dest.name}/classes.txt: {sorted(missing)}")
def one(pid):
    c = Counter()
    return b.write_sheet(pid, classes, c), c


splits, counts = Counter(), Counter()
with ThreadPoolExecutor(8) as ex:
    for split, c in ex.map(one, ids):
        splits[split] += 1
        counts.update(c)

split_path = dest / "split.json"
table = json.loads(split_path.read_text(encoding="utf-8"))
table.update({pid: b.split_for(pid) for pid in ids})
split_path.write_text(json.dumps(table), encoding="utf-8")
print(f"{len(ids)} V3 sheets -> {dict(splits)}; v2 now {len(table)} sheets")
print(f"boxes: {dict(counts)}")
