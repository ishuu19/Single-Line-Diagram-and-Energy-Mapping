"""Find data by what is inside it (never by owner or dataset name), link it, restore models, small check helper."""
from __future__ import annotations

import os
import shutil
import subprocess
from pathlib import Path

PRUNE = {"images", "labels", "graphs", "train", "val", "test", "__pycache__"}


def ok(condition, message):
    """Check cell helper: prints a tick or stops the notebook with the message."""
    if not condition:
        raise AssertionError(f"CHECK FAILED: {message}")
    print(f"ok  {message}")


def sh(*cmd, cwd=None):
    r = subprocess.run(cmd, cwd=cwd, text=True, capture_output=True)
    return (r.stdout + r.stderr).strip()


def scan_inputs(inp, max_depth=6):
    """Walk the input folder once, without entering image folders, and sort what is there by content."""
    inp = Path(inp)
    found = {"crops": [], "printed": [], "sheets": [], "keras": [], "pt": []}
    for dp, dirs, files in os.walk(inp):
        here = Path(dp)
        if len(here.relative_to(inp).parts) >= max_depth:
            dirs[:] = []
            continue
        names, fset = set(dirs), set(files)
        if "manifest.jsonl" in fset and "images" in names:
            if (here / "images" / "train").is_dir():
                found["crops"].append(here)
            elif (here / "images" / "test").is_dir():
                found["printed"].append(here)
        if "data.yaml" in fset and "graphs" in names:
            found["sheets"].append(here)
        found["keras"] += [here / f for f in files if f.endswith(".keras")]
        found["pt"] += [here / f for f in files if f.endswith(".pt")]
        dirs[:] = [d for d in dirs if d not in PRUNE]
    return found


def show_tree(base, depth=3):
    base = Path(base)
    for dp, dirs, files in os.walk(base):
        rel = Path(dp).relative_to(base)
        if len(rel.parts) >= depth:
            dirs[:] = []
        dirs[:] = sorted(d for d in dirs if d not in PRUNE)
        print("  " * len(rel.parts) + (rel.name or str(base)) + "/", f"({len(files)} files)" if files else "")


def _crops_info(path):
    """(has v3 crops, manifest size). v3 rows were appended last, so the tail of the manifest is enough to tell."""
    f = Path(path) / "manifest.jsonl"
    with open(f, "rb") as fh:
        fh.seek(0, 2)
        size = fh.tell()
        fh.seek(max(0, size - 20000))
        return b"_v3_" in fh.read(), size


def _sheets_info(path):
    """(has GEN-V3 sheets, number of sheets) from split.json; falls back to counting labels."""
    sj = Path(path) / "split.json"
    if sj.exists():
        ids = list(__import__("json").loads(sj.read_text()))
    else:
        ids = [p.stem for p in (Path(path) / "labels" / "train").glob("*.txt")]
    return any("-V3-" in i for i in ids), len(ids)


def locate(inp):
    """Returns dict(found=..., crops=, printed=, sheets=). When several datasets of a kind are attached, the one with the most
    complete content wins (crops with v3 files, sheets with GEN-V3 plants and the most sheets) and every candidate is listed.
    Prints one line per dataset; lists the input tree if one is missing."""
    found = scan_inputs(inp)
    out = {"found": found, "crops": None, "printed": None, "sheets": None}
    if found["crops"]:
        out["crops"] = max(found["crops"], key=_crops_info)
    if found["printed"]:
        out["printed"] = found["printed"][0]
    if found["sheets"]:
        out["sheets"] = max(found["sheets"], key=_sheets_info)
    for label in ("crops", "printed", "sheets"):
        print(f"{label:8s}", out[label] or "NOT FOUND")
        if len(found[label]) > 1:
            info = _crops_info if label == "crops" else _sheets_info if label == "sheets" else None
            for p in found[label]:
                print("          candidate:", p, info(p) if info else "")
    print("models  ", [p.name for p in found["keras"] + found["pt"]] or "none attached")
    if not (out["crops"] and out["printed"] and out["sheets"]):
        print("\nPath problem. This is what the input folder contains:\n")
        show_tree(inp)
    return out


def link(src, dest):
    """Symlink on Linux (Kaggle). Windows without symlink rights falls back to a junction."""
    dest = Path(dest)
    dest.parent.mkdir(parents=True, exist_ok=True)
    if dest.is_symlink():
        dest.unlink()
    elif dest.exists():
        raise FileExistsError(f"{dest} exists and is a real folder, refusing to delete it")
    try:
        os.symlink(src, dest, target_is_directory=True)
    except OSError:
        subprocess.run(["cmd", "/c", "mklink", "/J", str(dest), str(src)], check=True, capture_output=True)


def free_gpu():
    """Release cached GPU memory held by TensorFlow and PyTorch between phases."""
    import gc
    gc.collect()
    try:
        import tensorflow as tf
        tf.keras.backend.clear_session()
        tf.keras.mixed_precision.set_global_policy("float32")   # Part A trains in mixed_float16; inference after it does not need it
        gc.collect()
    except Exception:
        pass
    try:
        import torch
        if torch.cuda.is_available():
            torch.cuda.empty_cache()
    except Exception:
        pass


def restore(patterns, dest, search_dirs):
    """Copy model files saved earlier (previous session or any attached dataset) into `dest`, if not already there."""
    dest = Path(dest)
    dest.mkdir(parents=True, exist_ok=True)
    for pat in patterns:
        if list(dest.glob(pat)):
            continue
        for d in search_dirs:
            hit = next(Path(d).glob(pat), None) if Path(d).is_dir() else None
            if hit:
                shutil.copy(hit, dest / hit.name)
                break
    return sorted(p.name for p in dest.glob("*") if p.is_file())


def bundle(save_dir, extra_dirs, notebooks, out_dir, out_zip):
    """Zip models + outputs (never datasets) for download. extra_dirs: {zip subfolder: source folder}."""
    import zipfile
    save_dir, out_dir, out_zip = Path(save_dir), Path(out_dir), Path(out_zip)
    if out_dir.exists():
        shutil.rmtree(out_dir)
    out_dir.mkdir(parents=True)
    for sub in ("models", "outputs"):
        if (save_dir / sub).exists():
            shutil.copytree(save_dir / sub, out_dir / sub)
    for sub, src in extra_dirs.items():
        if Path(src).exists():
            shutil.copytree(src, out_dir / sub, dirs_exist_ok=True)
    for nb_path in notebooks:
        if Path(nb_path).exists():
            shutil.copy(nb_path, out_dir / Path(nb_path).name)
            break
    with zipfile.ZipFile(out_zip, "w", zipfile.ZIP_DEFLATED) as zf:
        for path in out_dir.rglob("*"):
            if path.is_file():
                zf.write(path, path.relative_to(out_dir))
    return out_zip
