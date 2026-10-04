"""
Train the full-sheet YOLO detector (ultralytics) on Data/sld-sheets.

  python train_sld.py                               # config defaults
  python train_sld.py --epochs 5 --model yolov8n.pt # smoke run
  python train_sld.py --data /kaggle/input/.../data.yaml
  python train_sld.py --resume                      # continue runs/<name>/weights/last.pt

Writes runs/<name>/weights/best.pt and copies it to models/sld_<tag>.pt.
"""
from __future__ import annotations

import argparse
import json
import re
import shutil
import sys
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
        try:
            text = msg % args if args and isinstance(msg, str) else msg
        except (TypeError, ValueError):
            return original(msg, *args, **kwargs)
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
            plain = re.sub(r"\x1b\[[0-9;]*m", "", line)
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


def loss_total(tloss):
    """Total training loss: a tensor in older ultralytics, a dict of named losses in newer ones."""
    vals = tloss.values() if isinstance(tloss, dict) else [tloss]
    return sum(float(v.sum() if hasattr(v, "sum") else v) for v in vals)


def progress_callbacks(path):
    """Ultralytics callbacks that append one JSON line per event to `path`, so a notebook can draw live bars for a run in another process."""
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("")
    state = {"i": 0}

    def put(**row):
        with path.open("a") as f:
            f.write(json.dumps(row) + "\n")

    def on_train_start(trainer):
        put(ev="start", epochs=trainer.epochs)

    def on_train_epoch_start(trainer):
        state["i"] = 0
        put(ev="epoch", n=trainer.epoch + 1, batches=len(trainer.train_loader))

    def on_train_batch_end(trainer):
        state["i"] += 1
        if state["i"] % 10 == 0 and trainer.tloss is not None:
            try:
                put(ev="batch", i=state["i"], loss=loss_total(trainer.tloss))
            except Exception:
                pass

    def on_train_epoch_end(trainer):
        put(ev="epoch_end")

    def on_fit_epoch_end(trainer):
        m = trainer.metrics or {}
        put(ev="fit", map50=float(m.get("metrics/mAP50(B)", 0)), map5095=float(m.get("metrics/mAP50-95(B)", 0)))

    def on_train_end(trainer):
        m = trainer.metrics or {}
        put(ev="final", best=str(getattr(trainer, "best", "") or ""), save_dir=str(getattr(trainer, "save_dir", "") or ""),
            map50=float(m.get("metrics/mAP50(B)", 0)), map5095=float(m.get("metrics/mAP50-95(B)", 0)))
        put(ev="end")

    return {"on_train_start": on_train_start, "on_train_epoch_start": on_train_epoch_start, "on_train_batch_end": on_train_batch_end,
            "on_train_epoch_end": on_train_epoch_end, "on_fit_epoch_end": on_fit_epoch_end, "on_train_end": on_train_end}


def resolve_data_yaml(data_yaml: Path, out: Path) -> Path:
    """data.yaml stores `path: .`; write a copy with the absolute dataset folder so ultralytics finds the images anywhere."""
    cfg = yaml.safe_load(Path(data_yaml).read_text())
    Path(out).parent.mkdir(parents=True, exist_ok=True)
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
        losses = trainer.label_loss_items(trainer.tloss) if trainer.tloss is not None else {}
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


def resolve_weights(model):
    """A weights file next to this script (or in models/) is used as is, so an offline machine does not need a download."""
    p = Path(model)
    if p.is_file():
        return str(p)
    for cand in (RUN_DIR / p.name, MODEL_DIR / p.name):
        if cand.is_file():
            return str(cand)
    return str(model)      # ultralytics downloads known names (yolov8s.pt) when online


def load_yolo(model):
    from ultralytics import YOLO

    weights = resolve_weights(model)
    try:
        return YOLO(weights)
    except Exception as e:
        if not Path(weights).is_file():
            print(f"ERROR: detector weights '{model}' are not on disk (looked in cwd, {RUN_DIR}, {MODEL_DIR}) and could not be "
                  f"downloaded ({type(e).__name__}: {e}). Offline: copy {Path(str(model)).name} next to train_sld.py, "
                  f"or pass --model /path/to/weights.pt.", file=sys.stderr, flush=True)
        raise


def train(data_yaml=DATA_YAML, model=MODEL_WEIGHTS, epochs=EPOCHS, imgsz=IMG_SIZE, batch=BATCH, name="sld", project=None,
          translate=0.2, shear=5.0, perspective=0.001, mixup=0.15, copy_paste=0.1,
          degrees=0.0, fliplr=0.0, flipud=0.0, scale=0.5, callbacks=None, report=True, verbose=True, workers=8, progress=None,
          resume=False):
    """callbacks: {ultralytics event: function(trainer)} (a notebook's live bars). report=False drops the per-epoch print.
    No rotation or flips by default: they change what a symbol is (a rotated or mirrored transformer_dy is another drawing,
    and directional symbols change meaning); the LR / RL sheets already cover orientation.
    resume=True continues project/name/weights/last.pt when it exists (ultralytics then reuses that run's own arguments)."""
    quiet_duplicate_logs()
    project = Path(project or RUN_DIR / "runs")
    project.mkdir(parents=True, exist_ok=True)
    last = project / name / "weights" / "last.pt"
    resuming = bool(resume) and last.is_file()
    if resume and not resuming:
        print(f"--resume: no {last}; starting a new run", flush=True)
    net = load_yolo(last if resuming else model)
    if report:
        _epoch_report(net)
    # register every callback separately: ultralytics keeps a list per event, so the caller's and the progress file's both run
    for cbs in (callbacks or {}, progress_callbacks(progress) if progress else {}):
        for event, fn in cbs.items():
            net.add_callback(event, fn)
    if resuming:
        print("resuming", last, flush=True)
        net.train(resume=True)
    else:
        data = resolve_data_yaml(data_yaml, project / "data.yaml")
        net.train(
            data=str(data), epochs=epochs, imgsz=imgsz, batch=batch, project=str(project), name=name, exist_ok=True,
            # geometric augmentation without rotation / flips by default (see docstring), plus colour and mosaic mixes
            fliplr=fliplr, flipud=flipud, degrees=degrees, scale=scale, mosaic=1.0, close_mosaic=10,
            hsv_h=0.015, hsv_s=0.3, hsv_v=0.3,
            translate=translate, shear=shear, perspective=perspective, mixup=mixup, copy_paste=copy_paste,
            plots=True, verbose=verbose, workers=workers, max_det=1000,
        )
    # the trainer knows where it wrote (ultralytics may change project/name, e.g. under runs/detect/)
    trainer = getattr(net, "trainer", None)
    best = Path(getattr(trainer, "best", "") or "")
    if not best.is_file() and getattr(trainer, "save_dir", None):
        best = Path(trainer.save_dir) / "weights" / "best.pt"
    if not best.is_file():
        best = project / name / "weights" / "best.pt"
    if not best.is_file():
        raise FileNotFoundError(f"best.pt not found (trainer.best={getattr(trainer, 'best', None)}, save_dir={getattr(trainer, 'save_dir', None)})")
    MODEL_DIR.mkdir(parents=True, exist_ok=True)
    tag = Path(str(model)).stem
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
    ap.add_argument("--workers", type=int, default=8)
    ap.add_argument("--project", type=Path, default=None)
    ap.add_argument("--progress", type=Path, default=None, help="append JSON progress lines here (for notebook bars)")
    ap.add_argument("--aug", default="{}", help="JSON dict of augmentation overrides")
    ap.add_argument("--resume", action="store_true", help="continue <project>/<name>/weights/last.pt if it exists")
    args = ap.parse_args()
    print(train(args.data, args.model, args.epochs, args.imgsz, args.batch, args.name, project=args.project, workers=args.workers,
                progress=args.progress, resume=args.resume, **json.loads(args.aug)))


if __name__ == "__main__":
    main()
