from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[3]
DATA_DIR = REPO_ROOT / "component-symbols"
MANIFEST_PATH = DATA_DIR / "manifest.jsonl"
CLASSES_PATH = DATA_DIR / "classes.txt"

IMG_SIZE = (128, 128)
BATCH_SIZE = 32
SEED = 123

EPOCHS = 150
WARMUP_EPOCHS = 5
EARLY_STOP_PATIENCE = 20
FREEZE_EPOCHS = 10  # backbone runs: head-only warmup before unfreezing

DEFAULT_HP = dict(
    learning_rate=1e-3,
    weight_decay=1e-4,
    dropout=0.4,
    width=32,
    label_smoothing=0.1,
    mixup_alpha=0.2,
)
EMA_MOMENTUM = 0.99

BACKBONES = ("efficientnetv2b0", "mobilenetv3small", "convnexttiny")

# geometric: 0.03 of a turn is about ±11°; symbols already come in 0/90/180/270 so only jitter
ROTATION = 0.03
ZOOM = 0.1
TRANSLATION = 0.08
CONTRAST = 0.3
# scan degradation: stand-in for photographed / photocopied real sheets
NOISE = 0.08
BLUR = 1.5
ERASE = 0.25

TUNE_MAX_EPOCHS = 30
TUNE_FACTOR = 3
TTA_PASSES = 8

RUN_DIR = Path(__file__).resolve().parent
MODEL_DIR = RUN_DIR / "models"
OUTPUT_DIR = RUN_DIR / "outputs"
LOG_DIR = RUN_DIR / "logs"
