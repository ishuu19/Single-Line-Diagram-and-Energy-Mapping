# Single-Line Diagram and Energy Mapping

Final-year project on recovering an electrical graph from a single-line diagram, then using that graph for spatial-temporal energy analytics.

A single-line diagram is the authoritative record of how power flows through a building, but it is almost always a picture. This project turns that picture into a typed graph — equipment, power paths, measurement links, and control wiring — and tests whether the recovered graph is good enough for forecasting, switching studies, and energy-balance checks.

The full research design is in [`plan.md`](plan.md).

## Research questions

| | Question |
|---|---|
| RQ1 | How much of a diagram can a multimodal model recover from the image alone? |
| RQ2 | Can circuit-recognition models built for small schematics handle a full industrial distribution drawing? |
| RQ3 | Does detection plus OCR plus line tracing, followed by reasoning over that structure, beat reading the image end to end? |
| RQ4 | Does a system built on synthetic diagrams transfer to real industrial drawings? |

## Repository

This repository holds the research plan and project notes. The drawings, graphs, telemetry, and symbol crops are not stored here.

| Path | Contents |
|---|---|
| [`plan.md`](plan.md) | Research questions, metrics, pipeline, dataset design, and definition of done |
| [`docs/STATUS.md`](docs/STATUS.md) | What is done and what is next |
| [`docs/MAP.md`](docs/MAP.md) | Where to look for each task |
| [`docs/detection.md`](docs/detection.md) | Public detector datasets and how they will be used |
| [`docs/LOG.md`](docs/LOG.md) | Decision log |

## Data

Download the dataset and place these three folders next to this README:

- `Electric Sample Data/` — real evaluation sheets and matched telemetry. Held out until the final transfer test.
- `Synthetic Data/` — generated development corpus: drawings, ground-truth graphs, telemetry, and the generator in `_tools/`.
- `component-symbols/` — isolated symbol crops for detector training.

**Drive link:** _to be added._

Each synthetic plant looks like this:

```
PLANT-01/  or  GEN-0001/
  drawings/   plant.sld    generative spec
              plant.svg    vector drawing
              plant.png    raster drawing
  graph/      graph.json   ground-truth nodes, typed edges, boxes
              nodes.csv
              edges.csv
  data/       meter_trends.csv
              sensor_register.csv
              switch_states.csv
```

Edges are typed `power`, `measurement`, or `control`. A dashed line is a measurement link. A filled dot is a junction; a bare crossing is not a connection. Score extracted text against `attributes` in `graph.json`. Those are the values printed on the drawing. `metadata` is not drawn.

| Tier | IDs | Plants | Role |
|---|---|---|---|
| Core | `PLANT-01` … `PLANT-10` | 10 | Hand-authored plants, one per topology family. 30 days of 1-minute telemetry. |
| Bulk | `GEN-0001` … | 1,508 usable | Procedural plants for training. 7 days of 1-minute telemetry. |
| Real | four sheets in `Electric Sample Data` | 4 | Test only. Not used for training. |

## Regenerating the synthetic corpus

From `Synthetic Data/`, after `npm install` in `_tools/`:

```bash
node _tools/generate.mjs [--core | --gen] [--no-data] [--days N]
node _tools/verify.mjs [--core | --gen]
node _tools/components.mjs --per 12
```

`generate.mjs` merges into the existing `manifest.json`. `verify.mjs` checks that the drawing, graph, and telemetry still agree. `components.mjs` writes isolated symbol crops into `component-symbols/`.
