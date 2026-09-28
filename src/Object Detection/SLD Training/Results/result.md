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

## The symbol network, layer by layer

This is the network Stage A fits. Nothing is loaded from a pretrained model. Stage B is a different network, YOLOv8s, and its layers are not this stack.

A crop enters as one grayscale picture, 128 by 128, one channel. Ink is bright. Paper is near zero. The values are still on the 0 to 255 scale. The sizes below are height, width, and depth.

```
128 × 128 × 1
        |
        |   training only — skipped when a crop is scored
        |   turn by about ±11°
        |   zoom by about ±10%
        |   shift by about ±8% of height and of width
        |   contrast by about ±30%
        |   then, on half the batch only:
        |       thicken strokes, blur, add noise, wipe a small rectangle
        |
        v
divide every pixel by 255          still 128 × 128 × 1
        |
        v
-------- block 1, 32 filters --------
convolution 3×3, 32 filters        128 × 128 × 32
batch normalisation
ReLU
convolution 3×3, 32 filters        128 × 128 × 32
batch normalisation
ReLU
max pool 2×2                       64 × 64 × 32
        |
        v
-------- block 2, 64 filters --------
convolution 3×3, 64 filters        64 × 64 × 64
batch normalisation
ReLU
convolution 3×3, 64 filters        64 × 64 × 64
batch normalisation
ReLU
max pool 2×2                       32 × 32 × 64
        |
        v
-------- block 3, 128 filters -------
convolution 3×3, 128 filters       32 × 32 × 128
batch normalisation
ReLU
convolution 3×3, 128 filters       32 × 32 × 128
batch normalisation
ReLU
max pool 2×2                       16 × 16 × 128
        |
        v
-------- block 4, 256 filters -------
convolution 3×3, 256 filters       16 × 16 × 256
batch normalisation
ReLU
convolution 3×3, 256 filters       16 × 16 × 256
batch normalisation
ReLU
max pool 2×2                       8 × 8 × 256
        |
        v
average each of the 256 maps       256 numbers
        |
        v
dropout, drop chance 0.4          training only
dense layer, 256 units
ReLU
dropout, drop chance 0.3          training only
dense layer, one unit per class    no ReLU
        |
        v
one raw score per symbol class
```

The convolution looks at a three-by-three neighbourhood and writes a new value at every pixel. The step is one pixel and the edges are padded, so height and width stay the same. It has no bias of its own. Batch normalisation comes next and is allowed to shift and rescale each filter, using the current batch to recentre the values. ReLU then sets every negative number to zero and leaves every positive number alone. That break is what makes the second convolution useful. Two convolutions with nothing between them would collapse into one. The second convolution, batch normalisation, and ReLU repeat at the same size. Max pooling then keeps the larger value in each two-by-two neighbourhood and steps by two pixels, so height and width are both halved.

After the fourth block the picture is 8 by 8 with 256 filters. Averaging each filter across those 64 places leaves one number per filter. Position inside that small map is discarded. What remains is how strongly each pattern fired.

Dropout runs only in training. It sets a random share of the numbers to zero on each step, a different share every time, so the next layer cannot depend on one particular unit. At scoring time every number is used. The dense layer of 256 units connects every incoming number to every unit, and ReLU is applied again. The last dense layer has one unit for each symbol class and no ReLU. Its outputs are raw scores. The loss turns those scores into class probabilities. The reported class is the unit with the largest score.

On a GPU the convolutions may run in 16-bit precision. The last layer stays in 32-bit precision so those scores are not rounded away.

The setup around this stack, for the 15-epoch Kaggle fit, is as follows. Mixup blends each training batch with a reversed copy of itself before any of the layers above see it. Geometry and degradation then run inside the network, and only on the training path. Validation crops are inverted, padded to 128 by 128, and scored with those layers switched off. The batch size is 32. Classes are weighted so a rarer symbol still pulls on the loss. The optimiser is AdamW with weight decay 0.0001. The loss is categorical cross-entropy on the raw scores, with label smoothing 0.1. The learning rate rises to 0.001 over the first 5 epochs and then falls to zero on a cosine curve over the rest of the 15 epochs. Accuracy and top-3 accuracy are the recorded metrics. The weights kept as the best model are the ones with the highest validation accuracy.

### Side view

The same network across the page. Each column is one stage, in the order a crop passes through them. The line under the names is the main operation of that stage, the two lines below it are what repeats inside the four blocks, and the last line is the size that leaves the column.

```
input        -> augment      -> scale        -> block 1      -> block 2      -> block 3      -> block 4      -> average      -> head         -> scores
grayscale       train only      ÷ 255           conv 32 ×2      conv 64 ×2      conv 128 ×2     conv 256 ×2     over 8×8        dense 256       pick largest
                                                BN + ReLU       BN + ReLU       BN + ReLU       BN + ReLU                       dropout
                                                pool 2×2        pool 2×2        pool 2×2        pool 2×2
128×128×1       128×128×1       128×128×1       64×64×32        32×32×64        16×16×128       8×8×256         256             256             per class
```

`conv 32 ×2` means the three-by-three convolution, batch normalisation and ReLU run twice at 32 filters before the pooling step. The augment column is skipped when a crop is scored. Each block halves the height and width and doubles the depth, so the picture goes from 128 pixels and 1 channel to 8 pixels and 256 channels; the average then drops position and leaves 256 numbers.
