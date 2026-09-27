# Graph-Based Spatial-Temporal Analytics for Smart Building Energy Systems

**Final Year Project — Research & Implementation Plan**

---

## 1. Motivation

Every industrial and commercial electrical installation is documented by a **single-line diagram (SLD)**. It is the authoritative record of how power flows from the utility supply, through transformers and switchgear, to the motors, pumps and fans that do the work. It is the first document requested in an arc-flash study, an interconnection application, a commissioning package, or a retrofit design.

The problem is that this document is almost always a **picture**. It exists as a PDF or a scanned drawing. The structure it encodes — that `TX-1659` feeds `CB-351`, which feeds `BUS-462`, which feeds the chilled-water pumps — is immediately obvious to an engineer and completely inaccessible to software.

This matters because the *analytics* layer of a smart building is increasingly graph-shaped. Fault propagation, load disaggregation, topology-aware forecasting, and "what-if" switching studies all need to know **what is connected to what**. Today that graph is rebuilt by hand, per site, by an engineer reading a drawing. It is slow, expensive, and does not scale to a portfolio of buildings.

**The goal of this project is to recover the electrical graph from the drawing automatically, and then show that the recovered graph is good enough to do real spatial-temporal analytics on top of it.**

---

## 2. Research Questions

The project is organised around four questions, in increasing order of ambition.

| # | Research question |
|---|---|
| **RQ1** | How much of an SLD's structure can a general-purpose multimodal LLM recover from the image alone, with minimal prompting? |
| **RQ2** | Can existing circuit/component recognition models, which are built for small schematics, be extended to full industrial distribution diagrams? |
| **RQ3** | Does decomposing the task (object detection + OCR + line detection, then LLM reasoning over the structured output) outperform end-to-end LLM interpretation? |
| **RQ4** | Does a system developed largely on *synthetic* diagrams transfer to *real* industrial drawings? |

RQ4 is the question that makes this a research project rather than an engineering exercise, and it is deliberately the one the experimental design is built to answer.

---

## 3. Problem Definition

The task is **structured prediction**: an image in, a typed attributed directed graph out.

Given a rendered diagram image `I`, produce a graph `G = (V, E)` where:

```jsonc
{
  "nodes": [
    {
      "id": "TX-1659",            // equipment tag as printed on the drawing
      "type": "transformer_dy",   // from a closed vocabulary of symbol classes
      "label": "TX-1659",
      "attributes": {             // nameplate data recovered from the drawing
        "rating": "1500 kVA",
        "voltage": "13.8kV/480Y/277V"
      },
      "bbox": [x0, y0, x1, y1]    // pixel position of the symbol
    }
  ],
  "edges": [
    {
      "source": "TX-1659",
      "target": "CB-351",
      "relationship": "power",    // power | measurement | control
      "attributes": { "cable": "3#2/0 AWG" }
    }
  ]
}
```

Three properties of the output are worth stating explicitly, because they are what make this harder than generic "diagram captioning":

1. **The edge semantics are typed.** A solid line is a power path. A dashed line from a CT to a meter is a *measurement* association, not a power path. A 24 VDC line to a drive terminal is *control*. A system that returns a single undifferentiated "connected to" relation has not solved the problem.
2. **Graphical convention carries meaning.** A filled dot at a line crossing is an electrical junction; an unfilled crossing is two conductors passing over each other with **no** connection. Getting this wrong silently changes the topology.
3. **Identity is shared across sheets.** The same physical device (`TA-724`, `PM-1019`) appears on the distribution sheet *and* the meter-wiring sheet. A complete system must resolve these into one node, not two.

---

## 4. Evaluation Framework

This section is the methodological core of the project. Without it, every result is an anecdote.

### 4.1 Matching predicted nodes to ground truth

Before any metric can be computed, predicted nodes must be aligned with ground-truth nodes. Use a cascade, and **report which tier each match came from**:

1. **Exact tag match** — predicted `id` equals ground-truth `id` after normalisation (case, whitespace, hyphen variants).
2. **Fuzzy tag match** — normalised Levenshtein distance ≤ 0.2, to absorb OCR slips such as `CB-3S1` for `CB-351`.
3. **Spatial match** — for pipelines that emit bounding boxes, IoU ≥ 0.5 with a ground-truth symbol of a compatible class.

Unmatched predictions are false positives; unmatched ground-truth nodes are false negatives.

### 4.2 Metrics

| Level | Metric | What it tells you |
|---|---|---|
| **Component** | Precision / Recall / F1 over nodes | Did it find the equipment? |
| | Per-class F1 (transformer, breaker, bus, CT, meter, VFD, motor, load) | *Which* symbols does it fail on? |
| | Type accuracy on matched nodes | Found the box but called a breaker a switch? |
| **Text** | Tag exact-match accuracy | `MTR-1174` recovered verbatim? |
| | Character Error Rate (CER) | Graceful degradation of near-misses |
| | Attribute F1 (ratings, voltages) | Is `22 kW` preserved and bound to the right node? |
| **Topology** | Edge P/R/F1 (conditioned on both endpoints matching) | Is the wiring right? |
| | Relationship-type accuracy | power vs measurement vs control |
| | **Graph Edit Distance**, normalised | Single summary number for overall structural distance |
| | **Source-reachability accuracy** | For each load, is the traced path back to its supply correct? |
| **Electrical validity** | Rule-violation count | See §4.3 |

**Source-reachability** deserves emphasis. Edge F1 rewards local correctness, but for this domain what actually matters is whether you can answer *"if `CB-351` opens, what goes dark?"* A graph can score 0.9 edge-F1 and still get every such query wrong if the one edge it missed was a bus tie. Define it as: for each load node, compare the ordered set of upstream devices to the supply in the predicted graph against ground truth, and report exact-match rate.

### 4.3 Domain-specific validity checks

These are cheap, they need no ground truth, and they are a genuine contribution — an automated sanity checker for extracted electrical graphs:

- Every load traces back to at least one source.
- No load is energised through two sources simultaneously unless a tie breaker is explicitly closed (no unintended paralleling).
- Transformer primary and secondary voltages are consistent with the buses on each side.
- Every metered feeder has a CT whose ratio is plausible for the breaker rating.
- Motors are downstream of a protective device.
- The graph is acyclic along the power path (ties excepted).

Report these as a **validity rate**. A system that produces electrically *impossible* graphs is unusable even at high F1, and no standard graph metric would catch it.

### 4.4 Baselines and ablations

| Baseline | Purpose |
|---|---|
| Random / degree-prior graph | Establishes the floor |
| OCR-only + spatial heuristic (nearest-neighbour vertical linking) | How much of the task is solved by layout convention alone? |
| Stage 1 LLM, zero-shot | RQ1 |
| Stage 2 existing circuit model | RQ2 |
| Stage 3 hybrid, full | RQ3 |
| Stage 3 minus OCR / minus line detection / minus LLM | Which component carries the performance? |

The ablations matter: if the hybrid pipeline wins but the "minus LLM" variant is within a point of it, the honest conclusion is that the LLM is not doing the work.

---

## 5. Stage 1 — LLM-only baseline

**Objective:** establish how far a multimodal LLM gets on an SLD with *deliberately minimal* instruction.

The point of withholding a detailed engineering prompt is methodological. A heavily engineered prompt that enumerates "look for transformers, breakers, CTs…" leaks the answer schema into the input and measures prompt quality rather than model capability. Three short prompts of increasing specificity:

| | Prompt | Measures |
|---|---|---|
| **P1** | *Analyze this diagram.* | Unprompted recognition — does it even know it is an SLD? |
| **P2** | *Identify the components and connections in this diagram.* | Component + connection recall when the task is named |
| **P3** | *Convert this diagram into a structured electrical graph as JSON, with nodes and edges.* | Whether output can be parsed and scored at all |

**Design details that keep this rigorous:**

- Run ≥ 3 models (e.g. GPT-class, Claude-class, Gemini-class) × 3 prompts × 3 repeats at fixed temperature. LLM outputs are stochastic; a single run is not a measurement. **Report mean and standard deviation.**
- Test at two image resolutions. Industrial drawings are large and dense; downsampling to a model's native input size is a plausible primary failure mode, and showing that explicitly is a real finding.
- Also run on **cropped regions** of the full SLD. If a model handles one feeder correctly but fails on the full sheet, the bottleneck is visual density, not electrical understanding — a much more interesting result than a single aggregate score.
- For P1 and P2, which return prose, use a separate LLM call as a *parser* to convert prose into the graph schema before scoring. Validate this parser against manual conversion on a subset and report its agreement, so parsing error is not silently attributed to the model under test.

**Expected failure modes to document:** hallucinated equipment tags; collapsing parallel feeders into one; reading dashed measurement links as power paths; losing the tie-breaker; misreading crossings without junction dots.

---

## 6. Stage 2 — Existing circuit/component detection model

**Objective:** a non-LLM, purely visual baseline, and an honest assessment of the gap between the academic circuit-recognition literature and an industrial SLD.

Candidate starting points: published hand-drawn/printed circuit recognition models, symbol-spotting methods from the document-analysis literature, engineering-drawing digitisation work (P&ID digitisation is the closest well-studied neighbour), and classical pipelines (connected components + template matching + Hough line detection).

**The known limitation is a feature of the experiment, not a flaw.** These models are typically built for small schematics with a handful of components and a symbol vocabulary that does not include CTs, ATSs or VFDs. So the experiment is explicitly a **scaling study**:

| Level | Input | Question |
|---|---|---|
| L1 | Single isolated symbol | Does the detector recognise our symbol set at all? |
| L2 | A small circuit (5–10 components) | Does it link components correctly? |
| L3 | One feeder cropped from a real SLD | Does it survive real drawing style? |
| L4 | One full bus section | Does it survive density? |
| L5 | The complete 4-sheet SLD | Where exactly does it break? |

Record the level at which each model breaks and **why** — vocabulary gap, resolution, line-tracing failure, or symbol density. This breakdown is what motivates Stage 3, and it is a publishable contribution in its own right: nobody has characterised where small-circuit models fail on industrial drawings.

---

## 7. Stage 3 — Hybrid CV + LLM pipeline (proposed approach)

```
                       INPUT SLD IMAGE
                              │
        ┌─────────────────────┼─────────────────────┐
        ↓                     ↓                     ↓
  Object detection      Text detection        Line detection
  (symbol class         (OCR: tags,           (vector traces,
   + bbox)               ratings)              junction dots)
        └─────────────────────┼─────────────────────┘
                              ↓
              Spatial association / fusion
       (bind each label to its symbol; resolve
        junctions; type each line power/meas/control)
                              ↓
                   Structured intermediate
                              ↓
                             LLM
                  (relationship reasoning,
                   ambiguity resolution)
                              ↓
                     Electrical graph JSON
                              ↓
                   Validity checker (§4.3)
```

**Why this should beat Stage 1:** the LLM is no longer asked to do perception. It receives a compact symbolic description and does what language models are genuinely good at — reasoning over relations and resolving ambiguity using domain knowledge. The task shrinks from *"understand this 2000×1400 engineering drawing"* to *"given these 60 detected objects and 70 line segments, determine the electrical relationships."*

**The fusion step is where the real engineering difficulty lies**, and it should not be glossed over:

- **Label binding.** A drawing has hundreds of text strings. Deciding that `1500 kVA` belongs to `TX-1659` and not to the breaker 40 px away is a non-trivial assignment problem. Treat it as bipartite matching with a cost combining distance, reading direction, and type compatibility (a `kVA` rating cannot belong to a motor).
- **Junction resolution.** Detect filled dots explicitly as an object class. A crossing *without* a dot must produce **no** edge. This single convention, handled wrongly, corrupts the whole topology — and it is exactly the kind of thing an end-to-end LLM has no reliable way to see.
- **Edge typing.** Line style (solid/dashed) plus endpoint types (CT→meter ⇒ measurement) plus voltage domain (24 VDC ⇒ control).

**Ablations are built in:** feed the LLM *perfect* detections from ground truth to get an upper bound on the reasoning stage in isolation. If the pipeline underperforms with perfect input, the problem is the LLM; if it only underperforms with real detections, the problem is perception. This cleanly separates the two error sources and is the most informative single experiment in the project.

---

## 8. Stage 4 — Spatial-temporal analytics on the recovered graph

The project title promises *analytics*, not just extraction, and this stage is what discharges that promise. It also provides a **task-based evaluation** that is far more convincing than graph metrics alone.

Each diagram in the dataset ships with matched time-series telemetry (per-meter kW/kvar/kVA/PF/current, plus breaker state logs). That allows the recovered graph to be used, not merely scored:

| Task | Method | Why the graph matters |
|---|---|---|
| **Topology-aware load forecasting** | GNN (GCN/GraphSAGE) over the recovered graph vs. a graph-agnostic LSTM per meter | If the graph is right, message passing between electrically adjacent meters should reduce error |
| **Switching-state identification** | Classify which breaker configuration (S0/S1/S2) is active from meter data alone | Directly tests whether the recovered topology explains observed power flows |
| **Energy-balance anomaly detection** | Check Kirchhoff consistency: incomer kW ≈ Σ downstream feeder kW | A wrong graph produces a persistent imbalance — the graph is *falsifiable* against telemetry |
| **Fault-impact / what-if analysis** | Open a breaker in the graph, predict which loads de-energise, compare to logged switching events | The end-user-facing capability |

**The energy-balance check is the most valuable idea here.** It gives an *unsupervised* signal of graph correctness that needs no ground-truth annotation — meaning it could validate extracted graphs on real sites where no annotated graph exists. That is a genuinely novel contribution and directly serves RQ4.

The headline result to aim for:

> Downstream analytics accuracy as a function of upstream graph extraction quality.

Degrade the ground-truth graph synthetically (drop 5%, 10%, 20% of edges) and measure how forecasting/state-identification accuracy falls. This answers the question a practitioner actually asks: **how good does the extraction have to be before it is useful?** No amount of F1 reporting answers that.

---

## 9. Dataset

### 9.1 Real data (the evaluation target)

Four diagrams from the supplied project materials. **This is the honest framing: four sheets is an evaluation set, not a training set.**

| Sheet | Content | Role |
|---|---|---|
| **S01** | Primary distribution SLD — 2 × 13.8 kV supplies, `TX-1659`/`TX-1616` (1500 kVA each), bus sections `BUS-462`/`BUS-471`, tie breaker `CB-355` (normally open, interlocked), metered feeders, VFD-driven pumps and fans, chillers | **Primary test case** |
| **I01** | Meter wiring — CT secondary and voltage-input circuits | Cross-sheet identity resolution |
| **I02** | Further CT/meter circuits | As above |
| **C01** | Control wiring — 24 VDC, field contacts (RUN/PERMIT), remote drive terminals to `DRV-803`, `DRV-861` | Control-relationship extraction |

Accompanying telemetry: 30 days of 1-minute meter trends across 7 power meters, a sensor register, and a breaker state log with a logged maintenance switchover (S0 → S1 → S2 → S1 → S0).

### 9.2 Synthetic data (the development set)

Because four sheets cannot support development or training, a **generator** produces diagrams whose ground-truth graph is known exactly by construction — the graph is the *input* to rendering, so the annotation is free and perfect.

Implemented in `Synthetic Data/`, built on the Schematex SLD engine (IEEE 315 / ANSI Y32.2 symbols), each sample ships with:

```
PLANT-XX/
  drawings/   plant.sld          DSL source (the generative spec)
              plant.svg          vector render
              plant.png          raster render for CV models
  graph/      graph.json         ground-truth graph: typed nodes, typed edges,
                                 attributes, symbol bboxes, label bboxes,
                                 electrical nets
  data/       meter_trends.csv   per-meter time series
              sensor_register.csv
              switch_states.csv  breaker configuration log
```

Controlled variation across the corpus: number of sources (utility / generator / solar / UPS), transformer count and winding configuration, bus count and tie arrangement, feeder count, load mix (motors, VFDs, chillers, panels, capacitor banks), diagram depth and width, tag-naming scheme, and overall visual density.

The corpus has two tiers, generated by the same builder (`_tools/build.mjs`) from two different spec sources and merged into one `manifest.json`:

| Tier | IDs | Spec source | Plants | Nodes (min/avg/max) | Avg image size | Telemetry |
|---|---|---|---|---|---|---|
| **Core** | `PLANT-01`…`PLANT-10` | `_tools/plants.mjs` | 10 | 27 / 54 / 81 | 1964×1246 | 30 days, 1-min |
| **Bulk** | `GEN-0001`…`GEN-1550` | `_tools/plants.generated.mjs` | 1508 | 10 / 19 / 25 | 754×984 | 7 days, 1-min |

The **core** tier is 10 hand-authored plants closely tracking the reference drawing's scale, one per major topology family described in the reference materials.

The **bulk** tier is procedurally generated: each spec is drawn from a seeded RNG across 20 domain archetypes (offices, hospitals, water/pump stations, telecom shelters, EV hubs, mining conveyors, substations, renewables, etc.), with randomised source mix, section/incomer/tie structure, feeder count and load mix. Node count is validated against the real builder and trimmed/grown until it lands in a precise 10–25 node band — about a third to a half of the core corpus's average — so these diagrams are visually smaller and denser to parse in bulk, exactly as intended for a bulk graph-extraction training set. 1550 candidate topologies were attempted; 42 were skipped because the orthogonal wire router couldn't find a route for that specific random layout (logged, not silently dropped), leaving 1508 usable plants. Telemetry is a shorter 7-day window rather than the core tier's 30 days, keeping the bulk tier's footprint to ~10GB total for the full corpus rather than the 60-80GB a full-length window would need at this scale.

Run `node _tools/generate.mjs [--core | --gen] [--no-data] [--days N]` to (re)build the corpus (writes are merged into the existing manifest rather than overwriting it, so a filtered run is safe), and `node _tools/verify.mjs [--core | --gen]` to self-check recoverability, electrical validity and telemetry consistency across whichever tier(s) are present.

**Caveat to state openly in the report:** synthetic diagrams are rendered cleanly and programmatically. They do **not** reproduce scan noise, skew, compression artefacts, hand annotation, or vendor-specific drafting style. This is precisely the domain gap RQ4 measures. Mitigation: an augmentation pass (blur, JPEG artefacts, rotation, resolution reduction, synthetic scan noise) before the transfer evaluation, and report results with and without it.

### 9.3 Splits

- **Train / develop:** synthetic corpus only. The 1508-plant bulk tier is large enough to support an actual train/validate split within the synthetic data itself, rather than validating on the same handful of topologies used for development.
- **Validate:** held-out synthetic, including topologies not seen in training — e.g. a domain-archetype-disjoint split of the bulk tier (hold out several of the 20 archetypes entirely) in addition to a random split, to test generalisation to unseen plant *kinds*, not just unseen instances.
- **Test:** the four real sheets — touched **only** for final evaluation.

Keeping the real sheets untouched until the end is what makes the RQ4 result credible. It must be stated and adhered to.

---

## 10. Execution Phases

| Phase | Work | Output |
|---|---|---|
| **P1** | Ground truth for the 4 real sheets: manual annotation to the §3 schema (nodes, types, attributes, positions; typed edges) | `diagram_01..04.png` + `.json`; annotation guideline document |
| **P2** | Stage 1 LLM baseline: 3 prompts × ≥3 models × 3 repeats, full + cropped, two resolutions | Baseline results table; failure-mode taxonomy |
| **P3** | Stage 2 existing-model scaling study (L1→L5) | Breaking-point analysis per model |
| **P4** | Synthetic generator + corpus | Diagrams, graphs, telemetry at scale |
| **P5** | Stage 3 hybrid pipeline + validity checker | Working system; ablation results |
| **P6** | Stage 4 analytics + graph-degradation study | Task-based evaluation |
| **P7** | Transfer evaluation on real sheets; write-up | Final results; thesis |

**Annotation quality control for P1:** annotate each sheet twice (ideally a second annotator, otherwise blind re-annotation after a gap) and report inter-annotator agreement. If ground truth on a 4-sheet test set is unreliable, every downstream number is unreliable — and reviewers will ask.

---

## 11. Risks and Mitigations

| Risk | Impact | Mitigation |
|---|---|---|
| Four real diagrams is a very small test set | Results may not generalise; limited statistical power | Report per-sheet and per-region results rather than one aggregate; use cropped regions as additional evaluation units; frame as a case study and say so |
| No suitable existing model exists for Stage 2 | RQ2 unanswerable as posed | Fall back to a classical CV pipeline (Hough + template matching) as the non-LLM baseline; a negative result ("no existing model handles industrial SLDs") is itself a finding worth reporting |
| Synthetic-to-real gap too large | Stage 3 fails on real sheets | Augmentation pipeline; few-shot adaptation on one real sheet with leave-one-out across the four; measure and report the gap rather than hiding it |
| LLM API cost / rate limits / model deprecation | Experiments not reproducible | Cache every raw response with model version and timestamp; pin versions; budget early |
| LLM non-determinism | Irreproducible numbers | Fixed temperature, multiple repeats, report variance |
| Scope creep across four stages | Nothing finished | Stage 1 + synthetic generator + Stage 3 is the **minimum viable thesis**; Stages 2 and 4 are explicitly scoped as extensions and can be reduced |

---

## 12. Contributions

1. A **synthetic SLD generation framework** producing diagrams with perfect, free, machine-readable ground-truth graphs plus matched telemetry — addressing the central data bottleneck in engineering-drawing digitisation.
2. The **first systematic characterisation** of where multimodal LLMs and existing circuit-recognition models fail on industrial single-line diagrams.
3. A **hybrid detection-plus-reasoning pipeline** with an ablation design that cleanly separates perception error from reasoning error.
4. An **electrical validity checker** and a **telemetry-based energy-balance consistency test** — an unsupervised means of validating extracted graphs where no annotation exists.
5. A quantified answer to *how accurate graph extraction must be* before downstream smart-building analytics become reliable.

---

## 13. Definition of Done

- [ ] Four real sheets annotated, double-checked, agreement reported
- [ ] Stage 1 baseline complete with variance across repeats
- [ ] Stage 2 scaling study with documented breaking points
- [ ] Synthetic corpus generated, with graphs validated against the renderer
- [ ] Stage 3 pipeline running end-to-end, ablations complete
- [ ] Stage 4 analytics demonstrated on at least one task, with the degradation study
- [ ] Transfer results on the four real sheets, reported with and without augmentation
- [ ] All code, prompts, raw model outputs and results reproducible from the repository
