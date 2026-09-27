"""
Score a recovered graph against graph.json.

  nodes : predicted symbol matched to a GT node when same type and IoU >= MATCH_IOU (greedy by IoU)
  edges : GT edge counted when an edge exists between the two matched predictions
  types : of the matched edges, how many carry the right relationship (power / measurement)
  nets  : GT nets (node sets from graph.json `nets`) vs predicted nets, best-match Jaccard

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


def match_nodes(gt_nodes, pred_nodes, graph):
    """gt index -> pred index. Boxes compared in pixels; bus uses the drawn bar when present."""
    pairs = []
    for gi, n in enumerate(gt_nodes):
        gbox = to_px(n.get("bbox_draw", n["bbox"]), graph)
        for pi, p in enumerate(pred_nodes):
            if p["type"] != n["type"]:
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


def score_sheet(graph, pred):
    """pred: {"symbols": [{type,bbox(px)}], "edges": [{a,b,relationship}], "nets": [{members}]}."""
    m = match_nodes(graph["nodes"], pred["symbols"], graph)
    node_ids = [n["id"] for n in graph["nodes"]]
    pred_of = {node_ids[gi]: pi for gi, pi in m.items()}

    pred_edges = {}
    for e in pred["edges"]:
        pred_edges[frozenset((e["a"], e["b"]))] = e["relationship"]
    edge_hit = type_hit = 0
    for e in graph["edges"]:
        a, b = pred_of.get(e["source"]), pred_of.get(e["target"])
        if a is None or b is None:
            continue
        rel = pred_edges.get(frozenset((a, b)))
        if rel is not None:
            edge_hit += 1
            type_hit += rel == e["relationship"]

    gnets = gt_nets(graph)
    pnets = [set(n["members"]) for n in pred["nets"]]
    jac = []
    for members in gnets.values():
        pm = {pred_of[i] for i in members if i in pred_of}
        best = max((len(pm & p) / len(pm | p) for p in pnets if pm | p), default=0.0)
        jac.append(best)

    return {
        "nodes_gt": len(graph["nodes"]), "nodes_pred": len(pred["symbols"]), "nodes_matched": len(m),
        "edges_gt": len(graph["edges"]), "edges_pred": len(pred["edges"]), "edges_hit": edge_hit, "edge_type_hit": type_hit,
        "nets_gt": len(gnets), "net_jaccard": float(np.mean(jac)) if jac else 1.0,
    }


def summarise(rows):
    tot = defaultdict(float)
    for r in rows:
        for k, v in r.items():
            tot[k] += v
    n = max(1, len(rows))
    return {
        "sheets": len(rows),
        "node_precision": tot["nodes_matched"] / max(1, tot["nodes_pred"]),
        "node_recall": tot["nodes_matched"] / max(1, tot["nodes_gt"]),
        "edge_precision": tot["edges_hit"] / max(1, tot["edges_pred"]),
        "edge_recall": tot["edges_hit"] / max(1, tot["edges_gt"]),
        "edge_type_accuracy": tot["edge_type_hit"] / max(1, tot["edges_hit"]),
        "net_jaccard": tot["net_jaccard"] / n,
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
