# Detection datasets

Decided 2026-09-26. Do not re-search this unless the user asks for new datasets.

## Goal

Train an object detector on symbols, then recover the graph (Stage 2 / Stage 3 in `plan.md`). The target vocabulary is IEEE 315 single-line symbols in `component-symbols/classes.txt`, not textbook resistor–capacitor circuits.

## CircuitNet

[aaanthonyyy/CircuitNet](https://github.com/aaanthonyyy/CircuitNet) classifies five hand-drawn electronics crops (R, C, L, V, I), then builds a netlist with classical image processing. Its data is ~3,191 crops from [mahmut-aksakalli/circuit_recognizer](https://github.com/mahmut-aksakalli/circuit_recognizer). Those are classification images, not boxes on a sheet. The other "CircuitNet" ([circuitnet/CircuitNet](https://github.com/circuitnet/CircuitNet)) is a chip-layout dataset and is unrelated.

## Use

| Dataset | Why | Get |
|---|---|---|
| CGHD | 1,152 photos, ~48k boxes, 62 classes including transformer, motor, switch, relay, fuse, junction, crossover, text. CC0. | [Hugging Face](https://huggingface.co/datasets/lowercaseonly/cghd), [Kaggle](https://www.kaggle.com/datasets/johannesbayer/cghd1152), [GitHub](https://github.com/DFKI/cghd). Paper arXiv:2107.10373 |
| CircuitHub9K | 9,754 schematics, 234k boxes, 25 classes including transformer, motor, switch, fuse, meters, generator. Academic, non-commercial. | [GitHub](https://github.com/360AILAB-NLP/CircuitPile-9k) |
| AITEE | Small vocabulary, but the pipeline to copy: YOLOv8, mask boxes, trace wires, cluster nodes. Apache 2.0. | [CKnievel/aitee-dataset](https://github.com/CKnievel/aitee-dataset) |
| Digitize-HCD | Terminal heatmaps (where a wire attaches). 16 electronics symbols + crossover. CC BY 4.0. | [Mendeley rngcz5wtv8](https://data.mendeley.com/datasets/rngcz5wtv8/2) |

Textbook extras only: [circuit(1k)](https://www.kaggle.com/datasets/mohammadkawsar/circuit1k), [LAD021/ci2n_datasets](https://github.com/LAD021/ci2n_datasets), [hanky2397/schematic_images](https://huggingface.co/datasets/hanky2397/schematic_images).

Skip LibreYOLO/circuit-elements (PCB photos) and the Figshare 15-class substation set (photos of equipment). SLED and the PETRONAS ESC-YOLOv8 single-line sets are not public downloads.

## Training split

1. Pretrain on CGHD and CircuitHub9K for line-drawing symbols, junctions, crossovers, and text.
2. Fine-tune on synthetic plants. `graph.json` already has `type` and `bbox`.
3. Hold `Electric Sample Data` out for the transfer test.
4. Our graphs also need power / measurement / control edges. None of the public sets label those.

Our own crops (IEEE 315, with nameplate text) are produced by `node components.mjs` in `Synthetic Data/_tools/`. That is the set that actually matches the drawings.

**Held-out component test set (not Schematex):** `build_cghd_test_crops.py` exports mapped CGHD symbol crops into `component-symbols-test/` (`split: test` only). Class mapping is in `cghd_to_sld.json` (transformer, motor, switch, relay, fuse, ct, pt, etc.). Full export needs the CGHD images on disk (Hugging Face cache with `HF_TOKEN`, Kaggle `johannesbayer/cghd1152`, or DFKI clone).
