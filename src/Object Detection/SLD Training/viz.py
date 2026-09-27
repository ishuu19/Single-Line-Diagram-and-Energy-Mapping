"""Draw detections and the recovered graph on a sheet (matplotlib)."""
import matplotlib.pyplot as plt
import numpy as np

from config import JUNCTION_CLASS, TEXT_CLASS

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
