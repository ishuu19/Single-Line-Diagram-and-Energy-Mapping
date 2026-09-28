# How this notebook trains

Two separate fits. Stage A fits a Keras classifier on isolated symbol crops. Stage B fits YOLOv8s on whole sheets. The notebook sets `COMP_EPOCHS = 15` and `SLD_EPOCHS = 60` and calls the scripts below; it does not build either dataset.

## Stage A — symbol classifier

Entry: `Component Training/train.py --epochs 15`. No `--backbone`, so the custom CNN is used and there is no frozen-head warmup.

### What each crop is before `fit`

`data.load_datasets` reads `Data/component-symbols/manifest.jsonl`. Each row is one PNG and one type. `text` is dropped (it is never a crop). There is no `val` split in this set, so the held-out `test` crops are what `fit` validates on.

Per image, `_load_image`:

1. Read the PNG and decode it as 1-channel grayscale.
2. Invert: `255 - pixel`. Ink becomes the high value; paper and padding sit near 0.
3. `resize_with_pad` to `128×128`. Aspect ratio is kept; the pad value matches the inverted background.

Labels are integer class ids, then one-hot over the classes present in the manifest. The train set is shuffled (seed 123), cached, and batched at 32. Validation is the same loader with shuffle and mixup off.

On each training batch, mixup (`mixup_alpha = 0.2`) draws `λ` from Beta(0.2, 0.2) and blends the batch with itself reversed, images and one-hot labels together:

`λ * batch + (1 - λ) * reverse(batch)`

Class weights are `sklearn` `"balanced"` on the train labels and passed into `fit` as `class_weight`.

### What the network does to a batch during `fit`

`model.build_model` (training mode only for the first two stages):

1. **Geometric.** `RandomRotation` of 0.03 turn (~±11°), `RandomZoom` 0.1, `RandomTranslation` 0.08, `RandomContrast` 0.3. Empty pixels are filled with 0.
2. **`RandomDegrade`** (`degrade_prob = 0.5`). Half the batch is left clean so batch-norm still sees clean ink. The other half, in order:
   - 50% chance of a 3×3 max-pool (stride 1) to thicken strokes
   - 50% chance of a 5×5 Gaussian blur, sigma drawn in `[0.3, 1.0]`
   - Gaussian noise with std drawn in `[0, 0.05×255]`
   - 50% chance of a random rectangle erase, up to 25% of height and width
3. **Features.** Divide by 255. Four blocks, width 32, so the filter counts are 32, 64, 128, 256. Each block is two `Conv2D 3×3` (no bias) → `BatchNormalization` → `ReLU`, then `MaxPool 2×2`. Then global average pool. Spatial size goes 128 → 64 → 32 → 16 → 8 → one vector.
4. **Head.** Dropout 0.4 → `Dense(256, relu)` → Dropout 0.3 → `Dense(num_classes)` logits in float32.

On a GPU, `setup()` turns on mixed float16. The head stays float32.

### The `fit` call

`compile_model` uses AdamW (`weight_decay = 1e-4`) and categorical cross-entropy from logits with label smoothing 0.1. Metrics are accuracy and top-3.

The learning rate is a cosine schedule over the 15 epochs: 0 for the start of warmup, linear to `1e-3` across the first 5 epochs, then cosine decay to 0 over the remaining steps (`steps = number of train batches`).

```python
model.fit(train_ds, validation_data=val_ds, epochs=15, class_weight=weights, callbacks=...)
```

Callbacks: early stop on `val_loss` (patience 30, so it does not fire inside 15 epochs), checkpoint `custom_best.keras` on best `val_accuracy`, plus a CSV log and TensorBoard. After `fit`, the last weights are also written to `custom.keras` and the class list to `class_names.json`.

Geometric layers, degrade, and mixup run only on the training path. Validation batches are inverted, padded, and batched, then scored clean.

## Stage B — sheet detector

Entry: `SLD Training/train_sld.train(epochs=60)`.

### What each sheet is before `train`

The Kaggle dataset is the output of `build_sld_dataset.py`, already split. Each sheet is `drawings/plant.png` copied into `images/{train,val,test}/`, plus a YOLO label file. Boxes come from `graph.json`: SVG units → pixels with `png_scale = 2` and a y shift of `image.y_offset` (the title band, 12 units). A bus uses the drawn bar from the SVG, not the 40×40 centre box. Junctions and text labels are extra classes. One label line is `class_id cx cy w h`, all normalised to the PNG.

`train_sld` rewrites `data.yaml` so `path` is the absolute dataset folder, then loads `yolov8s.pt` (COCO pretrained) and calls ultralytics `train`.

### What `train` does to each sheet

```python
net.train(
    data=..., epochs=60, imgsz=1280, batch=8,
    fliplr=0.0, flipud=0.0, degrees=0.0,
    scale=0.2, mosaic=1.0, close_mosaic=10,
    hsv_h=0.0, hsv_s=0.0, hsv_v=0.2,
)
```

Ultralytics owns the loop. For these arguments, each step is:

1. Letterbox the sheet to `1280×1280` (aspect kept, padded).
2. For the first 50 epochs, mosaic four sheets into one training image (`mosaic=1.0`). The last 10 epochs turn mosaic off (`close_mosaic=10`) and train on single letterboxed sheets.
3. Scale jitter of 0.2. Value (brightness) jitter of 0.2. No horizontal flip, no vertical flip, no rotation, no hue, no saturation — the drawings are axis-aligned and the ink colour is not a signal.
4. YOLOv8s detection loss (box, class, DFL) on the mosaic or letterboxed image. This script does not replace the loss or the optimizer.
5. Batch size 8. Best weights by the ultralytics fitness score are `runs/sld/weights/best.pt`, copied to `models/sld_yolov8s.pt`.

The test split is not in this `train` call. It is only used afterwards, when the notebook runs `model.val(split="test")`.
