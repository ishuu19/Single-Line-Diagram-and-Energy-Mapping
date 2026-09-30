"""Run a notebook on Kaggle's GPUs from this machine.

    python src/kaggle_runner/run.py sld-pipeline            # push, wait, download output
    python src/kaggle_runner/run.py sld-pipeline --no-wait  # push only
    python src/kaggle_runner/run.py sld-pipeline --status   # check a running kernel
    python src/kaggle_runner/run.py sld-pipeline --fetch    # download output of the last run

Jobs are defined in jobs.json. Credentials come from src/kaggle_runner/.env or the repo-root .env.
"""
import argparse
import json
import os
import shutil
import subprocess
import sys
import time
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
BUILD = HERE / "_build"      # staged kernel folder, git-ignored
OUT = HERE / "output"        # downloaded results, git-ignored


def load_env():
    # Runner folder first, then repo root. setdefault keeps a value already in the environment.
    for env_file in (HERE / ".env", ROOT / ".env"):
        if not env_file.exists():
            continue
        for line in env_file.read_text(encoding="utf-8").splitlines():
            line = line.strip()
            if line and not line.startswith("#") and "=" in line:
                k, v = line.split("=", 1)
                os.environ.setdefault(k.strip(), v.strip().strip("\"'"))
    if not (os.environ.get("KAGGLE_API_TOKEN") or (os.environ.get("KAGGLE_USERNAME") and os.environ.get("KAGGLE_KEY"))):
        sys.exit("No Kaggle credentials: put KAGGLE_API_TOKEN (or KAGGLE_USERNAME + KAGGLE_KEY) in src/kaggle_runner/.env or .env at the repo root.")


def kaggle(*args, check=True):
    # `python -m kaggle` works when the Scripts folder is not on PATH (typical on Windows).
    r = subprocess.run([sys.executable, "-m", "kaggle", *args], text=True, capture_output=True)
    if check and r.returncode:
        sys.exit(f"kaggle {' '.join(args)} failed:\n{r.stdout}{r.stderr}")
    return (r.stdout + r.stderr).strip()


def username():
    if os.environ.get("KAGGLE_USERNAME"):
        return os.environ["KAGGLE_USERNAME"]
    from kaggle.api.kaggle_api_extended import KaggleApi
    api = KaggleApi()
    api.authenticate()
    return api.config_values.get("username") or sys.exit("Set KAGGLE_USERNAME in .env (needed for the kernel slug).")


def stage(job, user):
    nb = ROOT / job["notebook"]
    if not nb.exists():
        sys.exit(f"notebook not found: {nb}")
    if any("REPLACE" in d for d in job["datasets"]):
        sys.exit("Edit jobs.json: replace the placeholder dataset slug with your component-crops dataset (owner/name).")
    shutil.rmtree(BUILD, ignore_errors=True)
    BUILD.mkdir(parents=True)
    shutil.copy(nb, BUILD / nb.name)
    (BUILD / "kernel-metadata.json").write_text(json.dumps({
        "id": f"{user}/{job['slug']}",
        "title": job["title"],
        "code_file": nb.name,
        "language": "python",
        "kernel_type": "notebook",
        "is_private": True,
        "enable_gpu": job.get("gpu", True),
        "enable_internet": job.get("internet", True),
        "dataset_sources": job["datasets"],
        "competition_sources": [],
        "kernel_sources": [],
    }, indent=2), encoding="utf-8")
    return f"{user}/{job['slug']}"


def status(ref):
    return kaggle("kernels", "status", ref, check=False)


def wait(ref, poll=60):
    while True:
        s = status(ref)
        print(time.strftime("%H:%M:%S"), s, flush=True)
        low = s.lower()
        if "complete" in low:
            return True
        if "error" in low or "cancel" in low or "fail" in low:
            return False
        time.sleep(poll)


def fetch(ref, name):
    dest = OUT / name
    dest.mkdir(parents=True, exist_ok=True)
    print(kaggle("kernels", "output", ref, "-p", str(dest)))
    print("saved to", dest)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("job", help="key in jobs.json")
    ap.add_argument("--no-wait", action="store_true", help="push and return")
    ap.add_argument("--status", action="store_true")
    ap.add_argument("--fetch", action="store_true")
    ap.add_argument("--poll", type=int, default=60, help="seconds between status checks")
    a = ap.parse_args()

    load_env()
    jobs = json.loads((HERE / "jobs.json").read_text(encoding="utf-8"))
    if a.job not in jobs:
        sys.exit(f"unknown job {a.job!r}; have {list(jobs)}")
    job = jobs[a.job]
    user = username()
    ref = f"{user}/{job['slug']}"

    if a.status:
        print(status(ref))
    elif a.fetch:
        fetch(ref, a.job)
    else:
        ref = stage(job, user)
        print(kaggle("kernels", "push", "-p", str(BUILD)))
        if not a.no_wait:
            ok = wait(ref, a.poll)
            fetch(ref, a.job)
            sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
