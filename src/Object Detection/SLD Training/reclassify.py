"""
Second opinion on detected symbols from the crop classifier in ../Component Training.

The detector finds boxes on the whole sheet; the classifier (trained on 100k isolated crops,
66 types) re-labels each symbol crop. Types the detector never saw (panel, feeder, ...) can
only come from here.

  from reclassify import load_classifier, reclassify
  clf = load_classifier(REPO / "Data/..." or models/custom_best.keras)
  dets = reclassify(image, dets, clf)
"""
from __future__ import annotations

import importlib
import json
import sys
from pathlib import Path

import numpy as np

from config import JUNCTION_CLASS, REPO_ROOT, TEXT_CLASS

COMPONENT_DIR = REPO_ROOT / "src" / "Object Detection" / "Component Training"
CROP_PAD = 0.15          # fraction of the box added on each side, like the training crops' margin
SKIP_TYPES = {"bus", JUNCTION_CLASS, TEXT_CLASS}   # a bus bar crop looks nothing like the training crops
MIN_CONF = 0.6           # keep the detector's label below this


def _component_module(name):
    """Import a module from Component Training without clobbering this folder's `config` / `data` / `model`."""
    saved = {k: sys.modules.pop(k) for k in ("config", "data", "model") if k in sys.modules}
    sys.path.insert(0, str(COMPONENT_DIR))
    try:
        return importlib.import_module(name)
    finally:
        sys.path.remove(str(COMPONENT_DIR))
        for k in ("config", "data", "model"):
            sys.modules.pop(k, None)
        sys.modules.update(saved)


def load_classifier(weights: Path | None = None):
    """Returns (keras model, class names). Default weights: Component Training/models/<custom_best|custom|notebook_best>.keras."""
    import tensorflow as tf
    _component_module("model")  # registers RandomDegrade for load_model
    models_dir = COMPONENT_DIR / "models"
    if weights is None:
        weights = next(models_dir / f"{t}.keras" for t in ("custom_best", "custom", "notebook_best") if (models_dir / f"{t}.keras").exists())
    net = tf.keras.models.load_model(str(weights), compile=False)
    names_path = models_dir / "class_names.json"
    if names_path.exists():
        names = json.loads(names_path.read_text())
    else:
        data = _component_module("data")
        names = data.classifier_classes(data.read_manifest())
    assert len(names) == net.output_shape[-1], (len(names), net.output_shape)
    return net, names


def _crop(gray: np.ndarray, box, size=128):
    import tensorflow as tf
    h, w = gray.shape
    x0, y0, x1, y1 = box
    px, py = (x1 - x0) * CROP_PAD, (y1 - y0) * CROP_PAD
    x0, y0 = max(0, int(x0 - px)), max(0, int(y0 - py))
    x1, y1 = min(w, int(x1 + px) + 1), min(h, int(y1 + py) + 1)
    crop = 255.0 - gray[y0:y1, x0:x1].astype(np.float32)          # same inversion as data._load_image
    return tf.image.resize_with_pad(crop[..., None], size, size).numpy()


def reclassify(image, detections, classifier, min_conf=MIN_CONF):
    """Replace each symbol's `type` with the classifier's label when it is confident. Adds `type_detector`, `type_conf`."""
    import tensorflow as tf
    net, names = classifier
    gray = np.asarray(image.convert("L"))
    todo = [d for d in detections if d["type"] not in SKIP_TYPES]
    if not todo:
        return detections
    batch = np.stack([_crop(gray, d["bbox"]) for d in todo])
    probs = tf.nn.softmax(net(batch, training=False), -1).numpy()
    for d, p in zip(todo, probs):
        k = int(p.argmax())
        d["type_detector"] = d["type"]
        d["type_conf"] = float(p[k])
        if p[k] >= min_conf:
            d["type"] = names[k]
    return detections
