import argparse
import json

import keras_tuner as kt
import tensorflow as tf

from config import BACKBONES, DEFAULT_HP, OUTPUT_DIR, SEED, TUNE_FACTOR, TUNE_MAX_EPOCHS, TUNE_TRIALS
from data import load_arrays, make_dataset
from model import build_model, compile_model
from train import setup


def wide_space(hp):
    return dict(
        learning_rate=hp.Float("learning_rate", 1e-4, 5e-3, sampling="log"),
        weight_decay=hp.Float("weight_decay", 1e-5, 1e-3, sampling="log"),
        dropout=hp.Float("dropout", 0.2, 0.6, step=0.1),
        width=hp.Choice("width", [16, 32, 64]),
        label_smoothing=hp.Choice("label_smoothing", [0.0, 0.05, 0.1]),
        mixup_alpha=hp.Choice("mixup_alpha", [0.0, 0.2, 0.4]),
        degrade_prob=hp.Choice("degrade_prob", [0.3, 0.5, 0.7]),
    )


def near_space(hp):
    # one notch either side of DEFAULT_HP; defaults make the baseline reproducible inside the tuner
    d = DEFAULT_HP
    return dict(
        learning_rate=hp.Float("learning_rate", d["learning_rate"] / 2, d["learning_rate"] * 2, sampling="log", default=d["learning_rate"]),
        weight_decay=hp.Float("weight_decay", d["weight_decay"] / 2, d["weight_decay"] * 3, sampling="log", default=d["weight_decay"]),
        dropout=hp.Float("dropout", 0.3, 0.5, step=0.05, default=d["dropout"]),
        width=hp.Choice("width", [32, 48], default=d["width"]),
        label_smoothing=hp.Choice("label_smoothing", [0.05, 0.1, 0.15], default=d["label_smoothing"]),
        mixup_alpha=hp.Choice("mixup_alpha", [0.1, 0.2, 0.3], default=d["mixup_alpha"]),
        degrade_prob=hp.Choice("degrade_prob", [0.3, 0.5, 0.7], default=d["degrade_prob"]),
    )


SPACES = {"wide": wide_space, "near": near_space}


class ComponentHyperModel(kt.HyperModel):
    def __init__(self, num_classes, space, backbone=None):
        super().__init__()
        self.num_classes, self.space, self.backbone = num_classes, space, backbone

    def build(self, hp):
        h = self.space(hp)
        return compile_model(build_model(self.num_classes, h, self.backbone), h["learning_rate"], h)

    def fit(self, hp, model, paths, labels, **kwargs):
        # mixup lives in the input pipeline, so the dataset is rebuilt per trial
        ds = make_dataset(paths, labels, self.num_classes, training=True, mixup_alpha=hp.get("mixup_alpha"))
        return model.fit(ds, **kwargs)


def make_tuner(hypermodel, mode, tag, trials):
    common = dict(objective="val_accuracy", seed=SEED, directory=str(OUTPUT_DIR / "tuning"), project_name=f"{tag}_{mode}")
    if mode == "wide":
        return kt.Hyperband(hypermodel, max_epochs=TUNE_MAX_EPOCHS, factor=TUNE_FACTOR, **common)
    return kt.BayesianOptimization(hypermodel, max_trials=trials, **common)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--mode", choices=SPACES, default="near")
    parser.add_argument("--trials", type=int, default=TUNE_TRIALS, help="near mode only")
    parser.add_argument("--backbone", choices=BACKBONES)
    args = parser.parse_args()

    setup()
    (train_paths, train_labels), (val_paths, val_labels), class_names = load_arrays()
    val_ds = make_dataset(val_paths, val_labels, len(class_names), training=False)
    tag = args.backbone or "custom"

    tuner = make_tuner(ComponentHyperModel(len(class_names), SPACES[args.mode], args.backbone), args.mode, tag, args.trials)
    tuner.search(
        train_paths, train_labels,
        validation_data=val_ds,
        epochs=TUNE_MAX_EPOCHS,
        callbacks=[tf.keras.callbacks.EarlyStopping(monitor="val_accuracy", patience=6, restore_best_weights=True)],
    )

    best = tuner.get_best_hyperparameters(1)[0].values
    (OUTPUT_DIR / f"{tag}_best_hp.json").write_text(json.dumps(best, indent=2))
    trials = [{"score": t.score, **t.hyperparameters.values} for t in tuner.oracle.get_best_trials(args.trials)]
    (OUTPUT_DIR / f"{tag}_{args.mode}_trials.json").write_text(json.dumps(trials, indent=2))
    tuner.results_summary(num_trials=5)


if __name__ == "__main__":
    main()
