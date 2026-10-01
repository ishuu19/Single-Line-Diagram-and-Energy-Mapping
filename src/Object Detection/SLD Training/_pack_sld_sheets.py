"""Parallel build of Data/sld-sheets, written to a drive with free space.

Same files as build_sld_dataset.py: images, YOLO labels, graphs, data.yaml.
"""
from __future__ import annotations

import json
import sys
from collections import Counter
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

import build_sld_dataset as b
from config import JUNCTION_CLASS, SYMBOL_ORDER, SYNTHETIC_DIR, TEXT_CLASS

DEST = Path(sys.argv[1]) if len(sys.argv) > 1 else Path(r"C:\Users\User\FYP\sld-sheets")   # e.g. Data/sld-sheets-v2
WORKERS = 8


def keep(pid: str):
    plant = SYNTHETIC_DIR / pid
    if (plant / "graph" / "graph.json").is_file() and (plant / "drawings" / "plant.png").is_file():
        return pid
    return None


def types_of(pid: str):
    g = json.loads((SYNTHETIC_DIR / pid / "graph" / "graph.json").read_text(encoding="utf-8"))
    return {n["type"] for n in g["nodes"]}


def one(pid_classes):
    pid, classes = pid_classes
    counts = Counter()
    split = b.write_sheet(pid, classes, counts)
    return split, counts


def main():
    dest = DEST
    b.SHEETS_DIR = dest
    b.GRAPHS_DIR = dest / "graphs"
    b.DATA_YAML = dest / "data.yaml"

    manifest = json.loads((SYNTHETIC_DIR / "manifest.json").read_text(encoding="utf-8"))
    raw_ids = [p["id"] for p in manifest["plants"]]
    print(f"manifest {len(raw_ids)}", flush=True)
    with ThreadPoolExecutor(WORKERS) as ex:
        ids = [pid for pid in ex.map(keep, raw_ids, chunksize=64) if pid]
    print(f"with png+graph {len(ids)}", flush=True)

    present = set()
    done = 0
    with ThreadPoolExecutor(WORKERS) as ex:
        for ts in ex.map(types_of, ids, chunksize=32):
            present.update(ts)
            done += 1
            if done % 1000 == 0:
                print(f"class scan {done}/{len(ids)}", flush=True)
    unknown = sorted(present - set(SYMBOL_ORDER))
    if unknown:
        raise SystemExit(f"types missing from config.SYMBOL_ORDER: {unknown}")
    classes = [t for t in SYMBOL_ORDER if t in present] + [JUNCTION_CLASS, TEXT_CLASS]
    print(f"{len(classes)} classes", flush=True)

    if dest.exists():
        raise SystemExit(f"refusing to overwrite {dest}")
    for split in ("train", "val", "test"):
        (dest / "images" / split).mkdir(parents=True)
        (dest / "labels" / split).mkdir(parents=True)
    b.GRAPHS_DIR.mkdir(parents=True, exist_ok=True)

    splits, counts = Counter(), Counter()
    done = 0
    with ThreadPoolExecutor(WORKERS) as ex:
        for split, c in ex.map(one, ((pid, classes) for pid in ids), chunksize=8):
            splits[split] += 1
            counts.update(c)
            done += 1
            if done % 500 == 0 or done == len(ids):
                print(f"wrote {done}/{len(ids)} {dict(splits)}", flush=True)

    (dest / "classes.txt").write_text("\n".join(classes) + "\n", encoding="utf-8")
    (dest / "split.json").write_text(json.dumps({pid: b.split_for(pid) for pid in ids}), encoding="utf-8")
    b.DATA_YAML.write_text("\n".join([
        "path: .",
        "train: images/train",
        "val: images/val",
        "test: images/test",
        f"nc: {len(classes)}",
        "names:",
        *[f"  {i}: {c}" for i, c in enumerate(classes)],
        "",
    ]), encoding="utf-8")
    print(f"{len(ids)} sheets -> {dict(splits)}", flush=True)
    print(f"boxes per class: {dict(counts)}", flush=True)
    print(dest, flush=True)


if __name__ == "__main__":
    sys.exit(main())
