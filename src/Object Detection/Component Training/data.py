import json

import numpy as np
import tensorflow as tf
from sklearn.utils.class_weight import compute_class_weight

from config import (
    BATCH_SIZE,
    CLASSES_PATH,
    DATA_DIR,
    IMG_SIZE,
    MANIFEST_PATH,
    SEED,
    TEST_DATA_DIR,
)


def load_class_names():
    return CLASSES_PATH.read_text().splitlines()


def read_manifest(path=MANIFEST_PATH):
    with open(path) as f:
        return [json.loads(line) for line in f if line.strip()]


def classifier_classes(rows):
    # classes.txt is the detector vocabulary; `text` only appears as a box inside crops, never as a crop
    present = {r["type"] for r in rows}
    return [c for c in load_class_names() if c in present]


def split_arrays(rows, split, class_names, data_dir=DATA_DIR):
    class_to_id = {name: i for i, name in enumerate(class_names)}
    rows = [r for r in rows if r["split"] == split and r["type"] in class_to_id]
    paths = np.array([str(data_dir / r["file"]) for r in rows])
    labels = np.array([class_to_id[r["type"]] for r in rows])
    return paths, labels


def load_arrays():
    rows = read_manifest()
    class_names = classifier_classes(rows)
    train = split_arrays(rows, "train", class_names)
    val = split_arrays(rows, "val", class_names)
    return train, val, class_names


def _load_image(path, label):
    image = tf.io.read_file(path)
    image = tf.image.decode_png(image, channels=1)
    # invert so ink is high and any paper tint collapses toward 0; padding then matches the background
    image = 255.0 - tf.cast(image, tf.float32)
    image = tf.image.resize_with_pad(image, *IMG_SIZE)
    return image, label


def _mixup(alpha):
    def apply(images, labels):
        g1 = tf.random.gamma([], alpha)
        g2 = tf.random.gamma([], alpha)
        lam = g1 / (g1 + g2)
        images = lam * images + (1 - lam) * tf.reverse(images, [0])
        labels = lam * labels + (1 - lam) * tf.reverse(labels, [0])
        return images, labels
    return apply


def make_dataset(paths, labels, num_classes, training, mixup_alpha=0.0):
    onehot = tf.one_hot(labels, num_classes)
    ds = tf.data.Dataset.from_tensor_slices((paths, onehot))
    ds = ds.map(_load_image, num_parallel_calls=tf.data.AUTOTUNE).cache()
    if training:
        ds = ds.shuffle(len(paths), seed=SEED, reshuffle_each_iteration=True)
    ds = ds.batch(BATCH_SIZE)
    if training and mixup_alpha > 0:
        ds = ds.map(_mixup(mixup_alpha), num_parallel_calls=tf.data.AUTOTUNE)
    return ds.prefetch(tf.data.AUTOTUNE)


def class_weights(labels):
    present = np.unique(labels)
    weights = compute_class_weight("balanced", classes=present, y=labels)
    return dict(zip(present.tolist(), weights.tolist()))


def load_datasets(mixup_alpha=0.0):
    (train_paths, train_labels), (val_paths, val_labels), class_names = load_arrays()
    n = len(class_names)
    train_ds = make_dataset(train_paths, train_labels, n, training=True, mixup_alpha=mixup_alpha)
    val_ds = make_dataset(val_paths, val_labels, n, training=False)
    return train_ds, val_ds, class_names, class_weights(train_labels)


def rows_from_yolo_labels(data_dir=TEST_DATA_DIR, split="test"):
    """Rebuild manifest rows from YOLO `labels/<split>/*.txt` when no manifest.jsonl was shipped.

    Each crop holds one symbol, so the first class id of each label file is the crop's type.
    Ids index the detector vocabulary in classes.txt (same order as components.mjs)."""
    names = load_class_names()
    rows = []
    for label in sorted((data_dir / "labels" / split).glob("*.txt")):
        first = label.read_text().strip().splitlines()
        if not first:
            continue
        cid = int(first[0].split()[0])
        rows.append({"file": f"images/{split}/{label.stem}.png", "split": split, "type": names[cid]})
    return rows


def read_test_manifest(data_dir=TEST_DATA_DIR):
    manifest = data_dir / "manifest.jsonl"
    if manifest.is_file():
        return read_manifest(manifest)
    return rows_from_yolo_labels(data_dir)


def load_external_test_dataset(class_names, data_dir=TEST_DATA_DIR):
    """External test crops (CGHD by default); labels aligned to the training classifier vocabulary."""
    if not data_dir.is_dir():
        return None
    rows = read_test_manifest(data_dir)
    paths, labels = split_arrays(rows, "test", class_names, data_dir=data_dir)
    if len(paths) == 0:
        return None
    return make_dataset(paths, labels, len(class_names), training=False)
