"""Read the sheet dataset (data.yaml, YOLO labels, ground-truth graphs) and convert coordinates."""
import json
import re
import xml.etree.ElementTree as ET
from pathlib import Path

import numpy as np
import yaml

from config import DATA_YAML, GRAPHS_DIR, JUNCTION_CLASS, SHEETS_DIR, TEXT_CLASS


def load_classes(data_yaml=DATA_YAML):
    names = yaml.safe_load(Path(data_yaml).read_text())["names"]
    if isinstance(names, dict):
        names = [names[i] for i in sorted(names)]
    return list(names)


def sheet_ids(split, sheets_dir=SHEETS_DIR):
    return sorted(p.stem for p in (Path(sheets_dir) / "images" / split).glob("*.png"))


def image_path(sheet_id, split, sheets_dir=SHEETS_DIR):
    return Path(sheets_dir) / "images" / split / f"{sheet_id}.png"


def load_graph(sheet_id, graphs_dir=GRAPHS_DIR):
    return json.loads((Path(graphs_dir) / f"{sheet_id}.json").read_text(encoding="utf-8"))


def read_yolo_labels(label_path, width, height, classes):
    """YOLO txt -> list of dicts with pixel boxes."""
    boxes = []
    for line in Path(label_path).read_text().splitlines():
        parts = line.split()
        if len(parts) < 5:
            continue
        cid, cx, cy, w, h = int(parts[0]), *map(float, parts[1:5])
        boxes.append({
            "type": classes[cid],
            "bbox": [(cx - w / 2) * width, (cy - h / 2) * height, (cx + w / 2) * width, (cy + h / 2) * height],
            "conf": 1.0,
        })
    return boxes


def yolo_line(cid, box, width, height):
    x0, y0, x1, y1 = box
    x0, x1 = max(0, x0), min(width, x1)
    y0, y1 = max(0, y0), min(height, y1)
    if x1 - x0 < 1 or y1 - y0 < 1:
        return None
    cx, cy, w, h = (x0 + x1) / 2 / width, (y0 + y1) / 2 / height, (x1 - x0) / width, (y1 - y0) / height
    return f"{cid} {cx:.6f} {cy:.6f} {w:.6f} {h:.6f}"


def to_px(box, graph):
    """SVG-unit box -> PNG pixels. The SVG canvas has a title band above the layout, so y is
    shifted by image.y_offset units (12 on every sheet) before the png_scale (2)."""
    s = graph["image"]["png_scale"]
    dx = graph["image"].get("x_offset", 0.0)
    dy = graph["image"].get("y_offset", 0.0)
    return [(box[0] + dx) * s, (box[1] + dy) * s, (box[2] + dx) * s, (box[3] + dy) * s]


def from_px(v, image_info=None):
    """Inverse of to_px: PNG pixels -> SVG units, for a box [x0, y0, x1, y1] or a point [x, y].
    image_info is graph.json's `image` block (or the whole graph); missing keys default to scale 2, no offset."""
    info = (image_info or {}).get("image", image_info) or {}
    s = info.get("png_scale", 2)
    dx, dy = info.get("x_offset", 0.0), info.get("y_offset", 0.0)
    if len(v) == 2:
        return [v[0] / s - dx, v[1] / s - dy]
    return [v[0] / s - dx, v[1] / s - dy, v[2] / s - dx, v[3] / s - dy]


def flatten_white(image):
    """PIL image -> 'L' or 'RGB' with any transparency composited over white (the sheet background).
    Palette / LA / PA images otherwise turn their transparent pixels black on convert("L"); 16-bit
    greyscale is rescaled to 0-255 instead of clipped."""
    from PIL import Image
    if image.mode in ("L", "RGB"):
        return image
    if image.mode in ("I;16", "I;16B", "I;16L", "I", "F"):
        arr = np.asarray(image, dtype=np.float32)
        if arr.size and arr.max() > 255:
            arr = arr / 257.0
        return Image.fromarray(np.clip(arr, 0, 255).astype(np.uint8), "L")
    rgba = image.convert("RGBA")
    return Image.alpha_composite(Image.new("RGBA", rgba.size, (255, 255, 255, 255)), rgba).convert("RGB")


def svg_canvas(svg_path):
    """(width, height) of the SVG viewBox; graph.json's image.height is the layout height without the title band."""
    head = Path(svg_path).read_text(encoding="utf-8")[:3000]
    vb = re.search(r'viewBox="([\d. ]+)"', head).group(1).split()
    return float(vb[2]), float(vb[3])


def svg_bus_extents(svg_path):
    """dsl_id -> [x0, y0, x1, y1] (SVG units) of each drawn bus bar. graph.json only stores a 40x40 box at the bar centre."""
    text = Path(svg_path).read_text(encoding="utf-8")
    out = {}
    for m in re.finditer(r'<line ([^>]*class="lt-sld-bus"[^>]*)/>', text):
        attrs = dict(re.findall(r'([\w-]+)="([^"]*)"', m.group(1)))
        x1, y1, x2, y2 = (float(attrs[k]) for k in ("x1", "y1", "x2", "y2"))
        half = 1.5  # stroke-width 3
        out[attrs.get("data-id", "")] = [min(x1, x2) - half, min(y1, y2) - half, max(x1, x2) + half, max(y1, y2) + half]
    return out


def gt_detections(graph, classes):
    """Ground-truth boxes in pixels in the detector's format: symbols (bus uses the drawn bar), junctions, text."""
    dets = []
    for n in graph["nodes"]:
        if n["type"] not in classes:
            continue
        box = n.get("bbox_draw", n["bbox"])
        dets.append({"type": n["type"], "bbox": to_px(box, graph), "conf": 1.0, "id": n["id"]})
    for j in graph.get("junctions", []):
        dets.append({"type": JUNCTION_CLASS, "bbox": to_px(j["bbox"], graph), "conf": 1.0})
    for n in graph["nodes"]:
        for t in n.get("text_labels", []):
            dets.append({"type": TEXT_CLASS, "bbox": to_px(t["bbox"], graph), "conf": 1.0, "text": t["text"]})
    for t in graph.get("texts", []):      # title and edge (cable / rating) labels; only in graphs regenerated after 2026-10-04
        dets.append({"type": TEXT_CLASS, "bbox": to_px(t["bbox"], graph), "conf": 1.0, "text": t["text"]})
    return dets


def box_iou(a, b):
    ix0, iy0 = max(a[0], b[0]), max(a[1], b[1])
    ix1, iy1 = min(a[2], b[2]), min(a[3], b[3])
    inter = max(0.0, ix1 - ix0) * max(0.0, iy1 - iy0)
    if inter == 0:
        return 0.0
    ua = (a[2] - a[0]) * (a[3] - a[1]) + (b[2] - b[0]) * (b[3] - b[1]) - inter
    return inter / ua if ua > 0 else 0.0
