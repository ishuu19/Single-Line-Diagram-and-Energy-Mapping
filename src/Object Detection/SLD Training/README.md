# SLD Training

Full-sheet detection and graph recovery: find every symbol, junction and text label on a whole single-line diagram, then trace the wires into nodes, edges and nets. This is Stage 2 / 3 of `plan.md`. The isolated-crop classifier in `../Component Training/` is a separate check on symbol appearance; this folder works on entire sheets.

Pipeline copied from AITEE and CircuitNet (see `docs/detection.md`, `docs/Inspired/`): **detect → mask boxes → trace wires → cluster nets → edges**.

## Files

| File | Role |
|---|---|
| `config.py` | Paths (`Data/sld-sheets`), detector classes, split fractions, YOLO and tracer constants |
| `build_sld_dataset.py` | Synthetic plants → YOLO dataset. Boxes from `graph.json` (bus box taken from the SVG bar), junction dots, text labels. Adds the SVG→PNG y offset to the graph copies |
| `sld_data.py` | data.yaml / label / graph readers, `to_px` coordinate transform, ground-truth detections |
| `wires.py` | Image + boxes → nets and edges (see below) |
| `graph_eval.py` | Node / edge / edge-type / net scores against `graph.json`. `--pred DIR` scores detector output, no flag scores the tracer with ground-truth boxes |
| `train_sld.py` | ultralytics YOLOv8 training wrapper; copies `best.pt` to `models/sld_<weights>.pt` |
| `predict_graph.py` | Detector + tracer → predicted graph per sheet |
| `viz.py` | Draw boxes and recovered edges on a sheet |
| `reclassify.py` | Re-labels each detected symbol crop with the Component Training classifier (66 types); imports that folder's modules without clobbering this one's `config` |
| `notebooks/kaggle_sld_pipeline.ipynb` | **Main Kaggle runner.** Stage A trains / evaluates the component classifier, Stage B trains the sheet detector, traces wires and re-labels crops with Stage A; both models saved under `/kaggle/working/sld_pipeline/models` for reuse (`COMP_EPOCHS = 0` / `SLD_EPOCHS = 0` skip training and reuse) |
| `notebooks/kaggle_sld_training.ipynb` | Stage B only |

## Dataset

```bash
python build_sld_dataset.py            # Synthetic Data/GEN-* → Data/sld-sheets (≈130 MB)
```

Split by structure (hash of sorted node types and edge relationships), so a plant and its same-topology twins land in one split: 85 % train, 10 % val, 5 % test; `PLANT-*` sheets are test when present. `--split-by id` restores the old per-sheet hash. Classes are fixed: all 40 `SYMBOL_ORDER` types plus `junction` and `text` (nc 42), whether or not a type occurs; `build_info.json` records the split rule. Datasets built before 2026-10-04 use compacted ids and must be rebuilt. Upload `Data/sld-sheets/` to Kaggle as one dataset.

Two facts about the corpus that the code handles and that are easy to get wrong:

- `graph.json` boxes are SVG units; pixels are `(x + x_offset) * 2, (y + y_offset) * 2`. The offset is the title band above the layout, read from the SVG's outer `translate(...)` (12 on the sheets probed, but not guaranteed for horizontal layouts). The builder stores it as `image.y_offset` / `image.x_offset`; `sld_data.from_px` is the inverse.
- A bus node's `bbox` is a 40×40 box at the bar centre. The builder reads the drawn bar from the SVG (`bbox_draw`).

## Wire tracer (`wires.py`)

1. Binarise, blank every symbol and text box (junction dots stay: they are wire pixels).
2. Label ink blobs. Scan rows and columns for small collinear gaps (≤ 13 px) and union the blobs on either side. This closes both dash gaps (8 px) and crossing clearances (10 px); when the ink on the far side is a perpendicular wire, the scan skips over it to the wire's continuation, so bare crossings never connect.
3. Each connected group is a net; its members are the symbols it touches (5 px, second look at 12 px for dashed links that end inside a gap).
4. Power edges: minimum spanning tree over along-the-wire distances between the non-meter members. Measurement edges: each meter pairs with the CT nearest along the wire. Utility–arrester pairs are `protection`.

In these drawings the dashed CT→meter link runs along the power wire down to a junction dot before turning off, and its clearance erases the solid wire under it, so all ink is treated as connectivity and the convention above supplies the edge type.

With ground-truth boxes on 12 sheets: node P/R 1.0, edge precision 0.97, edge recall 0.80, edge type accuracy 1.0, net Jaccard 0.89. Known gaps: two meters drawn on the same spot in some sheets, and bus-tie / hub topologies where the spanning tree picks a shortcut. Tune later.

## Run

```bash
pip install -r requirements.txt
python build_sld_dataset.py
python graph_eval.py --split val --limit 20                   # tracer alone, oracle boxes
python train_sld.py --epochs 60                               # → models/sld_yolov8s.pt
python predict_graph.py --weights models/sld_yolov8s.pt --split test
python graph_eval.py --split test --pred outputs/pred_test
```

Outputs: `runs/sld/` (ultralytics), `models/sld_*.pt`, `outputs/graph_*_<split>.json`, `outputs/pred_<split>/<id>.json`.
