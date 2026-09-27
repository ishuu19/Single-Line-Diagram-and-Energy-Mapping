"""
Recover the wiring graph of a sheet from the image and the detected boxes.

Follows the AITEE / CircuitNet recipe (detect, mask, trace, cluster) with the conventions of
IEEE 315 single-line sheets:

  * every wire pixel (solid or dashed) is connectivity. Dashes are 10 px on / 8 px off; wires
    that cross without a dot leave a 10 px clearance gap with the other wire running through it.
    One row/column scan bridges both: a small collinear gap is closed unless the ink on the far
    side is a perpendicular wire, in which case the scan skips over it to the wire's continuation.
  * a net is one connected group of wire pixels; its members are the symbols it touches.
  * power edges  = minimum spanning tree over along-the-wire distances between the non-meter members
  * measurement  = each meter pairs with the CT / PT nearest along the wire (the dashed link)
  * protection   = a utility - surge arrester pair
"""
from __future__ import annotations

import networkx as nx
import numpy as np
from scipy import ndimage as ndi

from config import BOX_PAD, INK_THRESHOLD, JUNCTION_CLASS, MIN_WIRE_PX, TEXT_CLASS, TOUCH_PAD

SYMBOL_EXCLUDE = {JUNCTION_CLASS, TEXT_CLASS}
METER_TYPES = {"watthour_meter", "demand_meter"}
SENSOR_TYPES = {"ct", "pt"}
DASH_MAX_PX = 14       # a blob no longer than this (after masking) is a dash
TOUCH_PAD_FAR = 12     # second look for symbols no wire reaches within TOUCH_PAD (a dashed link can end in its 8 px gap)
GAP_MAX_PX = 13        # largest collinear gap in a solid wire treated as a crossing clearance
PERP_REACH = 6         # a blob with ink this far across the gap axis is a perpendicular (crossing) wire
EIGHT = np.ones((3, 3), bool)


# ----------------------------------------------------------------------------- image
def to_gray(image):
    arr = np.asarray(image)
    if arr.ndim == 3:
        if arr.shape[2] == 4:
            alpha = arr[..., 3:4] / 255.0
            arr = arr[..., :3] * alpha + 255 * (1 - alpha)
        arr = arr[..., :3].mean(-1)
    return arr.astype(np.float32)


def ink_mask(gray):
    return gray < INK_THRESHOLD


def _clip_box(box, shape, pad=0):
    h, w = shape
    x0, y0, x1, y1 = box
    return (max(0, int(np.floor(x0)) - pad), max(0, int(np.floor(y0)) - pad),
            min(w, int(np.ceil(x1)) + pad), min(h, int(np.ceil(y1)) + pad))


def mask_boxes(ink, detections, pad=BOX_PAD):
    out = ink.copy()
    for d in detections:
        if d["type"] == JUNCTION_CLASS:
            continue
        x0, y0, x1, y1 = _clip_box(d["bbox"], ink.shape, pad)
        out[y0:y1, x0:x1] = False
    return out


# ----------------------------------------------------------------------------- blobs
def split_blobs(ink):
    """Label ink blobs; return (labels, solid ids, dash ids)."""
    lab, n = ndi.label(ink, structure=EIGHT)
    solid, dash = [], []
    for i, sl in enumerate(ndi.find_objects(lab), start=1):
        if sl is None:
            continue
        h, w = sl[0].stop - sl[0].start, sl[1].stop - sl[1].start
        (dash if max(h, w) <= DASH_MAX_PX else solid).append(i)
    return lab, solid, dash


class _UnionFind:
    def __init__(self):
        self.parent = {}

    def find(self, a):
        self.parent.setdefault(a, a)
        while self.parent[a] != a:
            self.parent[a] = self.parent[self.parent[a]]
            a = self.parent[a]
        return a

    def union(self, a, b):
        ra, rb = self.find(a), self.find(b)
        if ra != rb:
            self.parent[rb] = ra


def _is_perpendicular(lab, blob, r, c, axis):
    """Does `blob` extend PERP_REACH pixels across the scan axis at (r, c)? Then it is a crossing wire, not a wire end."""
    h, w = lab.shape
    if axis == 1:  # scanning along a row: perpendicular means ink above / below
        return (r - PERP_REACH >= 0 and lab[r - PERP_REACH, c] == blob) or (r + PERP_REACH < h and lab[r + PERP_REACH, c] == blob)
    return (c - PERP_REACH >= 0 and lab[r, c - PERP_REACH] == blob) or (c + PERP_REACH < w and lab[r, c + PERP_REACH] == blob)


def _scan_line(lab, line_index, axis, solid_set, uf, gap_pixels):
    """Bridge small collinear gaps along one row (axis=1) or column (axis=0)."""
    line = lab[line_index, :] if axis == 1 else lab[:, line_index]
    ink = line > 0
    if not ink.any():
        return
    edges = np.flatnonzero(np.diff(ink.astype(np.int8)))
    starts = [0] if ink[0] else []
    starts += [e + 1 for e in edges if not ink[e]]
    ends = [e for e in edges if ink[e]]
    if ink[-1]:
        ends.append(len(line) - 1)
    segs = [(s, e, int(line[s])) for s, e in zip(starts, ends) if int(line[s]) in solid_set]
    segs_all = [(s, e, int(line[s])) for s, e in zip(starts, ends)]

    def pos(r, c):
        return (r, c) if axis == 1 else (c, r)

    k = 0
    for s0, e0, a in segs:
        if _is_perpendicular(lab, a, *pos(line_index, e0), axis):
            continue
        # walk following segments (any blob) until the gap budget is spent
        j = next((idx for idx, seg in enumerate(segs_all) if seg[0] == s0), None)
        if j is None:
            continue
        for s1, e1, b in segs_all[j + 1:]:
            if s1 - e0 - 1 > GAP_MAX_PX:
                break
            if b not in solid_set or _is_perpendicular(lab, b, *pos(line_index, s1), axis):
                continue  # dash or crossing wire in the gap: keep looking for the wire's continuation
            if b != a:
                uf.union(a, b)
                gap_pixels.append((axis, line_index, e0 + 1, s1 - 1))
            break


def bridge_solid_gaps(lab, solid_ids):
    """Union solid blobs separated by a crossing clearance. Returns (union-find, list of gap spans)."""
    uf = _UnionFind()
    for i in solid_ids:
        uf.find(i)
    solid_set = set(solid_ids)
    gaps = []
    h, w = lab.shape
    rows = np.flatnonzero((lab > 0).any(axis=1))
    cols = np.flatnonzero((lab > 0).any(axis=0))
    for r in rows:
        _scan_line(lab, r, 1, solid_set, uf, gaps)
    for c in cols:
        _scan_line(lab, c, 0, solid_set, uf, gaps)
    return uf, gaps


# ----------------------------------------------------------------------------- symbols <-> ink
def _touching(mask, symbols, shape, pad=TOUCH_PAD):
    out = []
    for k, d in enumerate(symbols):
        x0, y0, x1, y1 = _clip_box(d["bbox"], shape, pad)
        if x1 > x0 and y1 > y0 and mask[y0:y1, x0:x1].any():
            out.append(k)
    return out


def _seed_pixels(mask, box, pad=TOUCH_PAD):
    x0, y0, x1, y1 = _clip_box(box, mask.shape, pad)
    if not mask[y0:y1, x0:x1].any():  # dashed links may end inside a dash gap: look a little further
        x0, y0, x1, y1 = _clip_box(box, mask.shape, TOUCH_PAD_FAR)
    ys, xs = np.nonzero(mask[y0:y1, x0:x1])
    return list(zip((ys + y0).tolist(), (xs + x0).tolist()))



class _Geodesic:
    """Along-the-wire distances over a boolean mask (scikit-image minimum cost path, 8-connected)."""

    def __init__(self, mask):
        from skimage.graph import MCP_Geometric
        self.mask = mask
        costs = np.where(mask, 1.0, np.inf)
        self.mcp = MCP_Geometric(costs, fully_connected=True)

    def from_seeds(self, seeds):
        seeds = [tuple(p) for p in seeds if self.mask[p]]
        if not seeds:
            return None
        dist, _ = self.mcp.find_costs(seeds)
        return dist.copy()  # find_costs hands back a view of its own buffer; the next call would overwrite it

    def path(self, end):
        return [(int(y), int(x)) for y, x in self.mcp.traceback(end)]


def _relationship(a, b):
    types = {a["type"], b["type"]}
    return "protection" if types == {"utility", "surge_arrester"} else "power"


def _centre(box):
    return ((box[0] + box[2]) / 2, (box[1] + box[3]) / 2)


def net_edges(mask, members, symbols):
    """Edges inside one net.

    power       : minimum spanning tree over geodesic distances between the non-meter members
    measurement : every meter -> the nearest CT / PT along the wire (else the nearest other member)
    """
    sl = ndi.find_objects(mask.astype(np.int8))[0]
    sub = mask[sl]
    oy, ox = sl[0].start, sl[1].start
    seeds = {k: [(y - oy, x - ox) for y, x in _seed_pixels(mask, symbols[k]["bbox"])] for k in members}
    seeds = {k: v for k, v in seeds.items() if v}
    if len(seeds) < 2:
        return []
    geo = _Geodesic(sub)
    dist = {}
    for k, pts in seeds.items():
        dist[k] = geo.from_seeds(pts)

    def d(a, b):
        da = dist[a]
        vals = [da[p] for p in seeds[b] if np.isfinite(da[p])]
        return min(vals) if vals else None

    def path(a, b):
        da = dist[a]
        end = min((p for p in seeds[b] if np.isfinite(da[p])), key=lambda p: da[p])
        geo.from_seeds(seeds[a])  # reset traceback state to source a
        return [(y + oy, x + ox) for y, x in geo.path(end)]

    meters = [k for k in seeds if symbols[k]["type"] in METER_TYPES]
    power = [k for k in seeds if k not in meters]
    out = []

    g = nx.Graph()
    for i, a in enumerate(power):
        for b in power[i + 1:]:
            w = d(a, b)
            if w is not None:
                g.add_edge(a, b, weight=w)
    for a, b in nx.minimum_spanning_tree(g).edges():
        out.append((a, b, _relationship(symbols[a], symbols[b]), path(a, b)))

    for m in meters:
        sensors = [k for k in power if symbols[k]["type"] in SENSOR_TYPES]
        pool = sensors or power
        best = min(((d(m, k), k) for k in pool if d(m, k) is not None), default=None)
        if best is not None:
            out.append((best[1], m, "measurement", path(m, best[1])))
    return out


# ----------------------------------------------------------------------------- pipeline
def trace(image, detections):
    gray = to_gray(image)
    ink = mask_boxes(ink_mask(gray), detections)
    symbols = [d for d in detections if d["type"] not in SYMBOL_EXCLUDE]

    lab, solid_ids, dash_ids = split_blobs(ink)
    blob_ids = solid_ids + dash_ids
    # one scan bridges dash gaps (8 px) and crossing clearances (10 px) alike; perpendicular ink is skipped
    uf, gaps = bridge_solid_gaps(lab, blob_ids)

    groups = {}
    for i in blob_ids:
        groups.setdefault(uf.find(i), []).append(i)
    gap_by_root = {}
    for axis, line, g0, g1 in gaps:
        near_blob = lab[line, g0 - 1] if axis == 1 else lab[g0 - 1, line]
        gap_by_root.setdefault(uf.find(int(near_blob)), []).append((axis, line, g0, g1))

    masks = []
    for root, blobs in groups.items():
        mask = np.isin(lab, blobs)
        for axis, line, g0, g1 in gap_by_root.get(root, []):
            if axis == 1:
                mask[line, g0:g1 + 1] = True
            else:
                mask[g0:g1 + 1, line] = True
        sl = ndi.find_objects(mask.astype(np.int8))[0]
        if sl is None or max(sl[0].stop - sl[0].start, sl[1].stop - sl[1].start) < MIN_WIRE_PX:
            continue
        masks.append((mask, blobs, _touching(mask, symbols, mask.shape)))

    # symbols that no wire reaches at the normal radius (dashed link ending in a gap): second look, wider
    reached = {k for _, _, members in masks for k in members}
    for k, d in enumerate(symbols):
        if k in reached:
            continue
        for mask, blobs, members in masks:
            if _touching(mask, [d], mask.shape, TOUCH_PAD_FAR):
                members.append(k)
                break

    nets, edges = [], []
    for mask, blobs, members in masks:
        if not members:
            continue
        nets.append({"members": members, "blobs": blobs, "dashed_blobs": sum(1 for b in blobs if b in dash_ids)})
        for a, b, rel, pth in net_edges(mask, members, symbols):
            edges.append(_edge(a, b, rel, pth))

    return {"symbols": symbols, "nets": nets, "edges": edges, "wire_labels": lab}


def _edge(a, b, rel, path):
    step = max(1, len(path) // 40)
    pts = [[int(x), int(y)] for y, x in path[::step]] + [[int(path[-1][1]), int(path[-1][0])]]
    return {"a": a, "b": b, "relationship": rel, "polyline": pts}


def to_graph_json(result, sheet_id="", png_scale=2):
    nodes = [{"id": d.get("id", f"N{k:03d}"), "type": d["type"], "bbox": [v / png_scale for v in d["bbox"]],
              "confidence": d.get("conf", 1.0)} for k, d in enumerate(result["symbols"])]
    edges = [{"id": f"E{j + 1:03d}", "source": nodes[e["a"]]["id"], "target": nodes[e["b"]]["id"],
              "relationship": e["relationship"], "line_style": "dashed" if e["relationship"] == "measurement" else "solid",
              "polyline": [[x / png_scale, y / png_scale] for x, y in e["polyline"]]} for j, e in enumerate(result["edges"])]
    return {"diagram_id": sheet_id, "nodes": nodes, "edges": edges,
            "nets": {str(i): n["members"] for i, n in enumerate(result["nets"])}}
