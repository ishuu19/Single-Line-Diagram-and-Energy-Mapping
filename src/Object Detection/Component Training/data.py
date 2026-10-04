import hashlib
import json

import numpy as np
import tensorflow as tf
from sklearn.utils.class_weight import compute_class_weight

from config import (
    BATCH_SIZE,
    CLASSES_PATH,
    DATA_DIR,
    HALF_TURN,
    HALF_TURN_SAFE,
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


VAL_FRACTION = 0.03   # share of `train` crops held out for early stopping when the manifest has no `val` split
# Fields that tie several crops to one source drawing; when present, the carve-out holds out whole groups so
# near-duplicates cannot sit on both sides. `variant` / `font` / `standard` are deliberately NOT used: they are
# shared drawing styles with only 2-4 values per type, so holding one out would drop a style (or a type) from train.
VAL_GROUP_KEYS = ("group", "sheet", "source_image", "source")
MAX_GROUP_SIZE = 50   # a key with bigger average groups is a style/provenance tag, not a duplicate group


def _group_key(rows):
    """First VAL_GROUP_KEYS field that every row carries and that splits the rows into small groups, else None."""
    for key in VAL_GROUP_KEYS:
        if not rows or any(r.get(key) in (None, "") for r in rows):
            continue
        if len({(r["type"], str(r[key])) for r in rows}) * MAX_GROUP_SIZE >= len(rows):
            return key
    return None


def _in_val(row, key=None):
    """Stable hash of the group (else the file), so the carve-out never changes between runs and growing the set only adds crops."""
    ident = f"{row['type']}|{key}={row[key]}" if key else row["file"]
    return int(hashlib.md5(ident.encode()).hexdigest()[:8], 16) / 0xFFFFFFFF < VAL_FRACTION


def train_val_rows(rows):
    """(train rows, validation rows). The manifest `test` split is never used here: it is reported, not tuned on.

    Without a manifest `val` split the carve-out is per file (or per group, see VAL_GROUP_KEYS): val crops share
    generator, styles and fonts with train, so val accuracy is optimistic. Use it for early stopping, not as the
    headline number."""
    if any(r["split"] == "val" for r in rows):
        return [r for r in rows if r["split"] == "train"], [r for r in rows if r["split"] == "val"]
    train = [r for r in rows if r["split"] == "train"]
    key = _group_key(train)
    return [r for r in train if not _in_val(r, key)], [r for r in train if _in_val(r, key)]


def _arrays(rows, class_names, data_dir=DATA_DIR):
    class_to_id = {name: i for i, name in enumerate(class_names)}
    rows = [r for r in rows if r["type"] in class_to_id]
    return np.array([str(data_dir / r["file"]) for r in rows]), np.array([class_to_id[r["type"]] for r in rows])


def load_arrays(class_names=None):
    """class_names forces the label order (e.g. the order a saved model was trained with)."""
    rows = read_manifest()
    if class_names is None:
        class_names = classifier_classes(rows)
    class_names = list(class_names)
    train_rows, val_rows = train_val_rows(rows)
    return _arrays(train_rows, class_names), _arrays(val_rows, class_names), class_names


def load_test_dataset(class_names):
    """The manifest `test` split (same drawing styles as train), for final reporting only."""
    paths, labels = split_arrays(read_manifest(), "test", class_names)
    return make_dataset(paths, labels, len(class_names), training=False)


def _decode_uint8(path, label):
    image = tf.io.read_file(path)
    image = tf.image.decode_png(image, channels=1)
    # invert so ink is high and any paper tint collapses toward 0; padding then matches the background
    image = 255.0 - tf.cast(image, tf.float32)
    image = tf.image.resize_with_pad(image, *IMG_SIZE, antialias=True)
    # uint8 keeps the in-memory cache at a quarter of the float32 size
    return tf.cast(tf.clip_by_value(tf.round(image), 0.0, 255.0), tf.uint8), label


def _to_float(image, label):
    return tf.cast(image, tf.float32), label  # still 0-255: the model rescales itself


def _load_image(path, label):
    """One crop exactly as the pipeline feeds it to the model (inverted, padded, 0-255 float32)."""
    return _to_float(*_decode_uint8(path, label))


def half_turn_ids(class_names):
    return [i for i, name in enumerate(class_names) if name in HALF_TURN_SAFE]


def _half_turn(safe_ids, prob):
    safe = tf.constant(safe_ids, tf.int64)

    def apply(image, label):
        ok = tf.reduce_any(tf.equal(tf.argmax(label, output_type=tf.int64), safe))
        turn = ok & (tf.random.uniform([]) < prob)
        return tf.cond(turn, lambda: tf.reverse(image, [0, 1]), lambda: image), label
    return apply


def _mixup(alpha):
    def apply(images, labels):
        g1 = tf.random.gamma([], alpha)
        g2 = tf.random.gamma([], alpha)
        lam = g1 / (g1 + g2)
        images = lam * images + (1 - lam) * tf.reverse(images, [0])
        labels = lam * labels + (1 - lam) * tf.reverse(labels, [0])
        return images, labels
    return apply


SHUFFLE_BUFFER = 8192


def make_dataset(paths, labels, num_classes, training, mixup_alpha=0.0, half_turn_ids=()):
    """half_turn_ids: label ids that may be turned 180 deg (training only, before batching and MixUp)."""
    onehot = tf.one_hot(labels, num_classes)
    ds = tf.data.Dataset.from_tensor_slices((paths, onehot))
    ds = ds.map(_decode_uint8, num_parallel_calls=tf.data.AUTOTUNE).cache()
    if training:
        ds = ds.shuffle(min(len(paths), SHUFFLE_BUFFER), seed=SEED, reshuffle_each_iteration=True)
    ds = ds.map(_to_float, num_parallel_calls=tf.data.AUTOTUNE)
    if training and len(half_turn_ids) and HALF_TURN > 0:
        ds = ds.map(_half_turn(list(half_turn_ids), HALF_TURN), num_parallel_calls=tf.data.AUTOTUNE)
    ds = ds.batch(BATCH_SIZE)
    if training and mixup_alpha > 0:
        ds = ds.map(_mixup(mixup_alpha), num_parallel_calls=tf.data.AUTOTUNE)
    return ds.prefetch(tf.data.AUTOTUNE)


def class_weights(labels):
    present = np.unique(labels)
    weights = compute_class_weight("balanced", classes=present, y=labels)
    return dict(zip(present.tolist(), weights.tolist()))


def load_datasets(mixup_alpha=0.0, class_names=None):
    (train_paths, train_labels), (val_paths, val_labels), class_names = load_arrays(class_names)
    n = len(class_names)
    train_ds = make_dataset(
        train_paths, train_labels, n, training=True, mixup_alpha=mixup_alpha, half_turn_ids=half_turn_ids(class_names)
    )
    val_ds = make_dataset(val_paths, val_labels, n, training=False)
    return train_ds, val_ds, class_names, class_weights(train_labels)


def rows_from_yolo_labels(data_dir=TEST_DATA_DIR, split="test"):
    """Rebuild manifest rows from YOLO `labels/<split>/*.txt` when no manifest.jsonl was shipped.

    Each crop holds one symbol, so the first class id of each label file is the crop's type.
    Ids index `data_dir/classes.txt` when shipped (its own order), else the training classes.txt."""
    train_names = load_class_names()
    local = data_dir / "classes.txt"
    names = local.read_text().splitlines() if local.is_file() else train_names
    names = [n.strip() for n in names if n.strip()]
    unknown = sorted(set(names) - set(train_names))
    assert not unknown, f"{local} has classes the training vocabulary lacks: {unknown}"
    if names != train_names[: len(names)]:
        print(f"note: {local} orders classes differently from {CLASSES_PATH}; ids are mapped by name")
    rows = []
    for label in sorted((data_dir / "labels" / split).glob("*.txt")):
        first = label.read_text().strip().splitlines()
        if not first:
            continue
        cid = int(first[0].split()[0])
        assert 0 <= cid < len(names), f"{label}: class id {cid} outside {len(names)} classes"
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
