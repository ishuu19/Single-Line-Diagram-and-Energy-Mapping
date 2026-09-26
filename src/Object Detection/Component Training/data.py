import json

import numpy as np
import tensorflow as tf
from sklearn.utils.class_weight import compute_class_weight

from config import BATCH_SIZE, CLASSES_PATH, DATA_DIR, IMG_SIZE, MANIFEST_PATH, SEED


def load_class_names():
    return CLASSES_PATH.read_text().splitlines()


def read_manifest():
    with open(MANIFEST_PATH) as f:
        return [json.loads(line) for line in f]


def classifier_classes(rows):
    # classes.txt is the detector vocabulary; `text` only appears as a box inside crops, never as a crop
    present = {r["type"] for r in rows}
    return [c for c in load_class_names() if c in present]


def split_arrays(rows, split, class_names):
    class_to_id = {name: i for i, name in enumerate(class_names)}
    rows = [r for r in rows if r["split"] == split]
    paths = np.array([str(DATA_DIR / r["file"]) for r in rows])
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
