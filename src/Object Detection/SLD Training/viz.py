"""Draw detections and the recovered graph on a sheet (matplotlib)."""
import matplotlib.pyplot as plt
import numpy as np

from config import JUNCTION_CLASS, MATCH_IOU, TEXT_CLASS

COLORS = {"power": "tab:red", "measurement": "tab:blue", "protection": "tab:orange"}


def show_graph(image, result, title="", figsize=(11, 15), show_text=False):
    fig, ax = plt.subplots(figsize=figsize)
    ax.imshow(np.asarray(image.convert("L")), cmap="gray")
    for d in result.get("detections", result["symbols"]):
        if d["type"] == TEXT_CLASS and not show_text:
            continue
        x0, y0, x1, y1 = d["bbox"]
        col = "tab:green" if d["type"] not in (JUNCTION_CLASS, TEXT_CLASS) else "tab:gray"
        ax.add_patch(plt.Rectangle((x0, y0), x1 - x0, y1 - y0, fill=False, lw=1, ec=col))
        if d["type"] not in (JUNCTION_CLASS, TEXT_CLASS):
            ax.text(x0, y0 - 3, d["type"], fontsize=6, color=col)
    for e in result["edges"]:
        pts = np.array(e["polyline"])
        ax.plot(pts[:, 0], pts[:, 1], "-", lw=1.5, color=COLORS.get(e["relationship"], "k"), alpha=0.8)
    ax.set_title(title)
    ax.axis("off")
    plt.tight_layout()
    return fig


def _tag(ax, x, y, text, color):
    ax.text(x, max(y - 2, 0), text, fontsize=7, color="white", va="bottom",
            bbox=dict(boxstyle="round,pad=0.12", fc=color, ec="none", alpha=0.9))


def show_labels(image, graph, classes, title=""):
    """Ground-truth symbol names on a sheet. Junctions and text are left off."""
    from sld_data import gt_detections
    dets = [d for d in gt_detections(graph, classes) if d["type"] not in (JUNCTION_CLASS, TEXT_CLASS)]
    fig, ax = plt.subplots(figsize=(12, 16))
    ax.imshow(np.asarray(image.convert("L")), cmap="gray")
    for d in dets:
        x0, y0, x1, y1 = d["bbox"]
        ax.add_patch(plt.Rectangle((x0, y0), x1 - x0, y1 - y0, fill=False, lw=1.5, ec="tab:blue"))
        _tag(ax, x0, y0, d["type"], "tab:blue")
    ax.set_title(f"{title}  {len(dets)} symbols")
    ax.axis("off")
    plt.tight_layout()
    return fig


def show_identified(image, graph, symbols, classes, title="", iou=MATCH_IOU):
    """Write 'guess A | true B' on each symbol. Green when they match, red when they do not.

    Boxes are paired by graph_eval.match_nodes(typed=False), the same rule the location-only scores use.
    `iou` is kept for old callers; the threshold is config.MATCH_IOU."""
    from graph_eval import match_nodes
    from sld_data import to_px
    gt = [n for n in graph["nodes"] if n["type"] in classes and n["type"] not in (JUNCTION_CLASS, TEXT_CLASS)]
    preds = [d for d in symbols if d["type"] not in (JUNCTION_CLASS, TEXT_CLASS)]
    m = match_nodes(gt, preds, graph, typed=False)
    true_of = {pi: gt[gi]["type"] for gi, pi in m.items()}
    correct = misclassified = false_pos = 0
    fig, ax = plt.subplots(figsize=(14, 18))
    ax.imshow(np.asarray(image.convert("L")), cmap="gray")
    for pi, d in enumerate(preds):
        true = true_of.get(pi)
        ok = true == d["type"]
        correct += ok
        misclassified += true is not None and not ok
        false_pos += true is None
        x0, y0, x1, y1 = d["bbox"]
        color = "tab:green" if ok else "tab:red"
        ax.add_patch(plt.Rectangle((x0, y0), x1 - x0, y1 - y0, fill=False, lw=2, ec=color))
        _tag(ax, x0, y0, f"guess {d['type']} | true {true or 'nothing'}", color)
    missed = 0
    for gi, g in enumerate(gt):
        if gi in m:
            continue
        missed += 1
        x0, y0, x1, y1 = to_px(g.get("bbox_draw", g["bbox"]), graph)
        ax.add_patch(plt.Rectangle((x0, y0), x1 - x0, y1 - y0, fill=False, lw=1.5, ec="tab:orange", ls="--"))
        _tag(ax, x0, y0, f"missed | true {g['type']}", "tab:orange")
    ax.set_title(f"{title}  {correct}/{len(gt)} correct, {misclassified} misclassified, {false_pos} false positives, {missed} missed")
    ax.axis("off")
    plt.tight_layout()
    return fig, {"correct": correct, "wrong": misclassified + false_pos, "misclassified": misclassified,
                 "false_pos": false_pos, "missed": missed, "gt": len(gt)}
