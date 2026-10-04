"""
Sheet image -> detections -> wiring graph.

  python predict_graph.py --weights models/sld_yolov8s.pt --split test        # every test sheet -> outputs/pred_test/<id>.json
  python predict_graph.py --weights models/sld_yolov8s.pt --image some.png    # one image -> outputs/some.json
"""
from __future__ import annotations

import argparse
import json
import warnings
from pathlib import Path

import numpy as np
from PIL import Image

from config import CONF, IMG_SIZE, IOU_NMS, OUTPUT_DIR
from sld_data import image_path, load_classes, load_graph, sheet_ids
from wires import to_graph_json, trace


def load_detector(weights):
    from ultralytics import YOLO
    return YOLO(str(weights))


def detect(model, image, classes, conf=CONF, imgsz=IMG_SIZE):
    """Run YOLO on one PIL image -> list of {type, bbox (px), conf}."""
    # class-agnostic NMS: one box per symbol, not one per class that fired on it
    res = model.predict(image, imgsz=imgsz, conf=conf, iou=IOU_NMS, verbose=False, max_det=1000, agnostic_nms=True)[0]
    names = res.names
    out, dropped = [], {}
    for xyxy, c, p in zip(res.boxes.xyxy.cpu().numpy(), res.boxes.cls.cpu().numpy(), res.boxes.conf.cpu().numpy()):
        label = names[int(c)]
        if label in classes:
            out.append({"type": label, "bbox": [float(v) for v in xyxy], "conf": float(p)})
        else:
            dropped[label] = dropped.get(label, 0) + 1
    if dropped:
        warnings.warn(f"{sum(dropped.values())} detections dropped, label not in classes: {dropped}")
    return out


def sheet_image_info(sheet_id):
    """graph.json `image` block (png_scale, y_offset) for a sheet, or None when there is no graph for it."""
    try:
        return load_graph(sheet_id)["image"] if sheet_id else None
    except (OSError, KeyError, ValueError):
        return None


def predict_sheet(model, image, classes, sheet_id="", conf=CONF, image_info=None):
    """image_info: graph.json `image` block for the pixel -> SVG-unit conversion; looked up by sheet_id when omitted."""
    dets = detect(model, image, classes, conf=conf)
    result = trace(image, dets)
    result["detections"] = dets
    if image_info is None:
        image_info = sheet_image_info(sheet_id)
    return result, to_graph_json(result, sheet_id, image_info)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--weights", type=Path, required=True)
    ap.add_argument("--split", default="test")
    ap.add_argument("--image", type=Path, help="single image instead of a split")
    ap.add_argument("--limit", type=int, default=0)
    args = ap.parse_args()

    classes = load_classes()
    model = load_detector(args.weights)
    if args.image:
        _, graph = predict_sheet(model, Image.open(args.image), classes, args.image.stem)
        out = OUTPUT_DIR / f"{args.image.stem}.json"
        out.parent.mkdir(parents=True, exist_ok=True)
        out.write_text(json.dumps(graph, indent=1))
        print(out)
        return
    out_dir = OUTPUT_DIR / f"pred_{args.split}"
    out_dir.mkdir(parents=True, exist_ok=True)
    ids = sheet_ids(args.split)
    if args.limit:
        ids = ids[: args.limit]
    for sid in ids:
        result, graph = predict_sheet(model, Image.open(image_path(sid, args.split)), classes, sid)
        # graph_eval needs the pixel-space result, not the SVG-unit graph
        (out_dir / f"{sid}.json").write_text(json.dumps({
            "symbols": result["symbols"], "edges": [{k: e[k] for k in ("a", "b", "relationship")} for e in result["edges"]],
            "nets": [{"members": n["members"]} for n in result["nets"]], "graph": graph}))
    print(f"{len(ids)} sheets -> {out_dir}")


if __name__ == "__main__":
    main()
