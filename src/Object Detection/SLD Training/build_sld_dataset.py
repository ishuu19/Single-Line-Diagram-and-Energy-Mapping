"""
Build the full-sheet YOLO dataset from the synthetic corpus.

  python build_sld_dataset.py                 # all plants in Synthetic Data/manifest.json
  python build_sld_dataset.py --limit 50      # quick smoke run
  python build_sld_dataset.py --refresh       # wipe Data/sld-sheets first
  python build_sld_dataset.py --split-by id   # old per-sheet-id hash split (default: structure)

Output: Data/sld-sheets/
  images/{train,val,test}/<id>.png     copy of drawings/plant.png
  labels/{train,val,test}/<id>.txt     YOLO boxes: symbols (bus = drawn bar), junctions, text labels
  graphs/<id>.json                     ground truth with `bbox_draw` added to bus nodes
  data.yaml, classes.txt, split.json, build_info.json

Classes are always config.DETECTOR_CLASSES (SYMBOL_ORDER + junction, text), so ids are fixed.
Splits group sheets by struct_key (node-type multiset + edge kinds); PLANT-* are always test.

Upload this folder to Kaggle as the dataset for notebooks/kaggle_sld_training.ipynb.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import shutil
import warnings
from collections import Counter
from pathlib import Path

from PIL import Image

from config import (
    DATA_YAML, DETECTOR_CLASSES, GRAPHS_DIR, JUNCTION_CLASS, SHEETS_DIR, SYMBOL_ORDER, SYNTHETIC_DIR, TEST_FRACTION,
    TEST_PREFIX, TEXT_CLASS, VAL_FRACTION,
)
from sld_data import svg_bus_extents, to_px, yolo_line

CLASSES = list(DETECTOR_CLASSES)
SPLITS = ("train", "val", "test")
SPLIT_BY = ("structure", "id")
WARN = "!"   # counter keys starting with this are warnings, not classes

_NUM = r"[-+]?(?:\d+\.?\d*|\.\d+)(?:[eE][-+]?\d+)?"
_VIEWBOX = re.compile(rf'viewBox="\s*({_NUM})[\s,]+({_NUM})[\s,]+({_NUM})[\s,]+({_NUM})\s*"')
_FIRST_G = re.compile(r"<g\b[^>]*>")
_LAYOUT_G = re.compile(rf'<g transform="translate\(\s*({_NUM})(?:\s*,\s*|\s+)({_NUM})\s*\)">')


def struct_key(g) -> str:
    """Topology signature of a sheet: sorted node types and sorted (edge relationship, has net)."""
    nodes = sorted(n["type"] for n in g["nodes"])
    edges = sorted([e["relationship"], e.get("net") is not None] for e in g["edges"])
    return hashlib.md5(json.dumps([nodes, edges]).encode()).hexdigest()


def _hash_split(key: str) -> str:
    h = int(hashlib.md5(key.encode()).hexdigest()[:8], 16) / 0xFFFFFFFF
    if h < VAL_FRACTION:
        return "val"
    if h < VAL_FRACTION + TEST_FRACTION:
        return "test"
    return "train"


def load_source_graph(pid):
    return json.loads((SYNTHETIC_DIR / pid / "graph" / "graph.json").read_text(encoding="utf-8"))


def split_for(sheet_id: str, g=None, by: str = "structure") -> str:
    """The one split rule for every builder. `by="structure"` hashes struct_key(g) (loaded if not given)."""
    if sheet_id.startswith(TEST_PREFIX):
        return "test"
    if by == "id":
        return _hash_split(sheet_id)
    if by != "structure":
        raise ValueError(f"split_by must be one of {SPLIT_BY}, got {by!r}")
    return _hash_split(struct_key(g if g is not None else load_source_graph(sheet_id)))


def plant_ids(limit=0):
    manifest = json.loads((SYNTHETIC_DIR / "manifest.json").read_text(encoding="utf-8"))
    ids = [p["id"] for p in manifest["plants"]
           if (SYNTHETIC_DIR / p["id"] / "graph" / "graph.json").is_file()
           and (SYNTHETIC_DIR / p["id"] / "drawings" / "plant.png").is_file()]
    return ids[:limit] if limit else ids


def check_types(types):
    unknown = sorted(set(types) - set(SYMBOL_ORDER))
    if unknown:
        raise SystemExit(f"types missing from config.SYMBOL_ORDER: {unknown}")


def check_classes_file(dest) -> None:
    """Exit with a clear message when dest was built with another class list (e.g. old compacted ids)."""
    path = Path(dest) / "classes.txt"
    if not path.is_file():
        return
    old = path.read_text(encoding="utf-8").split()
    if old == CLASSES:
        return
    if set(old) <= set(CLASSES):
        raise SystemExit(
            f"{dest} uses the old compacted class ids ({len(old)} classes, only types present at build time); "
            f"labels now use the fixed {len(CLASSES)}-class list from config.DETECTOR_CLASSES. "
            f"Rebuild it from scratch (build_sld_dataset.py --refresh, or _pack_sld_sheets.py into a new folder).")
    raise SystemExit(f"{path} lists classes not in config.DETECTOR_CLASSES: {sorted(set(old) - set(CLASSES))}")


def check_split_rule(dest, split_by) -> None:
    path = Path(dest) / "build_info.json"
    if not path.is_file():
        raise SystemExit(f"{dest} has no build_info.json, so its split rule is unknown (built before --split-by). "
                         f"Rebuild it before adding sheets.")
    old = json.loads(path.read_text(encoding="utf-8")).get("split_by")
    if old != split_by:
        raise SystemExit(f"{dest} was split by {old!r}, not {split_by!r}; pass --split-by {old} or rebuild.")


def svg_geometry(svg_path):
    """viewBox (x, y, w, h) and the translate of the outer layout <g> (None if not found).

    Schematex renderSLD and horizontal.mjs renderHorizontal both wrap every layout element in one
    `<g transform="translate(0, titleOffset)">`, the first <g> in the file; graph.json boxes are in its units."""
    text = Path(svg_path).read_text(encoding="utf-8")
    vb = _VIEWBOX.search(text[:4000])
    if not vb:
        raise ValueError(f"{svg_path}: no viewBox")
    first = _FIRST_G.search(text)
    m = _LAYOUT_G.fullmatch(first.group(0)) if first else None
    return tuple(float(v) for v in vb.groups()), ((float(m.group(1)), float(m.group(2))) if m else None)


def png_size(png_path):
    with Image.open(png_path) as im:   # reads the header only
        return im.size


def _place(src, dest):
    """Copy (Path) or write (str) to dest atomically: temp file next to it, then rename."""
    tmp = dest.with_name(dest.name + ".tmp")
    if isinstance(src, Path):
        shutil.copyfile(src, tmp)
    else:
        tmp.write_text(src, encoding="utf-8")
    os.replace(tmp, dest)


def write_sheet(pid, counts, split_by="structure"):
    """Write one sheet into SHEETS_DIR; returns its split. Warnings are counted under keys starting with '!'."""
    plant = SYNTHETIC_DIR / pid
    svg, png = plant / "drawings" / "plant.svg", plant / "drawings" / "plant.png"
    g = load_source_graph(pid)
    check_types(n["type"] for n in g["nodes"])
    im = g["image"]
    s = im["png_scale"]

    (vx, vy, canvas_w, canvas_h), layout_tf = svg_geometry(svg)
    if layout_tf is not None:
        if "y_offset" in im and abs(im["y_offset"] - (layout_tf[1] - vy)) > 0.01:
            counts[WARN + "y_offset_differs_from_graph_json"] += 1
        im["x_offset"], im["y_offset"] = layout_tf[0] - vx, layout_tf[1] - vy
    else:
        warnings.warn(f"{pid}: outer layout <g transform=translate(...)> not found; falling back to "
                      f"{'graph image.y_offset' if 'y_offset' in im else 'canvas height - image.height'}")
        counts[WARN + "no_layout_translate"] += 1
        im["x_offset"] = -vx
        im["y_offset"] = im.get("y_offset", canvas_h - im["height"]) - vy

    width, height = png_size(png)
    if abs(width - canvas_w * s) > 1 or abs(height - canvas_h * s) > 1:
        raise ValueError(f"{pid}: plant.png is {width}x{height}, expected viewBox {canvas_w}x{canvas_h} x {s}")
    im["png_width"], im["png_height"] = width, height

    seen = set()
    junctions = []
    for j in g.get("junctions", []):
        key = tuple(round(v, 2) for v in j["center"])
        if key not in seen:
            seen.add(key)
            junctions.append(j)
    counts[WARN + "duplicate_junctions"] += len(g.get("junctions", [])) - len(junctions)
    g["junctions"] = junctions
    if "counts" in g:
        g["counts"]["junctions"] = len(junctions)

    cid = {c: i for i, c in enumerate(CLASSES)}
    bus_boxes = svg_bus_extents(svg)
    labelled = {}   # YOLO line -> class name; identical lines are written once

    def add(cls, box):
        line = yolo_line(cid[cls], to_px(box, g), width, height)
        if line:
            labelled.setdefault(line, cls)

    for n in g["nodes"]:
        box = n["bbox"]
        if n["type"] == "bus":
            if n["dsl_id"] in bus_boxes:
                box = bus_boxes[n["dsl_id"]]
                n["bbox_draw"] = box
            else:
                counts[WARN + "bus_40x40_fallback"] += 1   # SVG bar for this dsl_id not found
        add(n["type"], box)
    for j in junctions:
        add(JUNCTION_CLASS, j["bbox"])
    for n in g["nodes"]:
        for t in n.get("text_labels", []):
            add(TEXT_CLASS, t["bbox"])
    for t in g.get("texts", []):   # edge cable/rating labels and the sheet title (build.mjs toGraph)
        add(TEXT_CLASS, t["bbox"])
    counts.update(labelled.values())

    split = split_for(pid, g, split_by)
    for other in SPLITS:
        if other != split:
            (SHEETS_DIR / "images" / other / f"{pid}.png").unlink(missing_ok=True)
            (SHEETS_DIR / "labels" / other / f"{pid}.txt").unlink(missing_ok=True)
    _place(png, SHEETS_DIR / "images" / split / f"{pid}.png")
    _place("\n".join(labelled) + "\n", SHEETS_DIR / "labels" / split / f"{pid}.txt")
    (GRAPHS_DIR / f"{pid}.json").write_text(json.dumps(g), encoding="utf-8")
    return split


def check_consistency(dest, table) -> None:
    """Every sheet in `table` (pid -> split) is on disk in its split only."""
    bad = []
    for pid, split in table.items():
        for other in SPLITS:
            present = [(Path(dest) / "images" / other / f"{pid}.png").is_file(),
                       (Path(dest) / "labels" / other / f"{pid}.txt").is_file()]
            if other == split and not all(present):
                bad.append(f"{pid}: missing from {split}")
            if other != split and any(present):
                bad.append(f"{pid}: stale copy in {other} (split.json says {split})")
    if bad:
        raise SystemExit(f"{len(bad)} split.json/disk mismatches, e.g. {bad[:5]}")


def report(counts):
    """Print warnings (counter keys starting with '!') and return the per-class counts."""
    for key in sorted(k for k in counts if k.startswith(WARN)):
        if counts[key]:
            print(f"WARNING {key[1:]}: {counts[key]}")
    return {k: v for k, v in counts.items() if not k.startswith(WARN)}


def write_meta(dest, table, split_by, data_yaml=None) -> None:
    dest = Path(dest)
    (dest / "classes.txt").write_text("\n".join(CLASSES) + "\n", encoding="utf-8")
    (dest / "split.json").write_text(json.dumps(table, indent=0), encoding="utf-8")
    (dest / "build_info.json").write_text(json.dumps({"split_by": split_by, "nc": len(CLASSES)}), encoding="utf-8")
    (Path(data_yaml) if data_yaml else dest / "data.yaml").write_text("\n".join([
        "path: .",  # relative: the notebook rewrites it to the Kaggle mount
        "train: images/train",
        "val: images/val",
        "test: images/test",
        f"nc: {len(CLASSES)}",
        "names:",
        *[f"  {i}: {c}" for i, c in enumerate(CLASSES)],
        "",
    ]), encoding="utf-8")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--limit", type=int, default=0)
    ap.add_argument("--refresh", action="store_true")
    ap.add_argument("--split-by", choices=SPLIT_BY, default="structure")
    args = ap.parse_args()

    if args.refresh and SHEETS_DIR.exists():
        shutil.rmtree(SHEETS_DIR)
    check_classes_file(SHEETS_DIR)
    for split in SPLITS:
        (SHEETS_DIR / "images" / split).mkdir(parents=True, exist_ok=True)
        (SHEETS_DIR / "labels" / split).mkdir(parents=True, exist_ok=True)
    GRAPHS_DIR.mkdir(parents=True, exist_ok=True)

    ids = plant_ids(args.limit)
    counts, table = Counter(), {}
    for pid in ids:
        table[pid] = write_sheet(pid, counts, args.split_by)

    check_consistency(SHEETS_DIR, table)
    write_meta(SHEETS_DIR, table, args.split_by, DATA_YAML)
    print(f"{len(ids)} sheets -> {dict(Counter(table.values()))} (split by {args.split_by})")
    print(f"{len(CLASSES)} classes; boxes per class: {report(counts)}")
    print(SHEETS_DIR)


if __name__ == "__main__":
    main()
