"""
Score a recovered graph against graph.json.

  nodes : predicted symbol matched to a GT node when same type and IoU >= MATCH_IOU (greedy by IoU)
  edges : GT edge counted when an edge exists between the two matched predictions
  types : of the matched edges, how many carry the right relationship (power / measurement)
  nets  : GT nets (node sets from graph.json `nets`) vs predicted nets, best-match Jaccard in GT-id space,
          averaged over all GT nets of all sheets

  python graph_eval.py --split test              # oracle boxes from ground truth -> tests the tracer alone
  python graph_eval.py --split test --pred DIR   # DIR/<id>.json predicted graphs (from predict_graph.py)
"""
from __future__ import annotations

import argparse
import json
from collections import defaultdict
from pathlib import Path

import numpy as np
from PIL import Image

from config import MATCH_IOU, OUTPUT_DIR
from sld_data import box_iou, gt_detections, image_path, load_classes, load_graph, sheet_ids, to_px
from wires import trace


def match_nodes(gt_nodes, pred_nodes, graph, typed=True):
    """gt index -> pred index. Boxes compared in pixels; bus uses the drawn bar when present.

    typed=True  : a prediction can only match a GT node of the same type (the original, strict rule).
    typed=False : boxes alone decide (localisation); type agreement is then reported separately, so a
                  correct box with a finer classifier label is not scored as a missed node.
    """
    pairs = []
    for gi, n in enumerate(gt_nodes):
        gbox = to_px(n.get("bbox_draw", n["bbox"]), graph)
        for pi, p in enumerate(pred_nodes):
            if typed and p["type"] != n["type"]:
                continue
            iou = box_iou(gbox, p["bbox"])
            if iou >= MATCH_IOU:
                pairs.append((iou, gi, pi))
    pairs.sort(reverse=True)
    m, used = {}, set()
    for _, gi, pi in pairs:
        if gi in m or pi in used:
            continue
        m[gi] = pi
        used.add(pi)
    return m


def gt_nets(graph):
    """net id -> set of node ids, from the edge lists in graph.json."""
    by_id = {e["id"]: e for e in graph["edges"]}
    out = {}
    for net, eids in graph.get("nets", {}).items():
        members = set()
        for eid in eids:
            e = by_id[eid]
            members.update((e["source"], e["target"]))
        out[net] = members
    return out


def score_sheet(graph, pred, typed=True):
    """pred: {"symbols": [{type,bbox(px)}], "edges": [{a,b,relationship}], "nets": [{members}]}.

    typed=False scores localisation only (see match_nodes). `nodes_type_ok` always counts the location-matched
    nodes whose type is also right, so node_typed_recall means the same thing under either rule."""
    m = match_nodes(graph["nodes"], pred["symbols"], graph, typed=typed)
    m_loc = m if not typed else match_nodes(graph["nodes"], pred["symbols"], graph, typed=False)
    type_ok = sum(graph["nodes"][gi]["type"] == pred["symbols"][pi]["type"] for gi, pi in m_loc.items())
    node_ids = [n["id"] for n in graph["nodes"]]
    pred_of = {node_ids[gi]: pi for gi, pi in m.items()}
    gt_of = {pi: node_ids[gi] for gi, pi in m.items()}

    # one predicted edge per node pair (the tracer may emit power + measurement on the same pair: kept as a set)
    pred_edges = defaultdict(set)
    for e in pred["edges"]:
        pred_edges[frozenset((e["a"], e["b"]))].add(e["relationship"])
    # each predicted pair is hit at most once, so precision stays <= 1 with duplicate GT edges on one pair;
    # GT edges whose relationship the pair carries go first so the one hit is the right-typed one
    cand = []
    for e in graph["edges"]:
        a, b = pred_of.get(e["source"]), pred_of.get(e["target"])
        if a is None or b is None or frozenset((a, b)) not in pred_edges:
            continue
        pair = frozenset((a, b))
        cand.append((e["relationship"] not in pred_edges[pair], pair, e["relationship"]))
    edge_hit = type_hit = 0
    used = set()
    for wrong, pair, rel in sorted(cand, key=lambda c: c[0]):
        if pair in used:
            continue
        used.add(pair)
        edge_hit += 1
        type_hit += not wrong

    # nets compared in GT-id space: a predicted member maps back to its GT node, or stays a false positive;
    # a GT member with no matched prediction stays in the GT set, so dropped nodes lower the score
    gnets = gt_nets(graph)
    pnets = [{gt_of.get(p, ("FP", p)) for p in n["members"]} for n in pred["nets"]]
    jac = []
    for members in gnets.values():
        best = max((len(members & p) / len(members | p) for p in pnets if members | p), default=0.0)
        jac.append(best)

    return {
        "typed": bool(typed),
        "nodes_gt": len(graph["nodes"]), "nodes_pred": len(pred["symbols"]), "nodes_matched": len(m), "nodes_type_ok": type_ok,
        "edges_gt": len(graph["edges"]), "edges_pred": len(pred_edges), "edges_hit": edge_hit, "edge_type_hit": type_hit,
        "nets_gt": len(gnets), "net_jaccard_sum": float(sum(jac)),
        "net_jaccard": float(np.mean(jac)) if jac else float("nan"),  # no GT nets: undefined, not a perfect 1.0
    }


def summarise(rows):
    tot = defaultdict(float)
    for r in rows:
        for k, v in r.items():
            tot[k] += v
    nan = float("nan")
    typed = any(r.get("typed", True) for r in rows)
    return {
        "sheets": len(rows),
        "node_precision": tot["nodes_matched"] / max(1, tot["nodes_pred"]),
        "node_recall": tot["nodes_matched"] / max(1, tot["nodes_gt"]),
        # type-gated matching makes every matched node right by construction: report NaN, not a fake 1.0
        "node_type_accuracy": nan if typed else tot["nodes_type_ok"] / max(1, tot["nodes_matched"]),
        "node_typed_recall": tot["nodes_type_ok"] / max(1, tot["nodes_gt"]),
        "edge_precision": tot["edges_hit"] / max(1, tot["edges_pred"]),
        "edge_recall": tot["edges_hit"] / max(1, tot["edges_gt"]),
        "edge_type_accuracy": tot["edge_type_hit"] / max(1, tot["edges_hit"]),
        # micro over GT nets: a sheet with many nets weighs more, a sheet with none adds nothing
        "net_jaccard": tot["net_jaccard_sum"] / tot["nets_gt"] if tot["nets_gt"] else nan,
    }


def oracle_prediction(sheet_id, split, classes):
    """Trace wires with ground-truth boxes: isolates the tracer from detector errors."""
    graph = load_graph(sheet_id)
    image = Image.open(image_path(sheet_id, split))
    return graph, trace(image, gt_detections(graph, classes))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--split", default="test")
    ap.add_argument("--pred", type=Path, help="folder of predicted graph.json files; omit for oracle boxes")
    ap.add_argument("--limit", type=int, default=0)
    args = ap.parse_args()

    classes = load_classes()
    ids = sheet_ids(args.split)
    if args.limit:
        ids = ids[: args.limit]
    rows = []
    for sid in ids:
        if args.pred:
            graph = load_graph(sid)
            pred = json.loads((args.pred / f"{sid}.json").read_text())
        else:
            graph, pred = oracle_prediction(sid, args.split, classes)
        rows.append(score_sheet(graph, pred))
    summary = summarise(rows)
    print(json.dumps(summary, indent=2))
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    tag = "oracle" if not args.pred else "pred"
    (OUTPUT_DIR / f"graph_{tag}_{args.split}.json").write_text(json.dumps({"summary": summary, "sheets": dict(zip(ids, rows))}, indent=2))


if __name__ == "__main__":
    main()
