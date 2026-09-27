"""
Normalise external (CGHD) test crops to the training domain: white paper, black ink,
square canvas with a paper margin, so a hand-drawn photo crop looks like a Schematex crop.

Idempotent. The first run moves the raw crops to images/test_raw and always re-normalises
from there, so re-running never compounds the transform.

Usage (from this folder):
  python normalise_test_crops.py                 # component-symbols-test/
  python normalise_test_crops.py --test-dir PATH
  python normalise_test_crops.py --preview 6     # also save outputs/test_crops_normalised.png
"""

from __future__ import annotations

import argparse
import shutil
from pathlib import Path

import numpy as np
from PIL import Image, ImageFilter

from config import OUTPUT_DIR, TEST_DATA_DIR

MARGIN = 0.25  # square canvas with paper margin so the symbol fills roughly what a Schematex crop does
PAPER = 0.88   # flattened values above this are paper texture -> snap to pure white
GAMMA = 1.5    # pushes soft pencil strokes toward black


def normalise_crop(img: Image.Image, margin=MARGIN, paper=PAPER, gamma=GAMMA) -> Image.Image:
    g = np.asarray(img.convert("L"), dtype=np.float32)
    h, w = g.shape
    # paper estimate: grey closing (max filter removes thin dark strokes) then blur
    k = max(15, (min(h, w) // 8) | 1)
    bg = Image.fromarray(g.astype(np.uint8)).filter(ImageFilter.MaxFilter(k)).filter(ImageFilter.GaussianBlur(k / 2))
    bg = np.maximum(np.asarray(bg, dtype=np.float32), 1.0)
    flat = np.clip(g / bg, 0, 1)  # 1 = paper, <1 = ink, independent of lighting
    lo = np.percentile(flat, 1.0)
    stretched = np.clip((flat - lo) / max(paper - lo, 1e-3), 0, 1)
    out = Image.fromarray((stretched ** gamma * 255).astype(np.uint8))
    side = int(max(h, w) * (1 + 2 * margin))
    canvas = Image.new("L", (side, side), 255)
    canvas.paste(out, ((side - w) // 2, (side - h) // 2))
    return canvas


def normalise_dir(test_dir: Path, split="test") -> list[Path]:
    img_dir = test_dir / "images" / split
    raw_dir = test_dir / "images" / f"{split}_raw"
    if not raw_dir.exists():
        shutil.copytree(img_dir, raw_dir)
    raw_files = sorted(raw_dir.glob("*.png"))
    for p in raw_files:
        normalise_crop(Image.open(p)).save(img_dir / p.name)
    return raw_files


def save_preview(test_dir: Path, raw_files: list[Path], n: int, out_path: Path):
    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt

    show = raw_files[:: max(1, len(raw_files) // n)][:n]
    fig, axes = plt.subplots(2, len(show), figsize=(2.2 * len(show), 4.6), squeeze=False)
    for j, p in enumerate(show):
        axes[0, j].imshow(Image.open(p), cmap="gray", vmin=0, vmax=255)
        axes[0, j].set_title("raw", fontsize=8)
        axes[1, j].imshow(Image.open(test_dir / "images" / "test" / p.name), cmap="gray", vmin=0, vmax=255)
        axes[1, j].set_title("normalised", fontsize=8)
    for ax in axes.flat:
        ax.axis("off")
    plt.tight_layout()
    out_path.parent.mkdir(parents=True, exist_ok=True)
    fig.savefig(out_path, dpi=120)
    plt.close(fig)


def main():
    parser = argparse.ArgumentParser(description="Normalise external test crops to the training domain")
    parser.add_argument("--test-dir", type=Path, default=TEST_DATA_DIR)
    parser.add_argument("--preview", type=int, default=0, help="Save a raw/normalised strip of N crops to outputs/")
    args = parser.parse_args()

    if not (args.test_dir / "images" / "test").is_dir():
        raise SystemExit(f"no images/test under {args.test_dir}")
    raw_files = normalise_dir(args.test_dir)
    print(f"normalised {len(raw_files)} crops -> {args.test_dir / 'images' / 'test'}")
    if args.preview:
        out = OUTPUT_DIR / "test_crops_normalised.png"
        save_preview(args.test_dir, raw_files, args.preview, out)
        print(f"preview -> {out}")


if __name__ == "__main__":
    main()
