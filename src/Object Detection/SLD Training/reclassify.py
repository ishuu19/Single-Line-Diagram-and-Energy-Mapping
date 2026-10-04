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
from sld_data import flatten_white

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
    weights = Path(weights)
    net = tf.keras.models.load_model(str(weights), compile=False)
    # the names written with this checkpoint win over the folder-wide list, which a later run may have overwritten
    names_path = weights.with_name(f"{weights.stem}.names.json")
    if not names_path.exists():
        names_path = models_dir / "class_names.json"
    if names_path.exists():
        names = json.loads(names_path.read_text())
    else:
        data = _component_module("data")
        names = data.classifier_classes(data.read_manifest())
    assert len(names) == net.output_shape[-1], (len(names), net.output_shape)
    return net, names


def _crop(gray: np.ndarray, box, size=128):
    """Padded, inverted crop resized to size x size, or None when the box has no pixels on the sheet."""
    import tensorflow as tf
    h, w = gray.shape
    x0, y0, x1, y1 = box
    px, py = (x1 - x0) * CROP_PAD, (y1 - y0) * CROP_PAD
    x0, y0 = max(0, int(x0 - px)), max(0, int(y0 - py))
    x1, y1 = min(w, int(x1 + px) + 1), min(h, int(y1 + py) + 1)
    if x1 <= x0 or y1 <= y0:  # off-sheet or degenerate box: resize_with_pad would raise and lose the whole batch
        return None
    crop = 255.0 - gray[y0:y1, x0:x1].astype(np.float32)          # same inversion as data._load_image
    return tf.image.resize_with_pad(crop[..., None], size, size).numpy()


def reclassify(image, detections, classifier, min_conf=MIN_CONF, batch_size=64):
    """Replace each symbol's `type` with the classifier's label when it is confident. Adds `type_detector`, `type_conf`.

    Edits the dicts IN PLACE (callers pass result["symbols"] and use it afterwards); the same dicts sit in
    result["detections"], so that list shows the new labels too. Deep-copy first to keep the detector's view.
    A box with no pixels on the sheet keeps its detector label."""
    import tensorflow as tf
    net, names = classifier
    gray = np.asarray(flatten_white(image).convert("L"))
    todo = []
    for d in detections:
        crop = None if d["type"] in SKIP_TYPES else _crop(gray, d["bbox"])
        if crop is not None:
            todo.append((d, crop))
    if not todo:
        return detections
    # micro-batches: a dense sheet has hundreds of symbols and one forward pass over all of them can exhaust the GPU
    probs = np.concatenate([
        tf.nn.softmax(net(np.stack([c for _, c in todo[i:i + batch_size]]), training=False), -1).numpy()
        for i in range(0, len(todo), batch_size)
    ])
    todo = [d for d, _ in todo]
    for d, p in zip(todo, probs):
        k = int(p.argmax())
        d["type_detector"] = d["type"]
        d["type_conf"] = float(p[k])
        if p[k] >= min_conf:
            d["type"] = names[k]
    return detections
