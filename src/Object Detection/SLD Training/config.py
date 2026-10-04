"""Paths and constants for full-sheet detection + graph recovery.

Pipeline (after AITEE / CircuitNet): detect symbols, junctions and text on the whole
sheet with YOLO, mask the boxes out, trace the remaining ink as wires, group wires into
nets, and turn nets into edges between the components they touch.
"""
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[3]
DATA_ROOT = REPO_ROOT / "Data"
SYNTHETIC_DIR = REPO_ROOT / "Synthetic Data"          # generator output; source of the sheets
SHEETS_DIR = DATA_ROOT / "sld-sheets"                  # YOLO dataset built by build_sld_dataset.py
DATA_YAML = SHEETS_DIR / "data.yaml"
GRAPHS_DIR = SHEETS_DIR / "graphs"                     # ground-truth graph.json per sheet (pixel boxes added)

RUN_DIR = Path(__file__).resolve().parent
MODEL_DIR = RUN_DIR / "models"
OUTPUT_DIR = RUN_DIR / "outputs"

# Detector classes = every symbol type that occurs in the corpus, in components.mjs order,
# plus the two non-symbol classes the wire tracer needs. Written to data.yaml by the builder.
SYMBOL_ORDER = [
    "utility", "generator", "solar", "wind", "ups",
    "transformer", "transformer_dy", "transformer_yd", "transformer_yy", "transformer_dd",
    "autotransformer", "transformer_3winding",
    "bus", "bus_tie", "hub",
    "breaker", "breaker_vacuum", "switch", "switch_load", "contactor", "ground_switch",
    "ats", "recloser", "sectionalizer", "fuse", "fuse_cl",
    "ct", "pt", "relay", "surge_arrester", "ground_fault", "rcd",
    "motor", "load", "capacitor_bank", "harmonic_filter", "vfd",
    "watthour_meter", "demand_meter", "consumer_unit",
]
JUNCTION_CLASS = "junction"
TEXT_CLASS = "text"
# Fixed detector class list (ids never depend on which types a build happens to contain).
DETECTOR_CLASSES = SYMBOL_ORDER + [JUNCTION_CLASS, TEXT_CLASS]

# Split: the ten hand-authored PLANT-* sheets are the closest to the real drawing, so they
# are test only when present. Bulk GEN-* sheets go 85 / 10 / 5 into train / val / test by a stable
# hash of their structure (node-type multiset + edge kinds), so sheets that share a topology
# signature never straddle splits; `--split-by id` restores the old per-sheet-id hash.
VAL_FRACTION = 0.10
TEST_FRACTION = 0.05
TEST_PREFIX = "PLANT-"

# Detector
IMG_SIZE = 1280
EPOCHS = 60
BATCH = 8
MODEL_WEIGHTS = "yolov8s.pt"
CONF = 0.25
IOU_NMS = 0.6

# Wire tracer (pixels at png_scale 2; the SVG draws wires 1.4 wide, dashes 5 on / 4 off, crossings with a 5-wide clearance)
INK_THRESHOLD = 160        # gray below this is ink
BOX_PAD = 3                # dilate symbol boxes before masking so the outline goes too
TOUCH_PAD = 5              # a wire "touches" a component if it comes within this many px of its box
DASH_BRIDGE = 11           # closing length: bridges dash gaps (8 px) but not crossing clearances (10 px + perpendicular ink)
MIN_WIRE_PX = 12           # drop ink blobs shorter than this after masking (stray glyphs)
DASHED_INK_FRACTION = 0.85 # ink coverage along a traced path below this = dashed = measurement edge

# Graph scoring
MATCH_IOU = 0.5
