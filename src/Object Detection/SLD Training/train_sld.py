"""
Train the full-sheet YOLO detector (ultralytics) on Data/sld-sheets.

  python train_sld.py                               # config defaults
  python train_sld.py --epochs 5 --model yolov8n.pt # smoke run
  python train_sld.py --data /kaggle/input/.../data.yaml

Writes runs/<name>/weights/best.pt and copies it to models/sld_<tag>.pt.
"""
from __future__ import annotations

import argparse
import shutil
from pathlib import Path

import yaml

from config import BATCH, DATA_YAML, EPOCHS, IMG_SIZE, MODEL_DIR, MODEL_WEIGHTS, RUN_DIR


def resolve_data_yaml(data_yaml: Path, out: Path) -> Path:
    """data.yaml stores `path: .`; write a copy with the absolute dataset folder so ultralytics finds the images anywhere."""
    cfg = yaml.safe_load(Path(data_yaml).read_text())
    cfg["path"] = str(Path(data_yaml).resolve().parent)
    out.write_text(yaml.safe_dump(cfg, sort_keys=False))
    return out


def train(data_yaml=DATA_YAML, model=MODEL_WEIGHTS, epochs=EPOCHS, imgsz=IMG_SIZE, batch=BATCH, name="sld", project=None):
    from ultralytics import YOLO

    project = Path(project or RUN_DIR / "runs")
    project.mkdir(parents=True, exist_ok=True)
    data = resolve_data_yaml(data_yaml, project / "data.yaml")
    net = YOLO(model)
    net.train(
        data=str(data), epochs=epochs, imgsz=imgsz, batch=batch, project=str(project), name=name, exist_ok=True,
        # sheets are axis-aligned drawings: no flips / rotations, mild scale jitter, mosaic kept for small symbols
        fliplr=0.0, flipud=0.0, degrees=0.0, scale=0.2, mosaic=1.0, close_mosaic=10, hsv_h=0.0, hsv_s=0.0, hsv_v=0.2,
        plots=True, verbose=False,
    )
    best = project / name / "weights" / "best.pt"
    MODEL_DIR.mkdir(parents=True, exist_ok=True)
    tag = Path(model).stem
    dest = MODEL_DIR / f"sld_{tag}.pt"
    shutil.copyfile(best, dest)
    return dest


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--data", type=Path, default=DATA_YAML)
    ap.add_argument("--model", default=MODEL_WEIGHTS)
    ap.add_argument("--epochs", type=int, default=EPOCHS)
    ap.add_argument("--imgsz", type=int, default=IMG_SIZE)
    ap.add_argument("--batch", type=int, default=BATCH)
    ap.add_argument("--name", default="sld")
    args = ap.parse_args()
    print(train(args.data, args.model, args.epochs, args.imgsz, args.batch, args.name))


if __name__ == "__main__":
    main()
