"""Part A helpers: the component classifier on isolated crops."""
from __future__ import annotations

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from PIL import Image, ImageDraw


def load_manifest(crops):
    crops = Path(crops)
    with open(crops / "manifest.jsonl", encoding="utf-8") as fh:
        rows = [json.loads(l) for l in fh if l.strip()]
    man = pd.DataFrame({"file": [r["file"] for r in rows], "type": [r["type"] for r in rows], "split": [r["split"] for r in rows],
                        "v3": ["_v3_" in r["file"] for r in rows], "variant": [r.get("variant", "") for r in rows]})
    return man, (crops / "classes.txt").read_text(encoding="utf-8").split()


def _rgb(path):
    """Open an image, convert to RGB and close the file (galleries open hundreds)."""
    with Image.open(path) as im:
        return im.convert("RGB")


def _label_path(crops, rel):
    """images/<split>/<name>.png -> labels/<split>/<name>.txt (first 'images' folder only)."""
    parts = list(Path(rel).parts)
    if "images" in parts:
        parts[parts.index("images")] = "labels"
    return (Path(crops).joinpath(*parts)).with_suffix(".txt")


def draw(pool, k, rng):
    pool = list(pool)
    return rng.sample(pool, min(k, len(pool)))


# ---------------------------------------------------------------- look at the data
def plot_overview(man):
    by = man.groupby(["type", "v3"]).size().unstack(fill_value=0).rename(columns={False: "earlier", True: "v3"})
    by = by.reindex(columns=["earlier", "v3"], fill_value=0).sort_values("v3", ascending=False)
    ax = by.plot.bar(stacked=True, figsize=(14, 3.2), color=["#9aa5b1", "#d9534f"], width=0.85)
    ax.set_title("crops per type: earlier batches vs v3")
    ax.set_xlabel("")
    plt.tight_layout()
    plt.show()
    plt.close(ax.figure)


def crop_with_boxes(crops, rel, class_names):
    img = _rgb(Path(crops) / rel)
    w, h = img.size
    d = ImageDraw.Draw(img)
    lab = _label_path(crops, rel)
    if lab.exists():
        for line in lab.read_text(encoding="utf-8").splitlines():
            if not line.strip():
                continue
            c, cx, cy, bw, bh = line.split()[:5]
            col = "#e08a00" if class_names[int(c)] == "text" else "#1f6feb"
            d.rectangle([(float(cx) - float(bw) / 2) * w, (float(cy) - float(bh) / 2) * h,
                         (float(cx) + float(bw) / 2) * w, (float(cy) + float(bh) / 2) * h], outline=col, width=2)
    return img


def plot_same_type(man, crops, class_names, rng, types=("breaker", "transformer", "motor", "vfd", "ats", "ground", "ups", "utility"), cols=12):
    """One row per type: earlier crops on the left, v3 on the right (symbol box blue, text boxes orange)."""
    fig, axes = plt.subplots(len(types), cols, figsize=(18, len(types) * 1.6), squeeze=False)
    for a in axes.ravel():
        a.axis("off")
    for r, t in enumerate(types):
        old = man[(man.type == t) & ~man.v3 & (man.split == "train")].index
        new = man[(man.type == t) & man.v3].index
        n_new = min(8, len(new))
        for c, i in enumerate(draw(old, cols - n_new, rng) + draw(new, n_new, rng)):
            axes[r, c].imshow(crop_with_boxes(crops, man.file[i], class_names))
            if c == 0:
                axes[r, c].set_title(t, fontsize=8, loc="left")
    fig.suptitle("earlier crops (left) vs v3 crops (right)" if man.v3.any() else "crops (this dataset has no v3 files)")
    plt.tight_layout()
    plt.show()
    plt.close(fig)


# ---------------------------------------------------------------- augmentation, one effect per column
def plot_aug_steps(crops, man, rng, ccfg, cdata, cmodel, n=3):
    import tensorflow as tf
    from tensorflow.keras import layers
    fill = dict(fill_mode="constant", fill_value=0.0)
    degrade_all = cmodel.RandomDegrade(prob=1.0)
    seed = lambda: rng.randint(0, 2 ** 31 - 1)      # layers seeded from rng: the figure repeats for the same notebook seed

    def gauss(x, sigma=1.2):
        r = tf.range(-2.0, 3.0)
        k = tf.exp(-(r ** 2) / (2.0 * sigma ** 2))
        k = k / tf.reduce_sum(k)
        return tf.nn.depthwise_conv2d(x, (k[:, None] * k[None, :])[:, :, None, None], [1, 1, 1, 1], "SAME")

    def erase(x, frac=0.28):
        y = np.array(x)
        h, w = y.shape[1:3]
        rh, rw = int(h * frac / 2), int(w * frac / 2)
        cy, cx = rng.randint(rh, max(rh, h - rh)), rng.randint(rw, max(rw, w - rw))      # the whole patch stays inside the image
        y[:, cy - rh:cy + rh, cx - rw:cx + rw] = 0
        return y

    steps = [
        ("original", lambda x: x),
        ("rotate", lambda x: layers.RandomRotation(ccfg.ROTATION, seed=seed(), **fill)(x, training=True)),
        ("zoom", lambda x: layers.RandomZoom(ccfg.ZOOM, seed=seed(), **fill)(x, training=True)),
        ("shift", lambda x: layers.RandomTranslation(ccfg.TRANSLATION, ccfg.TRANSLATION, seed=seed(), **fill)(x, training=True)),
        ("contrast", lambda x: layers.RandomContrast(ccfg.CONTRAST, seed=seed())(x, training=True)),
        ("thicker lines", lambda x: tf.nn.max_pool2d(x, 3, 1, "SAME")),
        ("blur", gauss),
        ("noise", lambda x: x + tf.random.normal(tf.shape(x), seed=seed()) * 0.05 * 255.0),
        ("blank patch", erase),
        ("whole pipeline", lambda x: degrade_all(cmodel.build_geometric()(x, training=True), training=True)),
    ]
    files = [man.file[i] for i in draw(man[man.split == "train"].index, n, rng)]
    fig, axes = plt.subplots(len(files), len(steps), figsize=(len(steps) * 1.7, len(files) * 1.8), squeeze=False)
    for r, rel in enumerate(files):
        x = cdata._load_image(str(Path(crops) / rel), 0)[0][None]
        for c, (name, fn) in enumerate(steps):
            axes[r, c].imshow(255 - np.clip(np.asarray(fn(x))[0, ..., 0], 0, 255), cmap="gray", vmin=0, vmax=255)
            axes[r, c].axis("off")
            if r == 0:
                axes[r, c].set_title(name, fontsize=8)
    plt.tight_layout()
    plt.show()
    plt.close(fig)
    return len(steps)


# ---------------------------------------------------------------- training: live bars, no other output
def live_bar():
    """Keras callback: outer bar = epochs (with accuracy), inner bar = steps of the current epoch."""
    import tensorflow as tf
    from tqdm.auto import tqdm

    class LiveBar(tf.keras.callbacks.Callback):
        def on_train_begin(self, logs=None):
            self.outer = tqdm(total=self.params.get("epochs"), desc="epochs", unit="ep")

        def on_epoch_begin(self, epoch, logs=None):
            self.inner = tqdm(total=self.params.get("steps"), desc=f"epoch {epoch + 1}", unit="it", leave=False)

        def on_train_batch_end(self, batch, logs=None):
            self.inner.update(1)
            if batch % 25 == 0 and logs:
                self.inner.set_postfix(loss=f"{logs.get('loss', float('nan')):.3f}", acc=f"{logs.get('accuracy', float('nan')):.3f}")

        def on_epoch_end(self, epoch, logs=None):
            self.inner.close()
            self.outer.update(1)
            logs = logs or {}
            nan = float("nan")
            self.outer.set_postfix(acc=f"{logs.get('accuracy', nan):.3f}", val_acc=f"{logs.get('val_accuracy', nan):.3f}",
                                   val_loss=f"{logs.get('val_loss', nan):.3f}")

        def on_train_end(self, logs=None):
            self.outer.close()

    return LiveBar()


def plot_curves(h):
    """Loss, accuracy, train-validation gap, and a one-line verdict. Returns the verdict (None for an empty history)."""
    if h is None or len(h) == 0 or "val_loss" not in h:
        print("no training history to plot")
        return None
    h = h.copy()
    h.index = pd.RangeIndex(1, len(h) + 1, name="epoch")      # epochs counted from 1, as Keras prints them
    fig, ax = plt.subplots(1, 4, figsize=(19, 3.4))
    h[["loss", "val_loss"]].plot(ax=ax[0], title="loss")
    h[["accuracy", "val_accuracy"]].plot(ax=ax[1], title="accuracy")
    (h["accuracy"] - h["val_accuracy"]).plot(ax=ax[2], title="train - validation accuracy (gap)", color="tab:red")
    ax[2].axhline(0, color="k", lw=0.5)
    (h["val_loss"] - h["val_loss"].min()).plot(ax=ax[3], title="val loss above its best", color="tab:purple")
    for a in ax:
        a.set_xlabel("epoch")
    last = h.dropna(subset=["accuracy", "val_accuracy", "val_loss"])      # a NaN epoch (diverged / interrupted) is not the verdict
    if last.empty:
        plt.tight_layout()
        plt.show()
        plt.close(fig)
        print("history has no complete epoch (NaN losses)")
        return None
    gap = float(last["accuracy"].iloc[-1] - last["val_accuracy"].iloc[-1])
    late = float(last["val_loss"].iloc[-1] - last["val_loss"].min())
    best = int(last["val_loss"].idxmin())
    if last["val_accuracy"].iloc[-1] < 0.8 and last["accuracy"].iloc[-1] < 0.8:
        verdict = "underfitting: both curves still low (train longer or widen the model)"
    elif gap > 0.05 or late > 0.15:
        verdict = "overfitting: validation falls behind or turns up (more augmentation / earlier stop)"
    else:
        verdict = "good fit: train and validation stay close, validation loss is not rising"
    fig.suptitle(f"{verdict} | final gap {gap:+.3f}, best val loss at epoch {best}/{len(h)}", y=1.04)
    plt.tight_layout()
    plt.show()
    plt.close(fig)
    return verdict


# ---------------------------------------------------------------- test sets
def true_label(f):
    s = Path(f).stem
    return s.split("_", 2)[2] if s.startswith("printed_") else s.split("_v3_")[0] if "_v3_" in s else s.rsplit("_", 1)[0]


def score_sets(clf, names, sets, batch=128, labels=None):
    """sets: {name: [image paths]}. labels: optional {path: type} (use the manifest instead of parsing file names).
    Returns {name: dict(files, p, y, pred)} using the training-time preprocessing."""
    import tensorflow as tf
    size = clf.input_shape[1]
    index = {n: i for i, n in enumerate(names)}

    def prep(path):
        with Image.open(path) as im:
            gray = np.asarray(im.convert("L")).astype(np.float32)
        return tf.image.resize_with_pad((255.0 - gray)[..., None], size, size).numpy()    # same inversion as training

    label_of = (lambda f: labels.get(str(f))) if labels else true_label
    out = {}
    for name, files in sets.items():
        kept = [f for f in files if label_of(f) in index]
        if len(kept) < len(files):
            unknown = sorted({str(label_of(f)) for f in files if label_of(f) not in index})
            print(f"{name}: dropped {len(files) - len(kept)} of {len(files)} files with a label the classifier does not know: "
                  f"{unknown[:8]}{' ...' if len(unknown) > 8 else ''}")
        files = kept
        if not files:
            continue
        p = np.concatenate([tf.nn.softmax(clf(np.stack([prep(f) for f in files[i:i + batch]]), training=False), -1).numpy()
                            for i in range(0, len(files), batch)])
        y = np.array([index[label_of(f)] for f in files])
        out[name] = dict(files=files, p=p, y=y, pred=p.argmax(1))
    return out


def plot_accuracy(R):
    """Held-out sets in colour. The train sample is hatched grey: it was seen in training, so it only shows the gap."""
    if not R:
        print("nothing scored")
        return pd.Series(dtype=float)
    acc = pd.Series({n: float((r["pred"] == r["y"]).mean()) for n, r in R.items()})
    ax = acc.plot.bar(figsize=(6, 3), rot=15, ylim=(0, 1.1), color=["#2a9d8f" if n != "train sample" else "#cccccc" for n in acc.index])
    for bar, name in zip(ax.patches, acc.index):
        if name == "train sample":
            bar.set_hatch("//")
    for c in ax.containers:
        ax.bar_label(c, fmt="%.3f")
    ax.set_title("accuracy: held-out sets in colour, seen-in-training sample hatched")
    plt.tight_layout()
    plt.show()
    plt.close(ax.figure)
    return acc


def plot_roc_residuals(R, names):
    """ROC one-vs-rest (micro AUC, and macro AUC over the classes present in each set), residual histogram
    (1 - p(true type)), worst types on the last held-out set."""
    from sklearn.metrics import auc, roc_curve

    def macro_auc(r):
        vals = []
        for c in np.unique(r["y"]):
            pos = r["y"] == c
            if 0 < pos.sum() < len(pos):
                fpr, tpr, _ = roc_curve(pos, r["p"][:, c])
                vals.append(auc(fpr, tpr))
        return float(np.mean(vals)) if vals else float("nan")

    held = [n for n in R if n != "train sample"]
    if not held:
        print("no held-out set scored: nothing to plot")
        return
    fig, ax = plt.subplots(1, 3, figsize=(17, 4))
    low = 0.8
    for n in held:
        r = R[n]
        fpr, tpr, _ = roc_curve(np.eye(len(names))[r["y"]].ravel(), r["p"].ravel())
        ax[0].plot(fpr, tpr, label=f"{n}: micro {auc(fpr, tpr):.3f}, macro over present classes {macro_auc(r):.3f}")
        low = min(low, float(np.interp(0.0, fpr, tpr)) - 0.02)      # the zoom keeps every curve's left end in view
    ax[0].plot([0, 1], [0, 1], "k:", lw=0.7)
    ax[0].set_xlim(0, 0.2)
    ax[0].set_ylim(max(0.0, low), 1.01)
    ax[0].set(title="ROC (zoomed to the top-left)", xlabel="false positive rate", ylabel="true positive rate")
    ax[0].legend(fontsize=7)
    for n, r in R.items():
        res = 1 - r["p"][np.arange(len(r["y"])), r["y"]]
        ax[1].hist(res, bins=np.linspace(0, 1, 21), histtype="step", density=True, label=f"{n} (mean {res.mean():.3f})")
    ax[1].set_yscale("log")
    ax[1].set_title("residuals: 1 - p(true type)")
    ax[1].legend(fontsize=7)
    last = held[-1]
    r = R[last]
    n_of = {c: int((r["y"] == c).sum()) for c in np.unique(r["y"])}
    keep = [c for c in n_of if n_of[c] >= 5] or list(n_of)      # a 1-of-1 miss is not a "worst type"
    err = pd.Series({f"{names[c]} (n={n_of[c]})": float((r["pred"][r["y"] == c] != c).mean()) for c in keep}).sort_values(ascending=False)[:12]
    err[::-1].plot.barh(ax=ax[2], color="tab:red")
    ax[2].set_title(f"{last}: error rate, 12 worst types" + (" (n >= 5)" if len(keep) < len(n_of) else ""))
    plt.tight_layout()
    plt.show()
    plt.close(fig)


def gallery(items, cols=6, cell=2.4, title=None):
    """items: (image, caption, colour)."""
    if not items:
        print(f"{title or 'gallery'}: nothing to show")
        return
    rows_ = -(-len(items) // cols)
    fig, axes = plt.subplots(rows_, cols, figsize=(cols * cell, rows_ * cell * 0.95), squeeze=False)
    for a in axes.ravel():
        a.axis("off")
    for a, (img, cap, col) in zip(axes.ravel(), items):
        a.imshow(img)
        a.set_title(cap, fontsize=7, color=col or "black")
    if title:
        fig.suptitle(title, fontsize=11)
    plt.tight_layout()
    plt.show()
    plt.close(fig)


def show_recognised(R, names, rng, n_ok=18, n_bad=30):
    """Prints how many crops were recognised per set, then shows right (green) and wrong (red) ones."""
    for name, r in R.items():
        hit = r["pred"] == r["y"]
        print(f"{name:32s} recognised {int(hit.sum()):>5} / {len(hit):<5} ({hit.mean():.1%})")
    for name, r in R.items():
        if name == "train sample":
            continue
        good, bad = np.where(r["pred"] == r["y"])[0], np.where(r["pred"] != r["y"])[0]
        items = [(_rgb(r["files"][i]), f"{names[r['pred'][i]]} {r['p'][i].max():.2f}", "green") for i in draw(good, n_ok, rng)]
        items += [(_rgb(r["files"][i]), f"guess {names[r['pred'][i]]} {r['p'][i].max():.2f}\ntrue {names[r['y'][i]]}", "red")
                  for i in draw(bad, n_bad, rng)]
        gallery(items, cols=8, cell=2.0, title=f"{name}: green = recognised, red = wrong (random {min(n_bad, len(bad))} of {len(bad)} wrong)")
