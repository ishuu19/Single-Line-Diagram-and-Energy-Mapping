import argparse
import json

import keras_tuner as kt
import tensorflow as tf

from config import BACKBONES, OUTPUT_DIR, SEED, TUNE_FACTOR, TUNE_MAX_EPOCHS
from data import load_arrays, make_dataset
from model import build_model, compile_model
from train import setup


class ComponentHyperModel(kt.HyperModel):
    def __init__(self, num_classes, backbone=None):
        super().__init__()
        self.num_classes, self.backbone = num_classes, backbone

    @staticmethod
    def space(hp):
        return dict(
            learning_rate=hp.Float("learning_rate", 1e-4, 5e-3, sampling="log"),
            weight_decay=hp.Float("weight_decay", 1e-5, 1e-3, sampling="log"),
            dropout=hp.Float("dropout", 0.2, 0.6, step=0.1),
            width=hp.Choice("width", [16, 32, 64]),
            label_smoothing=hp.Choice("label_smoothing", [0.0, 0.05, 0.1]),
            mixup_alpha=hp.Choice("mixup_alpha", [0.0, 0.2, 0.4]),
        )

    def build(self, hp):
        h = self.space(hp)
        return compile_model(build_model(self.num_classes, h, self.backbone), h["learning_rate"], h)

    def fit(self, hp, model, paths, labels, **kwargs):
        # mixup lives in the input pipeline, so the dataset is rebuilt per trial
        ds = make_dataset(paths, labels, self.num_classes, training=True, mixup_alpha=hp.get("mixup_alpha"))
        return model.fit(ds, **kwargs)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--backbone", choices=BACKBONES)
    args = parser.parse_args()

    setup()
    (train_paths, train_labels), (val_paths, val_labels), class_names = load_arrays()
    val_ds = make_dataset(val_paths, val_labels, len(class_names), training=False)
    tag = args.backbone or "custom"

    tuner = kt.Hyperband(
        ComponentHyperModel(len(class_names), args.backbone),
        objective="val_accuracy",
        max_epochs=TUNE_MAX_EPOCHS,
        factor=TUNE_FACTOR,
        seed=SEED,
        directory=str(OUTPUT_DIR / "tuning"),
        project_name=tag,
    )
    tuner.search(
        train_paths, train_labels,
        validation_data=val_ds,
        callbacks=[tf.keras.callbacks.EarlyStopping(monitor="val_loss", patience=5)],
    )

    best = tuner.get_best_hyperparameters(1)[0].values
    (OUTPUT_DIR / f"{tag}_best_hp.json").write_text(json.dumps(best, indent=2))
    tuner.results_summary(num_trials=5)


if __name__ == "__main__":
    main()
