"""Part B helpers: full-sheet detector, wire tracing and graph recovery. Needs the SLD Training folder on sys.path."""
from __future__ import annotations

import copy
from pathlib import Path
from types import SimpleNamespace

import cv2
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from PIL import Image

from .io import free_gpu

DIRECTIONS = ("TB", "LR", "RL")
AUG = dict(degrees=180, fliplr=0.5, flipud=0.5, scale=0.5, translate=0.2, shear=5.0, perspective=0.001, mixup=0.15, copy_paste=0.1)
MAXSIDE = 900
METRICS = ["node_recall", "node_type_accuracy", "edge_precision", "edge_recall", "net_jaccard"]


def direction(sid):
    return next((d for d in ("LR", "RL") if f"-{d}-" in sid), "TB")


def make_ctx():
    """Everything the helpers need from the SLD Training folder, in one object."""
    import config
    import sld_data
    classes = sld_data.load_classes()
    ids = {s: sld_data.sheet_ids(s) for s in ("train", "val", "test")}
    return SimpleNamespace(config=config, image_path=sld_data.image_path, load_graph=sld_data.load_graph,
                           gt_detections=sld_data.gt_detections, classes=classes, ids=ids)


def by_direction(ctx, split, rng, n=1):
    """n random sheets per direction, preferring the GEN-V3 ones."""
    out = {}
    for d in DIRECTIONS:
        of_d = [i for i in ctx.ids[split] if direction(i) == d]
        v3 = [i for i in of_d if "-V3-" in i]
        pool = v3 if len(v3) >= n else of_d
        out[d] = rng.sample(pool, min(n, len(pool)))
    return out


# ---------------------------------------------------------------- look at the data
def plot_sheet_counts(ctx):
    tab = pd.DataFrame([(s, direction(i), "v3" if "-V3-" in i else "earlier") for s, l in ctx.ids.items() for i in l],
                       columns=["split", "direction", "batch"])
    fig, ax = plt.subplots(1, 2, figsize=(11, 3))
    order = ["train", "val", "test"]
    tab.groupby(["direction", "split"]).size().unstack().reindex(columns=order).plot.bar(ax=ax[0], rot=0, title="sheets by direction")
    tab.groupby(["batch", "split"]).size().unstack().reindex(columns=order).plot.bar(ax=ax[1], rot=0, title="earlier vs v3 sheets")
    plt.tight_layout()
    plt.show()
    return tab


def draw_sheet(ctx, ax, img, dets, edges=(), title=""):
    cfg = ctx.config
    ax.imshow(np.asarray(img.convert("L")), cmap="gray")
    for d in dets:
        if d["type"] == cfg.TEXT_CLASS:
            continue
        x0, y0, x1, y1 = d["bbox"]
        junction = d["type"] == cfg.JUNCTION_CLASS
        ax.add_patch(plt.Rectangle((x0, y0), x1 - x0, y1 - y0, fill=False, lw=0.8, ec="tab:gray" if junction else "tab:green"))
        if not junction:
            ax.text(x0, y0 - 3, d["type"], fontsize=5, color="tab:green")
    col = {"power": "tab:red", "measurement": "tab:blue", "protection": "tab:orange"}
    for e in edges:
        p = np.array(e["polyline"])
        ax.plot(p[:, 0], p[:, 1], lw=1.2, color=col.get(e["relationship"], "k"), alpha=0.8)
    ax.set_title(title, fontsize=8)
    ax.axis("off")


def show_ground_truth(ctx, rng, split="train"):
    pick = by_direction(ctx, split, rng)
    shown = [(d, pick[d][0]) for d in DIRECTIONS if pick[d]]
    fig, axes = plt.subplots(1, len(shown), figsize=(6 * len(shown), 6), squeeze=False)
    for ax, (d, sid) in zip(axes[0], shown):
        draw_sheet(ctx, ax, Image.open(ctx.image_path(sid, split)), ctx.gt_detections(ctx.load_graph(sid), ctx.classes), title=f"{sid} ({d}), ground truth")
    plt.tight_layout()
    plt.show()
    return len(shown)


# ---------------------------------------------------------------- augmentation, one effect per panel (an illustration)
def _load_small(ctx, sid, split="train"):
    img = Image.open(ctx.image_path(sid, split)).convert("RGB")
    s = MAXSIDE / max(img.size)
    boxes = [[v * s for v in d["bbox"]] for d in ctx.gt_detections(ctx.load_graph(sid), ctx.classes) if d["type"] != ctx.config.TEXT_CLASS]
    return np.asarray(img.resize((int(img.width * s), int(img.height * s)))), boxes


def _warp(img, boxes, H):
    h, w = img.shape[:2]
    out = cv2.warpPerspective(img, H, (w, h), borderValue=(114, 114, 114))
    nb = []
    for x0, y0, x1, y1 in boxes:
        pts = cv2.perspectiveTransform(np.array([[[x0, y0], [x1, y0], [x1, y1], [x0, y1]]], np.float32), H)[0]
        nb.append([pts[:, 0].min(), pts[:, 1].min(), pts[:, 0].max(), pts[:, 1].max()])
    return out, nb


def _affine(w, h, angle=0, scale=1.0, shear=0.0, flip=(False, False), persp=(0, 0)):
    c = np.array([[1, 0, -w / 2], [0, 1, -h / 2], [0, 0, 1]], np.float64)
    R = np.eye(3)
    R[:2] = cv2.getRotationMatrix2D((0, 0), angle, scale)
    S = np.array([[1, np.tan(np.radians(shear)), 0], [0, 1, 0], [0, 0, 1]], np.float64)
    F = np.diag([-1 if flip[0] else 1, -1 if flip[1] else 1, 1]).astype(np.float64)
    P = np.array([[1, 0, 0], [0, 1, 0], [persp[0], persp[1], 1]], np.float64)
    return np.linalg.inv(c) @ P @ R @ S @ F @ c


def _mosaic(imgs, boxes_list):
    h = w = MAXSIDE
    canvas = np.full((h, w, 3), 114, np.uint8)
    out = []
    for k, (im, bx) in enumerate(zip(imgs, boxes_list)):
        s = min(w / 2 / im.shape[1], h / 2 / im.shape[0])
        small = cv2.resize(im, (int(im.shape[1] * s), int(im.shape[0] * s)))
        ox, oy = (k % 2) * w // 2, (k // 2) * h // 2
        canvas[oy:oy + small.shape[0], ox:ox + small.shape[1]] = small
        out += [[b[0] * s + ox, b[1] * s + oy, b[2] * s + ox, b[3] * s + oy] for b in bx]
    return canvas, out


def augmentation_panels(ctx, sids):
    data = [_load_small(ctx, s) for s in sids]
    (img, bx), (img2, bx2) = data[0], data[1]
    h, w = img.shape[:2]
    hsv = cv2.cvtColor(img, cv2.COLOR_RGB2HSV).astype(np.float32)
    hsv[..., 1] *= 1.6
    hsv[..., 2] *= 0.7
    mixed = cv2.addWeighted(img, 0.5, cv2.resize(img2, (w, h)), 0.5, 0)
    sx, sy = w / img2.shape[1], h / img2.shape[0]
    mixed_boxes = bx + [[b[0] * sx, b[1] * sy, b[2] * sx, b[3] * sy] for b in bx2]
    return [
        ("original", img, bx),
        ("flip left-right", *_warp(img, bx, _affine(w, h, flip=(True, False)))),
        ("flip up-down", *_warp(img, bx, _affine(w, h, flip=(False, True)))),
        ("rotate 90", *_warp(img, bx, _affine(w, h, angle=90))),
        ("rotate 37", *_warp(img, bx, _affine(w, h, angle=37))),
        ("scale 0.6", *_warp(img, bx, _affine(w, h, scale=0.6))),
        ("shear 5", *_warp(img, bx, _affine(w, h, shear=5))),
        ("perspective", *_warp(img, bx, _affine(w, h, persp=(0.0008, 0.0006)))),
        ("colour jitter", cv2.cvtColor(np.clip(hsv, 0, 255).astype(np.uint8), cv2.COLOR_HSV2RGB), bx),
        ("mosaic (4 sheets)", *_mosaic([d[0] for d in data[:4]], [d[1] for d in data[:4]])),
        ("mixup (2 sheets)", mixed, mixed_boxes),
    ]


def show_augmentation(ctx, rng, repeats=2, cols=4):
    """One effect per panel. An illustration only: Ultralytics applies its own versions at random (see the real batches later)."""
    pool = [i for i in ctx.ids["train"] if "-V3-" in i] or ctx.ids["train"]
    n = 0
    for _ in range(repeats):
        ops = augmentation_panels(ctx, rng.sample(pool, 4))
        rows_ = -(-len(ops) // cols)
        fig, axes = plt.subplots(rows_, cols, figsize=(cols * 4.6, rows_ * 3.6), squeeze=False)
        for a in axes.ravel():
            a.axis("off")
        for a, (name, im, bx) in zip(axes.ravel(), ops):
            a.imshow(im)
            for x0, y0, x1, y1 in bx:
                a.add_patch(plt.Rectangle((x0, y0), x1 - x0, y1 - y0, fill=False, lw=0.7, ec="tab:green"))
            a.set_title(name, fontsize=9)
        fig.suptitle("illustration of each effect; training applies them randomly and combined", y=1.0, fontsize=9)
        plt.tight_layout()
        plt.show()
        n += len(ops)
    return n


# ---------------------------------------------------------------- training with live bars (uses the repo's own train())
class LiveBars:
    """Ultralytics callbacks: outer bar = epochs (latest mAP), inner bar = batches. Ultralytics' own output is off."""

    EVENTS = ("on_train_start", "on_train_epoch_start", "on_train_batch_end", "on_train_epoch_end", "on_fit_epoch_end", "on_train_end")

    def __init__(self):
        self.outer = self.inner = None

    def on_train_start(self, trainer):
        from tqdm.auto import tqdm
        self.tqdm = tqdm
        self.outer = tqdm(total=trainer.epochs, desc="epochs", unit="ep")

    def on_train_epoch_start(self, trainer):
        self.inner = self.tqdm(total=len(trainer.train_loader), desc=f"epoch {trainer.epoch + 1}", unit="it", leave=False)

    def on_train_batch_end(self, trainer):
        self.inner.update(1)
        if self.inner.n % 20 == 0 and trainer.tloss is not None:
            self.inner.set_postfix(loss=f"{float(trainer.tloss.sum()):.3f}")

    def on_train_epoch_end(self, trainer):
        self.inner.close()

    def on_fit_epoch_end(self, trainer):
        m = trainer.metrics or {}
        self.outer.update(1)
        self.outer.set_postfix(mAP50=f"{m.get('metrics/mAP50(B)', 0):.3f}", mAP50_95=f"{m.get('metrics/mAP50-95(B)', 0):.3f}")

    def on_train_end(self, trainer):
        self.outer.close()


def train_detector(epochs, project, aug=AUG):
    """Trains with train_sld.train (one code path with the CLI), live bars instead of per-epoch prints."""
    from train_sld import train
    bars = LiveBars()
    return train(epochs=epochs, project=project, callbacks={e: getattr(bars, e) for e in bars.EVENTS}, report=False, verbose=False, **aug)


def plot_detector_curves(run):
    """Loss, mAP, precision/recall with an overfitting verdict; real augmented batches; PR, F1, confusion matrix."""
    run = Path(run)
    csv = run / "results.csv"
    if not csv.exists():
        print("no results.csv (weights were restored, not trained in this session)")
        return None
    r = pd.read_csv(csv)
    r.columns = [c.strip() for c in r.columns]
    fig, ax = plt.subplots(1, 4, figsize=(19, 3.4))
    for k, name in enumerate(("box_loss", "cls_loss")):
        r[[f"train/{name}", f"val/{name}"]].plot(ax=ax[k], title=name)
    r[["metrics/mAP50(B)", "metrics/mAP50-95(B)"]].plot(ax=ax[2], title="validation mAP")
    r[["metrics/precision(B)", "metrics/recall(B)"]].plot(ax=ax[3], title="precision / recall")
    for a in ax:
        a.set_xlabel("epoch")
    tb, vb = r["train/box_loss"], r["val/box_loss"]
    gap, late = float(vb.iloc[-1] - tb.iloc[-1]), float(vb.iloc[-1] - vb.min())
    if r["metrics/mAP50(B)"].iloc[-1] < 0.5:
        verdict = "underfitting: mAP is still low (train longer, larger model or image size)"
    elif late > 0.1 * float(vb.min()) or gap > 0.5 * float(tb.iloc[-1]):
        verdict = "overfitting: validation loss lags or turns up while training loss keeps falling"
    else:
        verdict = "good fit: train and validation loss track each other, mAP has levelled off"
    fig.suptitle(f"{verdict} | box-loss gap {gap:+.3f}", y=1.04)
    plt.tight_layout()
    plt.show()
    for group, cell in ((("train_batch0.jpg", "train_batch1.jpg", "train_batch2.jpg"), 7),
                        (("BoxPR_curve.png", "BoxF1_curve.png", "confusion_matrix_normalized.png"), 7)):
        files = [run / n for n in group if (run / n).exists()]
        if files:
            fig, axes = plt.subplots(1, len(files), figsize=(cell * len(files), 6), squeeze=False)
            for a, f in zip(axes[0], files):
                a.imshow(Image.open(f))
                a.axis("off")
                a.set_title(f.stem + (" (real augmented batch)" if f.stem.startswith("train_batch") else ""), fontsize=9)
            plt.tight_layout()
            plt.show()
    return verdict


# ---------------------------------------------------------------- test split
def test_map(weights, data_yaml, imgsz):
    """Detector metrics on the test split, per-class AP chart. Frees the model afterwards. Returns (mAP50, mAP50-95)."""
    from ultralytics import YOLO
    m = YOLO(str(weights)).val(data=str(data_yaml), split="test", imgsz=imgsz, plots=False, verbose=False)
    ap = pd.Series({m.names[int(c)]: float(m.box.maps[int(c)]) for c in m.box.ap_class_index}).sort_values()
    ax = ap.plot.barh(figsize=(7, max(3, len(ap) * 0.22)), color="#3b82f6")
    ax.set_title(f"test AP50-95 per class | mAP50 {m.box.map50:.3f}, mAP50-95 {m.box.map:.3f}")
    plt.tight_layout()
    plt.show()
    out = float(m.box.map50), float(m.box.map)
    del m
    free_gpu()
    return out


class Recoverer:
    """Detector + wire tracer, then the Part A classifier re-labels each symbol. Results are cached per sheet."""

    def __init__(self, ctx, detector, classifier, conf=None):
        from predict_graph import predict_sheet
        from reclassify import reclassify
        self.ctx, self.detector, self.classifier, self.conf = ctx, detector, classifier, conf
        self._predict, self._reclassify = predict_sheet, reclassify
        self.cache = {}

    def __call__(self, sid, split="test"):
        if (sid, split) not in self.cache:
            img = Image.open(self.ctx.image_path(sid, split))
            kw = {} if self.conf is None else {"conf": self.conf}
            result, _ = self._predict(self.detector, img, self.ctx.classes, sid, **kw)
            plain = copy.deepcopy(result)
            self._reclassify(img, result["symbols"], self.classifier)
            self.cache[(sid, split)] = (plain, result)
        return self.cache[(sid, split)]


def conf_sweep(ctx, detector, rng, confs=(0.1, 0.15, 0.25, 0.35, 0.5), n=24, split="val"):
    """Detector-only node precision / recall / F1 on a few val sheets at several confidence thresholds. Returns (table, best conf)."""
    from graph_eval import match_nodes
    from predict_graph import detect
    sample = [s for d in DIRECTIONS for s in by_direction(ctx, split, rng, n // 3)[d]]
    rows = []
    for conf in confs:
        tp = pred = gt = 0
        for sid in sample:
            dets = [d for d in detect(detector, Image.open(ctx.image_path(sid, split)), ctx.classes, conf=conf)
                    if d["type"] not in (ctx.config.TEXT_CLASS,)]
            g = ctx.load_graph(sid)
            tp += len(match_nodes(g["nodes"], [d for d in dets if d["type"] != ctx.config.JUNCTION_CLASS], g))
            pred += sum(d["type"] != ctx.config.JUNCTION_CLASS for d in dets)
            gt += len(g["nodes"])
        p, r = tp / max(1, pred), tp / max(1, gt)
        rows.append({"conf": conf, "precision": p, "recall": r, "f1": 2 * p * r / max(1e-9, p + r)})
    table = pd.DataFrame(rows).set_index("conf")
    ax = table.plot(marker="o", figsize=(5, 3), ylim=(0, 1.05), title=f"detector node score vs confidence ({len(sample)} {split} sheets)")
    plt.tight_layout()
    plt.show()
    return table, float(table.f1.idxmax())


def balanced_sample(ctx, rng, n):
    """About n test sheets spread over TB / LR / RL; a direction with too few sheets hands its share to the others."""
    pools = {d: [x for x in ctx.ids["test"] if direction(x) == d] for d in DIRECTIONS}
    if not n or n >= sum(map(len, pools.values())):
        return list(ctx.ids["test"])
    out, left = [], n
    for k, d in enumerate(sorted(DIRECTIONS, key=lambda d: len(pools[d]))):
        take = min(len(pools[d]), left // (len(DIRECTIONS) - k))
        out += rng.sample(pools[d], take)
        left -= take
    return out


def evaluate_sheets(ctx, recover, sample):
    """One pass per sheet. Each row scores three stages with true boxes / detector / detector + classifier,
    both type-gated ('') and by location only ('_loc'). found: class -> [matched, true] for the detector alone."""
    from graph_eval import match_nodes, oracle_prediction, score_sheet
    from tqdm.auto import tqdm
    rows, found = [], {c: [0, 0] for c in ctx.classes}
    for sid in tqdm(sample, desc="test sheets"):
        plain, result = recover(sid)
        g = ctx.load_graph(sid)
        mt = match_nodes(g["nodes"], plain["symbols"], g)
        for gi, n in enumerate(g["nodes"]):
            found[n["type"]][1] += 1
            found[n["type"]][0] += gi in mt
        _, oracle = oracle_prediction(sid, "test", ctx.classes)
        rows.append({"sheet": sid, "direction": direction(sid), "found": len(mt), "gt": len(g["nodes"]),
                     "oracle": score_sheet(g, oracle), "det": score_sheet(g, plain), "clf": score_sheet(g, result),
                     "det_loc": score_sheet(g, plain, typed=False), "clf_loc": score_sheet(g, result, typed=False)})
    return rows, found


def plot_found(rows, found):
    tot_f, tot_g = sum(r["found"] for r in rows), sum(r["gt"] for r in rows)
    print(f"detector found {tot_f:,} of {tot_g:,} ground-truth symbols (right box and right type) on {len(rows)} test sheets ({tot_f / max(1, tot_g):.1%})")
    rec = pd.Series({c: v[0] / v[1] for c, v in found.items() if v[1]}).sort_values()
    fig, ax = plt.subplots(1, 2, figsize=(13, max(3, len(rec) * 0.22)))
    rec.plot.barh(ax=ax[0], color="#2a9d8f", xlim=(0, 1.05))
    ax[0].set_title("share of true symbols found, per class")
    pd.DataFrame({d: {"found": sum(r["found"] for r in rows if r["direction"] == d),
                      "missed": sum(r["gt"] - r["found"] for r in rows if r["direction"] == d)} for d in DIRECTIONS}).T.plot.bar(
        ax=ax[1], stacked=True, rot=0, color=["#2a9d8f", "#e76f51"], title="found vs missed by direction")
    plt.tight_layout()
    plt.show()
    return tot_f, tot_g


def pick_examples(rows, per_direction=1):
    """The sheet with median edge recall in each direction (a typical case, not a lucky one)."""
    out = []
    for d in DIRECTIONS:
        of_d = sorted((r for r in rows if r["direction"] == d), key=lambda r: r["clf_loc"]["edges_hit"] / max(1, r["clf_loc"]["edges_gt"]))
        if of_d:
            mid = len(of_d) // 2
            out += [r["sheet"] for r in of_d[max(0, mid - per_direction // 2):mid + max(1, per_direction)][:per_direction]]
    return out


def show_found_sheets(ctx, recover, sids):
    """Detector boxes in green; ground-truth symbols it missed in dashed orange."""
    from graph_eval import match_nodes
    fig, axes = plt.subplots(1, len(sids), figsize=(6 * len(sids), 6), squeeze=False)
    for a, sid in zip(axes[0], sids):
        plain, _ = recover(sid)
        g = ctx.load_graph(sid)
        mt = match_nodes(g["nodes"], plain["symbols"], g)
        draw_sheet(ctx, a, Image.open(ctx.image_path(sid, "test")), plain["symbols"], (), f"{sid}: found {len(mt)} of {len(g['nodes'])} symbols")
        for gi, n in enumerate(g["nodes"]):
            if gi not in mt:
                x0, y0, x1, y1 = _px(ctx, n, g)
                a.add_patch(plt.Rectangle((x0, y0), x1 - x0, y1 - y0, fill=False, lw=1.2, ec="tab:orange", ls="--"))
    plt.tight_layout()
    plt.show()


def _px(ctx, node, graph):
    from sld_data import to_px
    return to_px(node.get("bbox_draw", node["bbox"]), graph)


# ---------------------------------------------------------------- graph recovery
def table(rows, key, d="all"):
    from graph_eval import summarise
    return summarise([r[key] for r in rows if d == "all" or r["direction"] == d])


def stage_table(rows):
    """Where the error comes from: true boxes -> tracer only; detector; detector + classifier. Located-only scoring
    for the detector stages so a finer classifier label is not counted as a missed node (type accuracy is its own column)."""
    stages = {"1 tracer, true boxes": "oracle", "2 detector + tracer": "det_loc", "3 + classifier": "clf_loc"}
    out = pd.concat({d: pd.DataFrame({name: table(rows, key, d) for name, key in stages.items()}).T[METRICS]
                     for d in ("all",) + DIRECTIONS})
    return out.round(3)


def typed_vs_loc(rows):
    """The same sheets scored with the type-gated rule and by location only. A gap between 'type-gated' and 'location only'
    is a labelling disagreement, not a missed box; node_type_accuracy says how often the matched box also has the right type."""
    cols = ["node_recall", "node_type_accuracy", "edge_precision", "edge_recall"]
    return pd.DataFrame({"detector (type-gated)": table(rows, "det"), "+ classifier (type-gated)": table(rows, "clf"),
                         "detector (location only)": table(rows, "det_loc"), "+ classifier (location only)": table(rows, "clf_loc")}).T[cols].round(3)


def plot_scores(rows):
    fig, axes = plt.subplots(1, 4, figsize=(18, 3.2), sharey=True)
    stages = {"true boxes": "oracle", "detector": "det_loc", "+ classifier": "clf_loc"}
    for ax, d in zip(axes, ("all",) + DIRECTIONS):
        n = sum(1 for r in rows if d == "all" or r["direction"] == d)
        sub = pd.DataFrame({name: table(rows, key, d) for name, key in stages.items()}).loc[["node_recall", "edge_precision", "edge_recall", "net_jaccard"]]
        sub.plot.bar(ax=ax, rot=35, ylim=(0, 1.05), legend=d == "all", color=["#264653", "#9aa5b1", "#2a9d8f"], title=f"{d} ({n} sheets)")
    plt.tight_layout()
    plt.show()


def show_recovered(ctx, recover, sids):
    fig, axes = plt.subplots(1, len(sids), figsize=(6 * len(sids), 6), squeeze=False)
    for ax, sid in zip(axes[0], sids):
        draw_sheet(ctx, ax, Image.open(ctx.image_path(sid, "test")), recover(sid)[1]["symbols"], recover(sid)[1]["edges"],
                   f"{sid}: detected, traced, re-labelled")
    plt.tight_layout()
    plt.show()


def show_guess_vs_true(ctx, recover, sids):
    from viz import show_identified
    for sid in sids:
        show_identified(Image.open(ctx.image_path(sid, "test")), ctx.load_graph(sid), recover(sid)[1]["symbols"], ctx.classes, title=sid)
        plt.show()


def show_edge_audit(ctx, recover, sids):
    """Edges against ground truth, drawn between symbol centres: green = right, red = right link wrong type, orange dashed = missed, purple = not in the truth."""
    from graph_eval import match_nodes
    fig, axes = plt.subplots(1, len(sids), figsize=(6 * len(sids), 6), squeeze=False)
    for ax, sid in zip(axes[0], sids):
        _, result = recover(sid)
        g = ctx.load_graph(sid)
        m = match_nodes(g["nodes"], result["symbols"], g, typed=False)
        ids = [n["id"] for n in g["nodes"]]
        pred_of = {ids[gi]: pi for gi, pi in m.items()}
        gt_of = {pi: ids[gi] for gi, pi in m.items()}
        centre = lambda b: ((b[0] + b[2]) / 2, (b[1] + b[3]) / 2)
        node_c = {n["id"]: centre(_px(ctx, n, g)) for n in g["nodes"]}
        ax.imshow(np.asarray(Image.open(ctx.image_path(sid, "test")).convert("L")), cmap="gray", alpha=0.45)
        pred_edges = {frozenset((e["a"], e["b"])): e["relationship"] for e in result["edges"]}
        seen, counts = set(), {"right": 0, "wrong type": 0, "missed": 0, "extra": 0}
        for e in g["edges"]:
            a, b = pred_of.get(e["source"]), pred_of.get(e["target"])
            rel = pred_edges.get(frozenset((a, b))) if a is not None and b is not None else None
            (x0, y0), (x1, y1) = node_c[e["source"]], node_c[e["target"]]
            if rel is None:
                ax.plot([x0, x1], [y0, y1], "--", color="tab:orange", lw=1.4); counts["missed"] += 1
            else:
                seen.add(frozenset((a, b)))
                ok = rel == e["relationship"]
                ax.plot([x0, x1], [y0, y1], "-", color="tab:green" if ok else "tab:red", lw=1.6); counts["right" if ok else "wrong type"] += 1
        for key in set(pred_edges) - seen:
            a, b = tuple(key)
            if a in gt_of and b in gt_of:
                (x0, y0), (x1, y1) = node_c[gt_of[a]], node_c[gt_of[b]]
                ax.plot([x0, x1], [y0, y1], "-", color="tab:purple", lw=1.0); counts["extra"] += 1
        ax.set_title(f"{sid}: " + ", ".join(f"{k} {v}" for k, v in counts.items()), fontsize=8)
        ax.axis("off")
    plt.tight_layout()
    plt.show()


def show_worst(ctx, rows, recover, n=5):
    worst = sorted(rows, key=lambda r: r["clf_loc"]["edges_hit"] / max(1, r["clf_loc"]["edges_gt"]))[:n]
    fig, axes = plt.subplots(1, len(worst), figsize=(4.4 * len(worst), 5), squeeze=False)
    for ax, r in zip(axes[0], worst):
        sid = r["sheet"]
        _, result = recover(sid)                       # cached: no second inference
        draw_sheet(ctx, ax, Image.open(ctx.image_path(sid, "test")), result["symbols"], result["edges"],
                   f"{sid}\nedge recall {r['clf_loc']['edges_hit'] / max(1, r['clf_loc']['edges_gt']):.2f}")
    plt.tight_layout()
    plt.show()
