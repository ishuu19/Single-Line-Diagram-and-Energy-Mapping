"""Find data by what is inside it (never by owner or dataset name), link it, restore models, small check helper."""
from __future__ import annotations

import json
import os
import shutil
import subprocess
import sys
from pathlib import Path

PRUNE = {"images", "labels", "graphs", "__pycache__"}      # bulk data folders: never walked into
SPLITS = {"train", "val", "test"}                           # skipped only directly under a dataset root (runs/*/train/weights stays visible)


def ok(condition, message):
    """Check cell helper: prints a tick or stops the notebook with the message."""
    if not condition:
        raise AssertionError(f"CHECK FAILED: {message}")
    print(f"ok  {message}")


def sh(*cmd, cwd=None, check=True):
    """Run a command, return its combined output. check=True raises on a non-zero exit code, with the output in the message."""
    r = subprocess.run(cmd, cwd=cwd, text=True, capture_output=True)
    out = (r.stdout + r.stderr).strip()
    if check and r.returncode != 0:
        raise RuntimeError(f"{' '.join(map(str, cmd))} exited with code {r.returncode}:\n{out}")
    return out


def _models_in(names, here):
    return [here / f for f in names if f.lower().endswith(".keras")], [here / f for f in names if f.lower().endswith(".pt")]


def scan_inputs(inp, max_depth=6):
    """Walk the input folder once (sorted, following links, each real folder once), without entering image folders,
    and sort what is there by content. Skipped folders are still checked one level deep for model files."""
    inp = Path(inp)
    found = {"crops": [], "printed": [], "sheets": [], "keras": [], "pt": []}
    visited = set()
    for dp, dirs, files in os.walk(inp, followlinks=True):
        here = Path(dp)
        real = os.path.realpath(dp)
        if real in visited or len(here.relative_to(inp).parts) >= max_depth:
            dirs[:] = []
            continue
        visited.add(real)
        dirs.sort()
        files.sort()
        names, fset = set(dirs), set(files)
        root = False
        if "manifest.jsonl" in fset and "images" in names:
            root = True
            if (here / "images" / "train").is_dir():
                found["crops"].append(here)
            elif (here / "images" / "test").is_dir():
                found["printed"].append(here)
        if "data.yaml" in fset and "graphs" in names:
            root = True
            found["sheets"].append(here)
        k, p = _models_in(files, here)
        found["keras"] += k
        found["pt"] += p
        pruned = [d for d in dirs if d in PRUNE or (root and d in SPLITS)]
        for d in pruned:      # cheap look at the top of a skipped folder: a model file dropped there is still found
            try:
                top = sorted(e.name for e in os.scandir(here / d) if e.is_file())
            except OSError:
                continue
            k, p = _models_in(top, here / d)
            found["keras"] += k
            found["pt"] += p
        dirs[:] = [d for d in dirs if d not in pruned]
    return found


def show_tree(base, depth=3):
    base = Path(base)
    for dp, dirs, files in os.walk(base):
        rel = Path(dp).relative_to(base)
        if len(rel.parts) >= depth:
            dirs[:] = []
        dirs[:] = sorted(d for d in dirs if d not in PRUNE and d not in SPLITS)
        print("  " * len(rel.parts) + (rel.name or str(base)) + "/", f"({len(files)} files)" if files else "")


def _crops_info(path):
    """(has v3 crops, manifest rows, v3 rows), counted from each row's `file` field."""
    rows = v3 = 0
    with open(Path(path) / "manifest.jsonl", encoding="utf-8") as fh:
        for line in fh:
            if not line.strip():
                continue
            try:
                f = json.loads(line).get("file", "")
            except ValueError:
                continue
            rows += 1
            v3 += "_v3_" in f
    return v3 > 0, rows, v3


def _sheets_info(path):
    """(has GEN-V3 sheets, number of sheets) from split.json; falls back to counting labels."""
    sj = Path(path) / "split.json"
    if sj.exists():
        ids = list(json.loads(sj.read_text(encoding="utf-8")))
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


def _is_junction(p):
    if hasattr(os.path, "isjunction"):      # Python 3.12+
        return os.path.isjunction(p)
    if os.name != "nt":
        return False
    try:
        return bool(os.lstat(p).st_file_attributes & 0x400) and not os.path.islink(p)      # FILE_ATTRIBUTE_REPARSE_POINT
    except (OSError, AttributeError):
        return False


def link(src, dest):
    """Symlink on Linux (Kaggle). Windows without symlink rights falls back to a junction. An existing link at dest is
    replaced (only the link is removed, never the folder it points to); a real folder at dest is refused."""
    src = Path(src).resolve()
    if not src.is_dir():
        raise NotADirectoryError(f"link source {src} is not a folder")
    dest = Path(dest)
    dest.parent.mkdir(parents=True, exist_ok=True)
    if dest.is_symlink():
        dest.unlink()
    elif _is_junction(dest):
        os.rmdir(dest)      # removes the junction itself, not the target's contents
    elif dest.exists():
        raise FileExistsError(f"{dest} exists and is a real folder, refusing to delete it")
    try:
        os.symlink(src, dest, target_is_directory=True)
    except OSError:
        if os.name != "nt":
            raise
        r = subprocess.run(["cmd", "/c", "mklink", "/J", str(dest), str(src)], capture_output=True, text=True)
        if r.returncode != 0:
            raise OSError(f"mklink /J {dest} {src} failed ({r.returncode}): {(r.stderr or r.stdout).strip()}")


def free_gpu():
    """Release cached GPU memory held by TensorFlow and PyTorch between phases."""
    import gc
    gc.collect()
    tf = sys.modules.get("tensorflow")      # only frameworks already loaded: importing one here would grab the GPU
    if tf is not None:
        try:
            tf.keras.backend.clear_session()
            tf.keras.mixed_precision.set_global_policy("float32")   # Part A trains in mixed_float16; inference after it does not need it
            gc.collect()
        except Exception as e:
            print(f"free_gpu: tensorflow cleanup failed: {type(e).__name__}: {e}")
    torch = sys.modules.get("torch")
    if torch is not None:
        try:
            if torch.cuda.is_available():
                torch.cuda.empty_cache()
        except Exception as e:
            print(f"free_gpu: torch cleanup failed: {type(e).__name__}: {e}")


def restore(patterns, dest, search_dirs):
    """Copy model files saved earlier (previous session or any attached dataset) into `dest`: every file matching a pattern
    in any search dir is copied when dest has no file of that name or an older one (mtime), so the newest copy wins.
    Search dirs are visited in sorted order. Returns the search dirs something was copied from."""
    dest = Path(dest)
    dest.mkdir(parents=True, exist_ok=True)
    dest_real = dest.resolve()
    used = []
    for d in sorted({Path(d) for d in search_dirs}, key=str):
        if not d.is_dir() or d.resolve() == dest_real:
            continue
        for pat in patterns:
            for hit in sorted(d.glob(pat)):
                if not hit.is_file():
                    continue
                target = dest / hit.name
                if not target.exists() or hit.stat().st_mtime > target.stat().st_mtime:
                    shutil.copy2(hit, target)
                    if str(d) not in used:
                        used.append(str(d))
    return used


def bundle(save_dir, extra_dirs, notebooks, out_dir, out_zip):
    """Zip models + outputs (never datasets) for download. extra_dirs: {zip subfolder: source folder}.
    out_dir is wiped first, so it must not overlap save_dir or any source, and out_zip must lie outside it."""
    import zipfile
    save_dir, out_dir, out_zip = Path(save_dir).resolve(), Path(out_dir).resolve(), Path(out_zip).resolve()

    def overlap(a, b):
        return a == b or a in b.parents or b in a.parents

    for src in [save_dir, *(Path(s).resolve() for s in extra_dirs.values())]:
        if overlap(out_dir, src):
            raise ValueError(f"bundle folder {out_dir} overlaps source {src}; it would be deleted or copied into itself")
    if out_dir in out_zip.parents:
        raise ValueError(f"zip {out_zip} must not be inside the bundle folder {out_dir}")
    if out_dir.exists():
        shutil.rmtree(out_dir)
    out_dir.mkdir(parents=True)
    for sub in ("models", "outputs"):
        if (save_dir / sub).exists():
            shutil.copytree(save_dir / sub, out_dir / sub, symlinks=True)
    for sub, src in extra_dirs.items():
        if Path(src).exists():
            shutil.copytree(src, out_dir / sub, symlinks=True, dirs_exist_ok=True)
    for nb_path in notebooks:
        if Path(nb_path).exists():
            shutil.copy2(nb_path, out_dir / Path(nb_path).name)
    if not any(p.is_file() for p in out_dir.rglob("*")):
        raise FileNotFoundError(f"nothing to bundle: no models/ or outputs/ in {save_dir}, no extra folder or notebook found")
    with zipfile.ZipFile(out_zip, "w", zipfile.ZIP_DEFLATED) as zf:
        for path in out_dir.rglob("*"):
            if path.is_file():
                zf.write(path, path.relative_to(out_dir))
    return out_zip
