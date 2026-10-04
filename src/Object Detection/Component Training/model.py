import tensorflow as tf
from tensorflow.keras import layers, models

from config import BLUR, CONTRAST, DEFAULT_HP, DEGRADE_PROB, ERASE, HALF_TURN, IMG_SIZE, NOISE, ROTATION, TRANSLATION, ZOOM


def _per_sample(x, prob):
    return tf.random.uniform([tf.shape(x)[0], 1, 1, 1]) < prob


@tf.keras.utils.register_keras_serializable(package="component_training")
class RandomDegrade(layers.Layer):
    """Scan-like damage on inverted 0-255 crops: line thickening, blur, noise, occlusion."""

    def __init__(self, noise=NOISE, blur=BLUR, erase=ERASE, prob=DEGRADE_PROB, **kwargs):
        kwargs.setdefault("dtype", "float32")
        super().__init__(**kwargs)
        self.noise, self.blur, self.erase, self.prob = noise, blur, erase, prob

    def call(self, x, training=None):
        if not training:
            return x
        y = tf.where(_per_sample(x, 0.5), tf.nn.max_pool2d(x, 3, 1, "SAME"), x)
        y = self._blur(y)
        std = tf.random.uniform([tf.shape(x)[0], 1, 1, 1], 0.0, self.noise, dtype=y.dtype) * 255.0
        y = y + tf.random.normal(tf.shape(y), dtype=y.dtype) * std
        y = tf.clip_by_value(self._erase(y), 0.0, 255.0)
        # leave part of every batch clean so BatchNorm statistics match the clean validation set
        return tf.where(_per_sample(x, self.prob), y, x)

    def _blur(self, x):
        sigma = tf.random.uniform([], 0.3, self.blur)
        r = tf.range(-2.0, 3.0)
        k1 = tf.exp(-(r ** 2) / (2.0 * sigma ** 2))
        k1 = k1 / tf.reduce_sum(k1)
        kernel = tf.cast(k1[:, None] * k1[None, :], x.dtype)[:, :, None, None]
        blurred = tf.nn.depthwise_conv2d(x, kernel, [1, 1, 1, 1], "SAME")
        return tf.where(_per_sample(x, 0.5), blurred, x)

    def _erase(self, x):
        b, h, w = tf.shape(x)[0], tf.shape(x)[1], tf.shape(x)[2]
        size = tf.random.uniform([b, 2], 0.0, self.erase) * tf.cast([h, w], tf.float32)
        centre = tf.random.uniform([b, 2], 0.0, 1.0) * tf.cast([h, w], tf.float32)
        lo, hi = centre - size / 2, centre + size / 2
        yy = tf.cast(tf.range(h), tf.float32)[None, :, None]
        xx = tf.cast(tf.range(w), tf.float32)[None, None, :]
        mask = (yy >= lo[:, 0:1, None]) & (yy < hi[:, 0:1, None]) & (xx >= lo[:, 1:2, None]) & (xx < hi[:, 1:2, None])
        mask &= (tf.random.uniform([b]) < 0.5)[:, None, None]  # half the batch untouched
        return x * (1.0 - tf.cast(mask, x.dtype))[..., None]

    def get_config(self):
        return {**super().get_config(), "noise": self.noise, "blur": self.blur, "erase": self.erase, "prob": self.prob}


@tf.keras.utils.register_keras_serializable(package="component_training")
class RandomHalfTurn(layers.Layer):
    """Turns a random share of the batch by 180 degrees (training only).

    Not used in new models: a label-blind half-turn corrupts orientation-sensitive classes, so data.py turns only
    config.HALF_TURN_SAFE types. Kept registered so older checkpoints that contain it still load."""

    def __init__(self, prob=HALF_TURN, **kwargs):
        kwargs.setdefault("dtype", "float32")
        super().__init__(**kwargs)
        self.prob = prob

    def call(self, x, training=None):
        if not training:
            return x
        return tf.where(_per_sample(x, self.prob), tf.reverse(x, [1, 2]), x)

    def get_config(self):
        return {**super().get_config(), "prob": self.prob}


def build_geometric():
    fill = dict(fill_mode="constant", fill_value=0.0)  # background is 0 after inversion
    return models.Sequential([
        layers.RandomRotation(ROTATION, **fill),
        layers.RandomZoom(ZOOM, **fill),
        layers.RandomTranslation(TRANSLATION, TRANSLATION, **fill),
        layers.RandomContrast(CONTRAST),
    ], name="geometric")


def conv_block(x, filters):
    for _ in range(2):
        x = layers.Conv2D(filters, 3, padding="same", use_bias=False)(x)
        x = layers.BatchNormalization()(x)
        x = layers.ReLU()(x)
    return layers.MaxPooling2D()(x)


def custom_features(x, width):
    x = layers.Rescaling(1.0 / 255)(x)
    for mult in (1, 2, 4, 8):
        x = conv_block(x, width * mult)
    return layers.GlobalAveragePooling2D()(x)


def backbone_features(x, name, weights="imagenet"):
    x = layers.Concatenate()([x, x, x])  # pretrained nets want RGB; they include their own 0-255 preprocessing
    ctor = {
        "efficientnetv2b0": tf.keras.applications.EfficientNetV2B0,
        "mobilenetv3small": tf.keras.applications.MobileNetV3Small,
        "convnexttiny": tf.keras.applications.ConvNeXtTiny,
    }[name]
    return backbone_ctor(ctor, weights)(x)


def backbone_ctor(ctor, weights="imagenet"):
    # name= at construction: Keras 3 ignores a later _name assignment, and train.py looks the layer up by name
    return ctor(include_top=False, weights=weights, input_shape=(*IMG_SIZE, 3), pooling="avg", name="backbone")


def build_model(num_classes, hp=None, backbone=None, backbone_weights="imagenet"):
    hp = {**DEFAULT_HP, **(hp or {})}
    inputs = layers.Input(shape=(*IMG_SIZE, 1))
    x = build_geometric()(inputs)
    x = RandomDegrade(prob=hp["degrade_prob"], name="degrade")(x)

    x = backbone_features(x, backbone, backbone_weights) if backbone else custom_features(x, hp["width"])

    x = layers.Dropout(hp["dropout"])(x)
    x = layers.Dense(256, activation="relu")(x)
    x = layers.Dropout(hp["dropout"] * 0.75)(x)
    outputs = layers.Dense(num_classes, dtype="float32")(x)  # float32 head keeps logits stable under mixed precision
    return models.Model(inputs, outputs, name=backbone or "custom_cnn")


def compile_model(model, learning_rate, hp=None):
    hp = {**DEFAULT_HP, **(hp or {})}
    model.compile(
        optimizer=tf.keras.optimizers.AdamW(learning_rate=learning_rate, weight_decay=hp["weight_decay"]),
        loss=tf.keras.losses.CategoricalCrossentropy(from_logits=True, label_smoothing=hp["label_smoothing"]),
        metrics=[
            tf.keras.metrics.CategoricalAccuracy(name="accuracy"),
            tf.keras.metrics.TopKCategoricalAccuracy(k=3, name="top3"),
        ],
    )
    return model
