import tensorflow as tf
from tensorflow.keras import layers, models

from config import BLUR, CONTRAST, DEFAULT_HP, EMA_MOMENTUM, ERASE, IMG_SIZE, NOISE, ROTATION, TRANSLATION, ZOOM


@tf.keras.saving.register_keras_serializable(package="component_training")
class RandomDegrade(layers.Layer):
    """Scan-like damage on inverted 0-255 crops: line thickness, blur, noise, occlusion."""

    def __init__(self, noise=NOISE, blur=BLUR, erase=ERASE, **kwargs):
        kwargs.setdefault("dtype", "float32")
        super().__init__(**kwargs)
        self.noise, self.blur, self.erase = noise, blur, erase

    def call(self, x, training=None):
        if not training:
            return x
        x = self._thickness(x)
        x = self._blur(x)
        x = x + tf.random.normal(tf.shape(x), dtype=x.dtype) * tf.random.uniform([], 0.0, self.noise) * 255.0
        x = self._erase(x)
        return tf.clip_by_value(x, 0.0, 255.0)

    def _thickness(self, x):
        choice = tf.random.uniform([], 0, 3, tf.int32)
        return tf.switch_case(choice, [
            lambda: x,
            lambda: tf.nn.max_pool2d(x, 3, 1, "SAME"),
            lambda: -tf.nn.max_pool2d(-x, 3, 1, "SAME"),
        ])

    def _blur(self, x):
        sigma = tf.random.uniform([], 0.05, self.blur)
        r = tf.range(-2.0, 3.0)
        k1 = tf.exp(-(r ** 2) / (2.0 * sigma ** 2))
        k1 = k1 / tf.reduce_sum(k1)
        kernel = tf.cast(k1[:, None] * k1[None, :], x.dtype)[:, :, None, None]
        return tf.nn.depthwise_conv2d(x, kernel, [1, 1, 1, 1], "SAME")

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
        return {**super().get_config(), "noise": self.noise, "blur": self.blur, "erase": self.erase}


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


def backbone_features(x, name):
    x = layers.Concatenate()([x, x, x])  # pretrained nets want RGB; they include their own 0-255 preprocessing
    ctor = {
        "efficientnetv2b0": tf.keras.applications.EfficientNetV2B0,
        "mobilenetv3small": tf.keras.applications.MobileNetV3Small,
        "convnexttiny": tf.keras.applications.ConvNeXtTiny,
    }[name]
    backbone = ctor(include_top=False, weights="imagenet", input_shape=(*IMG_SIZE, 3), pooling="avg")
    backbone._name = "backbone"
    return backbone(x)


def build_model(num_classes, hp=None, backbone=None):
    hp = {**DEFAULT_HP, **(hp or {})}
    inputs = layers.Input(shape=(*IMG_SIZE, 1))
    x = build_geometric()(inputs)
    x = RandomDegrade(name="degrade")(x)

    x = backbone_features(x, backbone) if backbone else custom_features(x, hp["width"])

    x = layers.Dropout(hp["dropout"])(x)
    x = layers.Dense(256, activation="relu")(x)
    x = layers.Dropout(hp["dropout"] * 0.75)(x)
    outputs = layers.Dense(num_classes, dtype="float32")(x)  # float32 head keeps logits stable under mixed precision
    return models.Model(inputs, outputs, name=backbone or "custom_cnn")


def compile_model(model, learning_rate, hp=None):
    hp = {**DEFAULT_HP, **(hp or {})}
    model.compile(
        optimizer=tf.keras.optimizers.AdamW(
            learning_rate=learning_rate,
            weight_decay=hp["weight_decay"],
            use_ema=True,
            ema_momentum=EMA_MOMENTUM,
        ),
        loss=tf.keras.losses.CategoricalCrossentropy(from_logits=True, label_smoothing=hp["label_smoothing"]),
        metrics=[
            tf.keras.metrics.CategoricalAccuracy(name="accuracy"),
            tf.keras.metrics.TopKCategoricalAccuracy(k=3, name="top3"),
        ],
    )
    return model
