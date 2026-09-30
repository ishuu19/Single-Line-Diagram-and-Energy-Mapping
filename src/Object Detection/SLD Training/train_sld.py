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


def quiet_duplicate_logs():
    """Ultralytics logs one line per image when identical boxes are dropped. Keep a count instead."""
    from ultralytics.utils import LOGGER

    if getattr(LOGGER, "_sld_quiet", False):
        return
    original = LOGGER.info

    def info(msg, *args, **kwargs):
        text = msg % args if args and isinstance(msg, str) else msg
        if not isinstance(text, str) or "duplicate labels removed" not in text:
            return original(msg, *args, **kwargs)
        images = boxes = 0
        kept = []
        split = "scan"
        for line in text.splitlines():
            if "duplicate labels removed" not in line:
                if line.strip():
                    kept.append(line)
                continue
            images += 1
            plain = "".join(part.split("m", 1)[-1] for part in line.split("\x1b"))
            # "train: /path/img.png: 5 duplicate labels removed"
            split = plain.split(":", 1)[0].strip() or split
            tail = plain.rsplit(":", 1)[-1].strip().split()
            if tail and tail[0].isdigit():
                boxes += int(tail[0])
        original(f"{split}: {images} images, {boxes} duplicate labels removed")
        if kept:
            original("\n".join(kept))

    LOGGER.info = info
    LOGGER._sld_quiet = True


def resolve_data_yaml(data_yaml: Path, out: Path) -> Path:
    """data.yaml stores `path: .`; write a copy with the absolute dataset folder so ultralytics finds the images anywhere."""
    cfg = yaml.safe_load(Path(data_yaml).read_text())
    cfg["path"] = str(Path(data_yaml).resolve().parent)
    out.write_text(yaml.safe_dump(cfg, sort_keys=False))
    return out


def _epoch_report(net):
    """One line per epoch: time, GPU memory, losses and validation scores. The bar itself stays ultralytics' own."""
    state = {}

    def on_train_epoch_end(trainer):
        try:
            import torch
            if torch.cuda.is_available():
                state["gpu"] = torch.cuda.max_memory_allocated() / 1024 ** 3
                state["gpu_total"] = torch.cuda.get_device_properties(0).total_memory / 1024 ** 3
        except Exception:
            state["gpu"] = None

    def on_fit_epoch_end(trainer):
        bits = []
        losses = trainer.label_loss_items(trainer.tloss) if trainer.tloss else {}
        for key, value in {**losses, **(trainer.metrics or {})}.items():
            try:
                bits.append(f"{str(key).split('/')[-1]}={float(value):.4f}")
            except (TypeError, ValueError):
                continue
        gpu = ""
        if state.get("gpu") is not None:
            gpu = f"  gpu={state['gpu']:.2f}/{state['gpu_total']:.1f}GB"
        elapsed = trainer.epoch_time or 0
        print(f"epoch {trainer.epoch + 1}/{trainer.epochs}  time={elapsed:.1f}s{gpu}  " + "  ".join(bits), flush=True)

    net.add_callback("on_train_epoch_end", on_train_epoch_end)
    net.add_callback("on_fit_epoch_end", on_fit_epoch_end)


def train(data_yaml=DATA_YAML, model=MODEL_WEIGHTS, epochs=EPOCHS, imgsz=IMG_SIZE, batch=BATCH, name="sld", project=None,
          translate=0.2, shear=5.0, perspective=0.001, mixup=0.15, copy_paste=0.1,
          degrees=180.0, fliplr=0.5, flipud=0.5, scale=0.5):
    from ultralytics import YOLO

    quiet_duplicate_logs()
    project = Path(project or RUN_DIR / "runs")
    project.mkdir(parents=True, exist_ok=True)
    data = resolve_data_yaml(data_yaml, project / "data.yaml")
    net = YOLO(model)
    _epoch_report(net)
    net.train(
        data=str(data), epochs=epochs, imgsz=imgsz, batch=batch, project=str(project), name=name, exist_ok=True,
        # full geometric augmentation, including rotation, plus colour and mosaic mixes
        fliplr=fliplr, flipud=flipud, degrees=degrees, scale=scale, mosaic=1.0, close_mosaic=10,
        hsv_h=0.015, hsv_s=0.3, hsv_v=0.3,
        translate=translate, shear=shear, perspective=perspective, mixup=mixup, copy_paste=copy_paste,
        plots=True, verbose=True,
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
