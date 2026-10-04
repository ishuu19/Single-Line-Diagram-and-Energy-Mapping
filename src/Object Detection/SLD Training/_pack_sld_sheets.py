"""Parallel build of Data/sld-sheets, written to a drive with free space.

Same files as build_sld_dataset.py: images, YOLO labels, graphs, data.yaml, split.json, build_info.json.

  python _pack_sld_sheets.py <dest>                   # e.g. ../../../Data/sld-sheets-v2 (must not exist)
  python _pack_sld_sheets.py <dest> --split-by id     # old per-sheet-id hash split
"""
from __future__ import annotations

import argparse
import json
import sys
from collections import Counter
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

import build_sld_dataset as b
from config import SYNTHETIC_DIR

WORKERS = 8


def keep(pid: str):
    plant = SYNTHETIC_DIR / pid
    if (plant / "graph" / "graph.json").is_file() and (plant / "drawings" / "plant.png").is_file():
        return pid
    return None


def types_of(pid: str):
    g = json.loads((SYNTHETIC_DIR / pid / "graph" / "graph.json").read_text(encoding="utf-8"))
    return {n["type"] for n in g["nodes"]}


def one(args):
    pid, split_by = args
    counts = Counter()
    split = b.write_sheet(pid, counts, split_by)
    return pid, split, counts


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("dest", type=Path, help="output folder (must not exist), e.g. Data/sld-sheets-v2")
    ap.add_argument("--split-by", choices=b.SPLIT_BY, default="structure")
    args = ap.parse_args()
    dest = args.dest
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
    b.check_types(present)
    print(f"{len(b.CLASSES)} classes (fixed list)", flush=True)

    if dest.exists():
        raise SystemExit(f"refusing to overwrite {dest}")
    for split in b.SPLITS:
        (dest / "images" / split).mkdir(parents=True)
        (dest / "labels" / split).mkdir(parents=True)
    b.GRAPHS_DIR.mkdir(parents=True, exist_ok=True)

    splits, counts, table = Counter(), Counter(), {}
    done = 0
    with ThreadPoolExecutor(WORKERS) as ex:
        for pid, split, c in ex.map(one, ((pid, args.split_by) for pid in ids), chunksize=8):
            table[pid] = split
            splits[split] += 1
            counts.update(c)
            done += 1
            if done % 500 == 0 or done == len(ids):
                print(f"wrote {done}/{len(ids)} {dict(splits)}", flush=True)

    b.check_consistency(dest, table)
    b.write_meta(dest, table, args.split_by, b.DATA_YAML)
    print(f"{len(ids)} sheets -> {dict(splits)} (split by {args.split_by})", flush=True)
    print(f"boxes per class: {b.report(counts)}", flush=True)
    print(dest, flush=True)


if __name__ == "__main__":
    sys.exit(main())
