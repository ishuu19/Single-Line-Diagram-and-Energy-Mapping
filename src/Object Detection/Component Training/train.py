import argparse
import json
import sys

import tensorflow as tf

from config import (
    BACKBONES, DEFAULT_HP, EARLY_STOP_PATIENCE, EPOCHS, FREEZE_EPOCHS, LOG_DIR, MODEL_DIR, OUTPUT_DIR, SEED,
    WARMUP_EPOCHS,
)
from data import load_datasets
from model import build_model, compile_model


def setup():
    tf.keras.utils.set_random_seed(SEED)
    if tf.config.list_physical_devices("GPU"):
        tf.keras.mixed_precision.set_global_policy("mixed_float16")
    for d in (MODEL_DIR, OUTPUT_DIR, LOG_DIR):
        d.mkdir(parents=True, exist_ok=True)


def lr_schedule(steps_per_epoch, peak, epochs=EPOCHS):
    warmup = WARMUP_EPOCHS * steps_per_epoch
    return tf.keras.optimizers.schedules.CosineDecay(
        initial_learning_rate=0.0,
        decay_steps=epochs * steps_per_epoch - warmup,
        warmup_target=peak,
        warmup_steps=warmup,
    )


def callbacks(tag):
    return [
        tf.keras.callbacks.EarlyStopping(monitor="val_loss", patience=EARLY_STOP_PATIENCE, restore_best_weights=True),
        tf.keras.callbacks.ModelCheckpoint(str(MODEL_DIR / f"{tag}_best.keras"), monitor="val_accuracy", save_best_only=True),
        tf.keras.callbacks.CSVLogger(str(OUTPUT_DIR / f"{tag}_history.csv"), append=True),
        tf.keras.callbacks.TensorBoard(str(LOG_DIR / tag)),
    ]


def load_hp(path):
    return {**DEFAULT_HP, **json.loads(path.read_text())} if path else DEFAULT_HP


class StepBar(tf.keras.callbacks.Callback):
    """One tqdm bar per epoch over its training steps (redraws in place, unlike Keras's bar when piped)."""

    def on_epoch_begin(self, epoch, logs=None):
        from tqdm.auto import tqdm
        self.bar = tqdm(total=self.params.get("steps"), desc=f"Epoch {epoch + 1}/{self.params['epochs']}", unit="step", dynamic_ncols=True, file=sys.stdout)

    def on_train_batch_end(self, batch, logs=None):
        self.bar.update(1)
        self.bar.set_postfix(loss=f"{logs['loss']:.4f}", acc=f"{logs['accuracy']:.4f}")

    def on_epoch_end(self, epoch, logs=None):
        self.bar.set_postfix({k: f"{v:.4f}" for k, v in logs.items() if k in ("loss", "accuracy", "val_loss", "val_accuracy")})
        self.bar.close()


def fit(model, train_ds, val_ds, weights, epochs, tag):
    return model.fit(train_ds, validation_data=val_ds, epochs=epochs, class_weight=weights, callbacks=callbacks(tag) + [StepBar()], verbose=0)


def train(hp, backbone=None, epochs=EPOCHS):
    train_ds, val_ds, class_names, weights = load_datasets(mixup_alpha=hp["mixup_alpha"])
    steps = int(train_ds.cardinality())
    tag = backbone or "custom"
    model = build_model(len(class_names), hp, backbone)
    histories = []

    if backbone:
        # head-only warmup at the peak LR, then unfreeze everything at a tenth of it
        model.get_layer("backbone").trainable = False
        compile_model(model, hp["learning_rate"], hp)
        histories.append(fit(model, train_ds, val_ds, weights, FREEZE_EPOCHS, tag).history)
        model.get_layer("backbone").trainable = True
        peak, epochs = hp["learning_rate"] / 10, epochs - FREEZE_EPOCHS
    else:
        peak = hp["learning_rate"]

    compile_model(model, lr_schedule(steps, peak, epochs), hp)
    histories.append(fit(model, train_ds, val_ds, weights, epochs, tag).history)

    history = {k: sum((h.get(k, []) for h in histories), []) for k in histories[-1]}
    return model, history, class_names, tag


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--backbone", choices=BACKBONES)
    parser.add_argument("--hp", type=lambda p: OUTPUT_DIR / p, help="json from tune.py, e.g. best_hp.json")
    parser.add_argument("--epochs", type=int, default=EPOCHS)
    args = parser.parse_args()

    setup()
    model, history, class_names, tag = train(load_hp(args.hp), args.backbone, args.epochs)

    model.save(str(MODEL_DIR / f"{tag}.keras"))
    (OUTPUT_DIR / f"{tag}_history.json").write_text(json.dumps(history))
    (MODEL_DIR / "class_names.json").write_text(json.dumps(class_names))


if __name__ == "__main__":
    main()
