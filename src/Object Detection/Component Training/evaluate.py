import argparse
import json
from collections import Counter

import numpy as np
import tensorflow as tf
from sklearn.metrics import ConfusionMatrixDisplay, classification_report

from model import RandomHalfTurn  # importing model registers the custom layers for load_model
from config import MODEL_DIR, OUTPUT_DIR, PRINTED_TEST_DATA_DIR, SEED, TEST_DATA_DIR, TTA_PASSES
from data import load_datasets, load_external_test_dataset, load_test_dataset, read_manifest, classifier_classes


def _tta_layers(model):
    # older checkpoints carry RandomHalfTurn inside `geometric`; a blind 180 deg view mislabels orientation-sensitive
    # classes, so TTA uses only the small rotation / zoom / shift / contrast jitter
    return [l for l in model.get_layer("geometric").layers if not isinstance(l, RandomHalfTurn)]


def _augment(layers_, images):
    for layer in layers_:
        images = layer(images, training=True)
    return images


def predict(model, ds, mode="clean"):
    tta, degrade = _tta_layers(model), model.get_layer("degrade")
    labels, probs = [], []
    prob = degrade.prob
    if mode == "degraded":
        degrade.prob = 1.0  # every image damaged: the metric measures robustness, not a half-clean mix
        tf.keras.utils.set_random_seed(SEED)  # same damage on every run, whatever ran before
    try:
        for images, y in ds:
            if mode == "degraded":
                images = degrade(images, training=True)
            if mode == "tta":
                # the model's own augmentation is inert at inference, so feed pre-augmented views through it
                views = [images] + [_augment(tta, images) for _ in range(TTA_PASSES)]
                p = np.mean([tf.nn.softmax(model(v, training=False), -1).numpy() for v in views], axis=0)
            else:
                p = tf.nn.softmax(model(images, training=False), -1).numpy()
            probs.append(p)
            labels.append(np.argmax(y.numpy(), -1))
    finally:
        degrade.prob = prob
    return np.concatenate(labels), np.argmax(np.concatenate(probs), -1)


def load_class_names_for(model_stem):
    """Logit order for a checkpoint: `<stem>.names.json`, else models/class_names.json, else the manifest."""
    for path in (MODEL_DIR / f"{model_stem}.names.json", MODEL_DIR / "class_names.json"):
        if path.is_file():
            if path.name == "class_names.json":
                print(f"warning: no {model_stem}.names.json; using class_names.json (written by the last train.py run)")
            return json.loads(path.read_text())
    print("warning: no saved class names; rebuilding the order from the manifest, which only matches if the crop set is unchanged")
    return classifier_classes(read_manifest())


def most_confused(labels, predictions, class_names, n=10):
    pairs = Counter((class_names[t], class_names[p]) for t, p in zip(labels, predictions) if t != p)
    return pairs.most_common(n)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--model", default="custom", help="tag used by train.py, e.g. custom or efficientnetv2b0")
    parser.add_argument(
        "--split",
        choices=("val", "test", "cghd-test", "printed-test"),
        default="val",
        help="val = crops held out of train for early stopping; test = the manifest test split (reporting only); cghd-test = component-symbols-test (CGHD hand-drawn); "
        "printed-test = component-symbols-test-printed (held-out printed style)",
    )
    parser.add_argument("--out-suffix", default="", help="appended to output names, e.g. _raw for un-normalised test crops")
    args = parser.parse_args()

    tf.keras.utils.set_random_seed(SEED)
    # compile=False: inference only, and skips the stale optimizer state saved with older checkpoints
    model = tf.keras.models.load_model(str(MODEL_DIR / f"{args.model}.keras"), compile=False)
    class_names = load_class_names_for(args.model)
    n_out = model.output_shape[-1]
    assert len(class_names) == n_out, f"{len(class_names)} class names but the model has {n_out} outputs"

    _, val_ds, class_names, _ = load_datasets(class_names=class_names)
    eval_ds = val_ds
    split_tag = "val"
    external = {
        "cghd-test": (TEST_DATA_DIR, "cghd_test", "run build_cghd_test_crops.py from Component Training"),
        "printed-test": (PRINTED_TEST_DATA_DIR, "printed_test", "run node components_test.mjs in Synthetic Data/_tools"),
    }
    if args.split == "test":
        eval_ds, split_tag = load_test_dataset(class_names), "test"
    if args.split in external:
        data_dir, split_tag, hint = external[args.split]
        eval_ds = load_external_test_dataset(class_names, data_dir)
        if eval_ds is None:
            raise SystemExit(f"{data_dir.name} not found; {hint}.")
    split_tag += args.out_suffix

    metrics = {}
    for mode in ("clean", "tta", "degraded"):
        labels, predictions = predict(model, eval_ds, mode)
        metrics[mode] = float(np.mean(labels == predictions))
    print(json.dumps(metrics, indent=2))

    labels, predictions = predict(model, eval_ds, "clean")
    # external test sets cover only some classes: average over classes that occur as truth or prediction
    present = sorted(set(labels.tolist()) | set(predictions.tolist()))
    print(classification_report(
        labels, predictions, labels=present, target_names=[class_names[i] for i in present], zero_division=0
    ))
    all_ids = list(range(len(class_names)))
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
