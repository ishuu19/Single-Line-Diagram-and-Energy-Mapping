import argparse
import json
from collections import Counter

import numpy as np
import tensorflow as tf
from sklearn.metrics import ConfusionMatrixDisplay, classification_report

import model as _  # registers RandomDegrade for load_model
from config import MODEL_DIR, OUTPUT_DIR, SEED, TTA_PASSES
from data import load_datasets, load_external_test_dataset


def predict(model, ds, mode="clean"):
    geometric, degrade = model.get_layer("geometric"), model.get_layer("degrade")
    labels, probs = [], []
    for images, y in ds:
        if mode == "degraded":
            images = degrade(images, training=True)
        if mode == "tta":
            # the model's own augmentation is inert at inference, so feed pre-augmented views through it
            views = [images] + [geometric(images, training=True) for _ in range(TTA_PASSES)]
            p = np.mean([tf.nn.softmax(model(v, training=False), -1).numpy() for v in views], axis=0)
        else:
            p = tf.nn.softmax(model(images, training=False), -1).numpy()
        probs.append(p)
        labels.append(np.argmax(y.numpy(), -1))
    return np.concatenate(labels), np.argmax(np.concatenate(probs), -1)


def most_confused(labels, predictions, class_names, n=10):
    pairs = Counter((class_names[t], class_names[p]) for t, p in zip(labels, predictions) if t != p)
    return pairs.most_common(n)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--model", default="custom", help="tag used by train.py, e.g. custom or efficientnetv2b0")
    parser.add_argument(
        "--split",
        choices=("val", "cghd-test"),
        default="val",
        help="val = Schematex val; cghd-test = component-symbols-test (CGHD crops)",
    )
    parser.add_argument("--out-suffix", default="", help="appended to output names, e.g. _raw for un-normalised test crops")
    args = parser.parse_args()

    tf.keras.utils.set_random_seed(SEED)
    _, val_ds, class_names, _ = load_datasets()
    eval_ds = val_ds
    split_tag = "val"
    if args.split == "cghd-test":
        eval_ds = load_external_test_dataset(class_names)
        if eval_ds is None:
            raise SystemExit(
                "component-symbols-test not found. Run build_cghd_test_crops.py from Component Training."
            )
        split_tag = "cghd_test"
    split_tag += args.out_suffix

    # compile=False: inference only, and skips the stale optimizer state saved with older checkpoints
    model = tf.keras.models.load_model(str(MODEL_DIR / f"{args.model}.keras"), compile=False)

    metrics = {}
    for mode in ("clean", "tta", "degraded"):
        labels, predictions = predict(model, eval_ds, mode)
        metrics[mode] = float(np.mean(labels == predictions))
    print(json.dumps(metrics, indent=2))

    labels, predictions = predict(model, eval_ds, "clean")
    all_ids = list(range(len(class_names)))  # external test sets cover only some classes
    print(classification_report(labels, predictions, labels=all_ids, target_names=class_names, zero_division=0))
    for (true, pred), count in most_confused(labels, predictions, class_names):
        print(f"{true} -> {pred}: {count}")

    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    (OUTPUT_DIR / f"{args.model}_{split_tag}_metrics.json").write_text(json.dumps(metrics, indent=2))
    disp = ConfusionMatrixDisplay.from_predictions(
        labels, predictions, labels=all_ids, display_labels=class_names, xticks_rotation=90
    )
    disp.figure_.set_size_inches(12, 12)
    disp.figure_.savefig(OUTPUT_DIR / f"{args.model}_{split_tag}_confusion_matrix.png", bbox_inches="tight")


if __name__ == "__main__":
    main()
