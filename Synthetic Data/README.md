# Synthetic SLD Corpus

Machine-generated single-line diagrams with **exact** ground-truth graphs and matched telemetry. Because the graph is the *input* to rendering, the annotation is perfect and free — this is the development set described in §9.2 of [`../plan.md`](../plan.md).

**Current batch: 10 plants.** Drawings follow IEEE Std 315 / ANSI Y32.2 symbol conventions (rendered by [Schematex](https://schematex.js.org/docs/sld) 1.1.0). Telemetry reproduces the schema and behaviour of `../Electric Sample Data/data` exactly.

---

## Layout

```
PLANT-XX/
  drawings/
    plant.sld       Schematex DSL source — the generative specification
    plant.svg       vector render
    plant.png       raster render at 2x (for CV models)
  graph/
    graph.json      full ground truth (see below)
    nodes.csv       flat node table
    edges.csv       flat edge table
  data/
    meter_trends.csv    30 days @ 1-minute, per meter
    sensor_register.csv sensor tag -> units
    switch_states.csv   breaker configuration log
manifest.json       corpus index
_tools/             generator and verifier
```

## The ten plants

| ID | Plant | Nodes | Edges | Meters | System |
|---|---|---|---|---|---|
| PLANT-01 | Chiller plant LV distribution (closest to the reference drawing) | 58 | 57 | 7 | 13.8 kV → 480Y/277 V |
| PLANT-02 | Data centre critical power (utility + generator + UPS) | 57 | 56 | 7 | 13.8 kV → 480Y/277 V |
| PLANT-03 | Water treatment pump station (dual incomer, one bus) | 50 | 49 | 6 | 11 kV → 400Y/230 V |
| PLANT-04 | Primary substation (recloser, sectionalizer, fuse, arrester) | 27 | 26 | 5 | 138 kV → 13.8 kV |
| PLANT-05 | Manufacturing plant (capacitor bank, harmonic filter) | 72 | 71 | 8 | 13.8 kV → 480Y/277 V |
| PLANT-06 | Hospital normal/essential branches | 54 | 53 | 7 | 11 kV → 400Y/230 V |
| PLANT-07 | Campus solar + battery storage (3 parallel sources) | 44 | 43 | 7 | 13.8 kV → 480Y/277 V |
| PLANT-08 | Cement mill MV drives (three-winding transformer) | 33 | 32 | 5 | 33 kV → 6.6 kV |
| PLANT-09 | Airport terminal (largest sheet) | 81 | 80 | 8 | 22 kV → 400Y/230 V |
| PLANT-10 | Cold storage with standby generation | 64 | 63 | 7 | 11 kV → 400Y/230 V |

Variation is deliberate and spans source type (utility / generator / solar / UPS), transformer winding configuration, bus count and tie arrangement, protection devices, load mix, sheet size (1230×991 to 3032×1209) and visual density.

---

## `graph.json`

### Nodes

```jsonc
{
  "id": "MTR-1191",              // equipment tag, as printed
  "dsl_id": "f1l1m",             // internal id in plant.sld
  "type": "motor",               // Schematex symbol type (closed vocabulary)
  "class": "motor",              // coarse detection class
  "role": "motor",               // role in the power system
  "attributes": { "rating": "22 kW / CHWP" },
  "metadata": { "power_kw": 22, "service": "CHILLED-WATER PUMP", "started_by": "DRV-806" },
  "bbox": [56, 1060, 80, 1084],  // symbol box, SVG user units
  "center": [68, 1072],
  "level": 9,                    // depth from source
  "text_labels": [
    { "text": "MTR-1191", "role": "id", "bbox": [87.23, 1109, 147.39, 1123],
      "font_size": 11, "placement": "side" }
  ]
}
```

**`attributes` vs `metadata` matters.** `attributes` holds only values that are *printed on the drawing*, so the graph is fully recoverable from the image — `verify.mjs` asserts every one of them appears in that node's rendered text. `metadata` holds semantics that are **not** drawn (service names, bus section, ANSI device numbers, CT ratios). Use `attributes` when scoring extraction; `metadata` is for analytics and for linking nodes to telemetry.

### Edges

```jsonc
{
  "id": "E005",
  "source": "TA-728", "target": "PM-1042",
  "relationship": "measurement",        // power | measurement | protection
  "line_style": "dashed",               // solid power path vs dashed measurement link
  "net": "3",                           // electrical net id — nodes on one net are common
  "polyline": [[356.06,372],[356.06,384],[1403.65,384],[1403.65,434]]
}
```

### Also included

- **`junctions`** — every filled junction dot with its bounding box. The "filled dot = connection, bare crossing = no connection" convention is live in these drawings: wires that cross without a dot are drawn with a clearance gap and produce **no** edge.
- **`switch_states`** — the permitted switching configurations (the "PERMITTED SWITCH CONFIGURATIONS" table on a real sheet), each breaker marked open/closed.
- **`meters`** — which meter measures which equipment, linking the graph to the CSVs.
- **`counts`**, **`image`** (dimensions and `png_scale`), **`system`** (voltages, frequency, timezone).

Coordinates are SVG user units. Multiply by `image.png_scale` (2) for pixel coordinates in `plant.png`.

---

## Telemetry

Schema and semantics are identical to the supplied reference dataset, so anything written against it works here unchanged:

- `energy_kwh` is a **cumulative register**, advanced by `kw/60` each minute, and it freezes while a meter reads zero.
- A **de-energised bus reports `voltage_ll_v = 0`**.
- An **open incomer on a bus back-fed through the tie reports 0 kW at nominal volts** — it sees voltage but carries no power.
- An incomer carries the **sum of the feeders it supplies** plus unmetered section load, so Kirchhoff energy-balance checks close (within metering noise). This is what makes the §8 energy-balance validation possible.
- Feeder meters hold a **fixed power factor**; incomer power factor is **derived** from the summed kW/kvar.
- `pf` is blank exactly when kVA is zero; `MISSING` rows blank every measurement.
- Each plant contains 1–2 **planned switchover events** (S0 → S1 open transition → S2 → back) and a few comms dropouts.

Roughly 2.9 M rows across the corpus, 512 MB total.

---

## Regenerating

```bash
cd _tools
npm install

node generate.mjs                # full corpus
node generate.mjs PLANT-01       # one plant
node generate.mjs --no-data      # drawings and graphs only (fast)
node generate.mjs --days 7       # shorter telemetry window

node verify.mjs                  # self-test every plant
```

Generation is fully deterministic — each plant's `seed` in `_tools/plants.mjs` fixes its tag numbers, load profiles and switching events, so a regeneration reproduces byte-identical output. Adding plants means appending a spec to `plants.mjs`; nothing else needs to change.

## What `verify.mjs` checks

1. **Recoverability** — every ground-truth attribute is printed on the drawing; every node has a bounding box; no label falls outside the canvas.
2. **Electrical validity** (the §4.3 rule set) — every load traces back to a source, the power path is acyclic, motors sit behind a protective device, measurement links run CT→meter and are genuinely dashed in the SVG, and every meter has a CT association.
3. **Telemetry consistency** — meters in the CSVs match the graph, switch-state columns match the declared breakers, the first logged row matches state S0, `kVA = hypot(kW, kvar)`, current agrees with kVA and voltage, and the energy register never decreases.

All 10 plants currently pass with zero issues.

---

## Known limitation

These renders are clean and programmatic. They do **not** reproduce scan noise, skew, JPEG artefacts, hand annotation or vendor drafting style — that is precisely the synthetic-to-real gap RQ4 measures. An augmentation pass belongs before the transfer evaluation, not in the generator.
