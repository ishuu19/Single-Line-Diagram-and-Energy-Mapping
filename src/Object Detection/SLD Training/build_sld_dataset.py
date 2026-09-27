"""
Build the full-sheet YOLO dataset from the synthetic corpus.

  python build_sld_dataset.py                 # all plants in Synthetic Data/manifest.json
  python build_sld_dataset.py --limit 50      # quick smoke run
  python build_sld_dataset.py --refresh       # wipe Data/sld-sheets first

Output: Data/sld-sheets/
  images/{train,val,test}/<id>.png     copy of drawings/plant.png
  labels/{train,val,test}/<id>.txt     YOLO boxes: symbols (bus = drawn bar), junctions, text labels
  graphs/<id>.json                     ground truth with `bbox_draw` added to bus nodes
  data.yaml, classes.txt, split.json

Upload this folder to Kaggle as the dataset for notebooks/kaggle_sld_training.ipynb.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import shutil
from collections import Counter
from pathlib import Path

from config import (
    DATA_YAML, GRAPHS_DIR, JUNCTION_CLASS, SHEETS_DIR, SYMBOL_ORDER, SYNTHETIC_DIR, TEST_FRACTION, TEST_PREFIX,
    TEXT_CLASS, VAL_FRACTION,
)
from sld_data import svg_bus_extents, svg_canvas, to_px, yolo_line


def split_for(sheet_id: str) -> str:
    if sheet_id.startswith(TEST_PREFIX):
        return "test"
    h = int(hashlib.md5(sheet_id.encode()).hexdigest()[:8], 16) / 0xFFFFFFFF
    if h < VAL_FRACTION:
        return "val"
    if h < VAL_FRACTION + TEST_FRACTION:
        return "test"
    return "train"


def plant_ids(limit=0):
    manifest = json.loads((SYNTHETIC_DIR / "manifest.json").read_text(encoding="utf-8"))
    ids = [p["id"] for p in manifest["plants"] if (SYNTHETIC_DIR / p["id"] / "graph" / "graph.json").exists()]
    return ids[:limit] if limit else ids


def collect_classes(ids):
    present = set()
    for pid in ids:
        g = json.loads((SYNTHETIC_DIR / pid / "graph" / "graph.json").read_text(encoding="utf-8"))
        present.update(n["type"] for n in g["nodes"])
    unknown = sorted(present - set(SYMBOL_ORDER))
    if unknown:
        raise SystemExit(f"types missing from config.SYMBOL_ORDER: {unknown}")
    return [t for t in SYMBOL_ORDER if t in present] + [JUNCTION_CLASS, TEXT_CLASS]


def write_sheet(pid, classes, counts):
    plant = SYNTHETIC_DIR / pid
    g = json.loads((plant / "graph" / "graph.json").read_text(encoding="utf-8"))
    s = g["image"]["png_scale"]
    canvas_w, canvas_h = svg_canvas(plant / "drawings" / "plant.svg")
    g["image"]["y_offset"] = canvas_h - g["image"]["height"]   # title band above the layout (12 units)
    g["image"]["png_width"], g["image"]["png_height"] = canvas_w * s, canvas_h * s
    width, height = canvas_w * s, canvas_h * s
    cid = {c: i for i, c in enumerate(classes)}

    bus_boxes = svg_bus_extents(plant / "drawings" / "plant.svg")
    lines = []
    for n in g["nodes"]:
        box = n["bbox"]
        if n["type"] == "bus" and n["dsl_id"] in bus_boxes:
            box = bus_boxes[n["dsl_id"]]
            n["bbox_draw"] = box
        line = yolo_line(cid[n["type"]], to_px(box, g), width, height)
        if line:
            lines.append(line)
            counts[n["type"]] += 1
    for j in g.get("junctions", []):
        line = yolo_line(cid[JUNCTION_CLASS], to_px(j["bbox"], g), width, height)
        if line:
            lines.append(line)
            counts[JUNCTION_CLASS] += 1
    for n in g["nodes"]:
        for t in n.get("text_labels", []):
            line = yolo_line(cid[TEXT_CLASS], to_px(t["bbox"], g), width, height)
            if line:
                lines.append(line)
                counts[TEXT_CLASS] += 1

    split = split_for(pid)
    shutil.copyfile(plant / "drawings" / "plant.png", SHEETS_DIR / "images" / split / f"{pid}.png")
    (SHEETS_DIR / "labels" / split / f"{pid}.txt").write_text("\n".join(lines) + "\n")
    (GRAPHS_DIR / f"{pid}.json").write_text(json.dumps(g), encoding="utf-8")
    return split


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--limit", type=int, default=0)
    ap.add_argument("--refresh", action="store_true")
    args = ap.parse_args()

    if args.refresh and SHEETS_DIR.exists():
        shutil.rmtree(SHEETS_DIR)
    for split in ("train", "val", "test"):
        (SHEETS_DIR / "images" / split).mkdir(parents=True, exist_ok=True)
        (SHEETS_DIR / "labels" / split).mkdir(parents=True, exist_ok=True)
    GRAPHS_DIR.mkdir(parents=True, exist_ok=True)

    ids = plant_ids(args.limit)
    classes = collect_classes(ids)
    counts, splits = Counter(), Counter()
    for pid in ids:
        splits[write_sheet(pid, classes, counts)] += 1

    (SHEETS_DIR / "classes.txt").write_text("\n".join(classes) + "\n")
    (SHEETS_DIR / "split.json").write_text(json.dumps({pid: split_for(pid) for pid in ids}, indent=0))
    DATA_YAML.write_text("\n".join([
        "path: .",  # relative: the notebook rewrites it to the Kaggle mount
        "train: images/train",
        "val: images/val",
        "test: images/test",
        f"nc: {len(classes)}",
        "names:",
        *[f"  {i}: {c}" for i, c in enumerate(classes)],
        "",
    ]))
    print(f"{len(ids)} sheets -> {dict(splits)}")
    print(f"{len(classes)} classes; boxes per class: {dict(counts)}")
    print(SHEETS_DIR)


if __name__ == "__main__":
    main()
