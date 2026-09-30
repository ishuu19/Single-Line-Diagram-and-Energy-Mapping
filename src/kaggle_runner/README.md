# Kaggle runner

Run a notebook on Kaggle's GPU from this machine: stage it, push it through the Kaggle API, wait, download the output.

## Setup (once)

1. `pip install -r src/kaggle_runner/requirements.txt`
2. kaggle.com > Settings > API > generate a token.
3. Credentials go in `src/kaggle_runner/.env` or the repo-root `.env` (both git-ignored), using `.env.example` as the template:
   `KAGGLE_API_TOKEN=...` and `KAGGLE_USERNAME=<your kaggle username>`
   (legacy key: `KAGGLE_USERNAME` + `KAGGLE_KEY`).
4. `jobs.json` already attaches `anayedeshan/sld-component-dataset`, `anayedeshan/sld-full-sheets`, and `anayedeshan/sld-computer-made-test`. Add another notebook as a new entry.
5. Kaggle needs a phone-verified account for GPU and Internet in API-run kernels.

## Use

```
python src/kaggle_runner/run.py sld-pipeline              # push, poll, download to src/kaggle_runner/output/sld-pipeline/
python src/kaggle_runner/run.py sld-pipeline --no-wait    # push only
python src/kaggle_runner/run.py sld-pipeline --status
python src/kaggle_runner/run.py sld-pipeline --fetch
```

The notebook clones this repo from GitHub inside Kaggle, so **push your commits first**. Add more notebooks as new entries in `jobs.json`. Kernels are created private. Everything the notebook writes to `/kaggle/working` (models, `sld_pipeline_artifacts.zip`) comes back in `output/`.
