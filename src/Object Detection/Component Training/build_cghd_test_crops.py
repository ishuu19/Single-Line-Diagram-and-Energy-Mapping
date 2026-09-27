"""
Export test-only symbol crops from CGHD (DFKI, CC0) — not Schematex.

Source: https://huggingface.co/datasets/lowercaseonly/cghd
Maps a small subset of CGHD classes onto our SLD vocabulary (see cghd_to_sld.json).

Usage (from repo root or this folder):
  python build_cghd_test_crops.py
  python build_cghd_test_crops.py --max-crops 500 --pad 0.12

Output: component-symbols-test/  (images/test, labels/test, manifest.jsonl)
"""

from __future__ import annotations

import argparse
import json
import xml.etree.ElementTree as ET
from pathlib import Path

import time

from huggingface_hub import hf_hub_download, snapshot_download
from huggingface_hub.errors import HfHubHTTPError
from PIL import Image

REPO_ROOT = Path(__file__).resolve().parents[3]
OUT_DIR = REPO_ROOT / "component-symbols-test"
MAP_PATH = Path(__file__).resolve().parent / "cghd_to_sld.json"
HF_REPO = "lowercaseonly/cghd"

# Same order as Synthetic Data/_tools/components.mjs
SLD_TYPES = [
    "utility", "generator", "solar", "wind", "ups",
    "transformer", "transformer_dy", "transformer_yd", "transformer_yy", "transformer_dd",
    "autotransformer", "transformer_3winding",
    "bus", "bus_tie", "hub",
    "breaker", "breaker_vacuum", "switch", "switch_load", "contactor", "ground_switch",
    "ats", "recloser", "sectionalizer", "fuse", "fuse_cl",
    "ct", "pt", "relay", "surge_arrester", "ground_fault", "rcd",
    "motor", "load", "capacitor_bank", "harmonic_filter", "vfd",
    "watthour_meter", "demand_meter", "consumer_unit",
]
TEXT_CLASS = "text"
CLASSES = SLD_TYPES + [TEXT_CLASS]
CLASS_ID = {name: i for i, name in enumerate(CLASSES)}


def parse_voc_objects(xml_text: str):
    root = ET.fromstring(xml_text)
    filename = root.findtext("filename") or ""
    size = root.find("size")
    w = int(size.findtext("width") or 0) if size is not None else 0
    h = int(size.findtext("height") or 0) if size is not None else 0
    objects = []
    for obj in root.findall("object"):
        name = (obj.findtext("name") or "").strip()
        box = obj.find("bndbox")
        if box is None:
            continue
        xmin = int(float(box.findtext("xmin") or 0))
        ymin = int(float(box.findtext("ymin") or 0))
        xmax = int(float(box.findtext("xmax") or 0))
        ymax = int(float(box.findtext("ymax") or 0))
        objects.append({"name": name, "bbox": (xmin, ymin, xmax, ymax)})
    return filename, w, h, objects


def annotation_to_image_path(ann_path: Path, filename: str) -> Path:
    # .../drafter_-1/annotations/C-10_D1_P1.xml -> .../drafter_-1/images/C-10_D1_P1.jpg
    return ann_path.parent.parent / "images" / filename


def default_hf_cache_root() -> Path | None:
    hub = Path.home() / ".cache/huggingface/hub/datasets--lowercaseonly--cghd/snapshots"
    if not hub.is_dir():
        return None
    snaps = sorted(hub.iterdir(), key=lambda p: p.stat().st_mtime, reverse=True)
    for snap in snaps:
        if collect_annotations(snap):
            return snap
    return None


def resolve_cghd_root(cghd_root: str | None, *, dry_run: bool) -> Path:
    if cghd_root:
        root = Path(cghd_root)
        if not root.is_dir():
            raise SystemExit(f"--cghd-root not found: {root}")
        return root
    cached = default_hf_cache_root()
    if cached is not None:
        print(f"Using Hugging Face cache: {cached}")
        return cached
    patterns = ["drafter_*/annotations/*.xml"]
    if not dry_run:
        patterns.append("drafter_*/images/*")
    print(f"Downloading CGHD from Hugging Face ({', '.join(patterns)})...")
    print("Tip: set HF_TOKEN or use --cghd-root after a Kaggle/manual download to avoid rate limits.")
    cached = snapshot_download(
        HF_REPO,
        repo_type="dataset",
        allow_patterns=patterns,
        max_workers=4,
    )
    return Path(cached)


def hf_fetch(rel_path: str, retries: int = 6) -> Path | None:
    """Fetch one file into the HF cache (with backoff on 429). Returns None if unavailable."""
    rel = rel_path.replace("\\", "/")
    delay = 3.0
    for attempt in range(retries):
        try:
            return Path(hf_hub_download(HF_REPO, rel, repo_type="dataset"))
        except HfHubHTTPError as exc:
            code = exc.response.status_code if exc.response is not None else None
            if code == 429 and attempt < retries - 1:
                print(f"HF rate limit; waiting {delay:.0f}s ({rel})...")
                time.sleep(delay)
                delay = min(delay * 1.8, 120.0)
                continue
            return None
        except Exception:
            return None
    return None


def collect_annotations(root: Path) -> list[Path]:
    return sorted(root.glob("drafter_*/annotations/*.xml"))


def pad_bbox(bbox, width, height, pad_frac):
    xmin, ymin, xmax, ymax = bbox
    bw = max(xmax - xmin, 1)
    bh = max(ymax - ymin, 1)
    px = bw * pad_frac
    py = bh * pad_frac
    xmin = max(0, int(xmin - px))
    ymin = max(0, int(ymin - py))
    xmax = min(width, int(xmax + px))
    ymax = min(height, int(ymax + py))
    return xmin, ymin, xmax, ymax


def yolo_symbol_line(class_name: str, crop_w: int, crop_h: int, inner_bbox):
    """Single symbol box in crop coordinates (normalized)."""
    ix0, iy0, ix1, iy1 = inner_bbox
    cx = (ix0 + ix1) / 2 / crop_w
    cy = (iy0 + iy1) / 2 / crop_h
    bw = (ix1 - ix0) / crop_w
    bh = (iy1 - iy0) / crop_h
    cid = CLASS_ID[class_name]
    return f"{cid} {cx:.6f} {cy:.6f} {bw:.6f} {bh:.6f}"


def main():
    parser = argparse.ArgumentParser(description="Build CGHD test crops under component-symbols-test/")
    parser.add_argument("--max-crops", type=int, default=0, help="Stop after N crops (0 = all)")
    parser.add_argument("--pad", type=float, default=0.15, help="Padding around VOC box as fraction of box size")
    parser.add_argument("--min-size", type=int, default=24, help="Skip crops smaller than this (px)")
    parser.add_argument("--dry-run", action="store_true", help="Count mappable boxes only; do not download images")
    parser.add_argument(
        "--max-sheets",
        type=int,
        default=0,
        help="Only process this many annotation XMLs (0 = all; use for quick smoke tests)",
    )
    parser.add_argument(
        "--cghd-root",
        type=str,
        default="",
        help="Local CGHD tree (drafter_*/annotations). Default: download/cache via Hugging Face.",
    )
    parser.add_argument(
        "--refresh",
        action="store_true",
        help="Delete existing images/test and labels/test before writing",
    )
    parser.add_argument(
        "--local-images-only",
        action="store_true",
        help="Only use images already on disk under --cghd-root / HF cache (no Hub downloads)",
    )
    args = parser.parse_args()

    cghd_to_sld = json.loads(MAP_PATH.read_text())
    cghd_root = resolve_cghd_root(args.cghd_root or None, dry_run=args.dry_run)
    ann_files = collect_annotations(cghd_root)
    if args.max_sheets:
        ann_files = ann_files[: args.max_sheets]
    print(f"CGHD root: {cghd_root}")
    print(f"CGHD annotation files to scan: {len(ann_files)}")

    if not args.dry_run:
        img_out = OUT_DIR / "images" / "test"
        lbl_out = OUT_DIR / "labels" / "test"
        if args.refresh and OUT_DIR.exists():
            for sub in (img_out, lbl_out):
                if sub.is_dir():
                    for p in sub.iterdir():
                        p.unlink()
        img_out.mkdir(parents=True, exist_ok=True)
        lbl_out.mkdir(parents=True, exist_ok=True)

    manifest = []
    image_cache: dict[str, Image.Image] = {}
    crop_idx = 0
    for ann_path in ann_files:
        if args.max_crops and crop_idx >= args.max_crops:
            break
        xml_text = ann_path.read_text(encoding="utf-8")
        filename, _, _, objects = parse_voc_objects(xml_text)
        if not filename:
            continue
        image_path = annotation_to_image_path(ann_path, filename)

        mappable = [o for o in objects if o["name"] in cghd_to_sld]
        if not mappable:
            continue

        if args.dry_run:
            crop_idx += len(mappable)
            continue

        if not image_path.is_file():
            if args.local_images_only:
                continue
            rel_img = str(image_path.relative_to(cghd_root)).replace("\\", "/")
            fetched = hf_fetch(rel_img)
            if fetched is None:
                continue
            image_path = fetched

        cache_key = str(image_path)
        if cache_key not in image_cache:
            image_cache[cache_key] = Image.open(image_path).convert("RGB")
            if len(image_cache) > 32:
                image_cache.pop(next(iter(image_cache)))

        image = image_cache[cache_key]
        iw, ih = image.size

        for obj in mappable:
            if args.max_crops and crop_idx >= args.max_crops:
                break
            sld_type = cghd_to_sld[obj["name"]]
            x0, y0, x1, y1 = pad_bbox(obj["bbox"], iw, ih, args.pad)
            if x1 - x0 < args.min_size or y1 - y0 < args.min_size:
                continue

            crop = image.crop((x0, y0, x1, y1))
            cw, ch = crop.size
            inner = (
                obj["bbox"][0] - x0,
                obj["bbox"][1] - y0,
                obj["bbox"][2] - x0,
                obj["bbox"][3] - y0,
            )
            stem = f"cghd_{crop_idx:05d}"
            png_path = OUT_DIR / "images" / "test" / f"{stem}.png"
            gray = crop.convert("L")
            gray.save(png_path)

            label_line = yolo_symbol_line(sld_type, cw, ch, inner)
            (OUT_DIR / "labels" / "test" / f"{stem}.txt").write_text(label_line + "\n")

            manifest.append(
                {
                    "file": f"images/test/{stem}.png",
                    "split": "test",
                    "type": sld_type,
                    "source": "cghd",
                    "source_class": obj["name"],
                    "source_image": filename,
                    "source_annotation": str(ann_path.relative_to(cghd_root)).replace("\\", "/"),
                    "bbox_voc": obj["bbox"],
                }
            )
            crop_idx += 1

    if args.dry_run:
        print(f"Mappable crops (estimate): {crop_idx}")
        return

    OUT_DIR.mkdir(parents=True, exist_ok=True)
    (OUT_DIR / "classes.txt").write_text("\n".join(CLASSES) + "\n")
    (OUT_DIR / "cghd_to_sld.json").write_text(json.dumps(cghd_to_sld, indent=2) + "\n")
    (OUT_DIR / "data.yaml").write_text(
        "\n".join(
            [
                f"path: {OUT_DIR.as_posix()}",
                "train: images/train",
                "val: images/val",
                "test: images/test",
                f"nc: {len(CLASSES)}",
                "names:",
                *[f"  {i}: {name}" for i, name in enumerate(CLASSES)],
                "",
            ]
        )
    )
    (OUT_DIR / "manifest.jsonl").write_text("\n".join(json.dumps(r) for r in manifest) + ("\n" if manifest else ""))
    (OUT_DIR / "README.md").write_text(
        "\n".join(
            [
                "# component-symbols-test",
                "",
                "Held-out **test** crops from [CGHD](https://huggingface.co/datasets/lowercaseonly/cghd) (CC0).",
                "Not generated by Schematex; use only for evaluation, not training.",
                "",
                f"Regenerate: `python \"src/Object Detection/Component Training/build_cghd_test_crops.py\"`",
                "",
                f"Crops: **{len(manifest)}** under `images/test/`.",
                "",
            ]
        )
    )
    print(f"Wrote {len(manifest)} test crops -> {OUT_DIR}")


if __name__ == "__main__":
    main()
