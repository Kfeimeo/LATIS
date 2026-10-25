#!/usr/bin/env python
"""LATIS Stage C0 -- read-only cardinality diagnosis of the official ARC-AGI-1
training tasks (train pairs only; test pairs are never read).

For every task the input and output grids of every TRAIN pair are encoded with
the repository's object convention (background 0, single-colour components,
4-connectivity) and, for comparison, with 8-connectivity.  The script then
classifies the *count relation* and a few cheap structural facts.  It does NOT
infer the task's true operation: a count difference under this encoder is a
property of encoder + RankAlign, not a label of the task.

Usage: python -I scripts/arc_cardinality_diagnosis.py [--source data/arc1-training]
       [--baseline results/stage_b/per_task.csv] [--out results/stage_c/validation]
"""
import argparse
import csv
import json
from collections import Counter
from pathlib import Path

csv.field_size_limit(2**31 - 1)


def components(grid, eight):
    h = len(grid)
    w = len(grid[0])
    seen = [[False] * w for _ in range(h)]
    comps = []
    if eight:
        offs = [(dx, dy) for dx in (-1, 0, 1) for dy in (-1, 0, 1) if (dx, dy) != (0, 0)]
    else:
        offs = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    for y in range(h):
        for x in range(w):
            c = grid[y][x]
            if c == 0 or seen[y][x]:
                continue
            stack = [(x, y)]
            seen[y][x] = True
            cells = []
            while stack:
                px, py = stack.pop()
                cells.append((px, py))
                for dx, dy in offs:
                    qx, qy = px + dx, py + dy
                    if 0 <= qx < w and 0 <= qy < h and not seen[qy][qx] and grid[qy][qx] == c:
                        seen[qy][qx] = True
                        stack.append((qx, qy))
            comps.append((c, cells))
    return comps


def shape_key(cells):
    mx = min(x for x, _ in cells)
    my = min(y for _, y in cells)
    return tuple(sorted((x - mx, y - my) for x, y in cells))


def grid_facts(grid):
    comps4 = components(grid, False)
    comps8 = components(grid, True)
    pixels = sum(1 for row in grid for c in row if c != 0)
    colors = sorted({c for row in grid for c in row if c != 0})
    return {"w": len(grid[0]), "h": len(grid), "n4": len(comps4), "n8": len(comps8), "pixels": pixels, "colors": colors,
            "shapes": Counter((c, shape_key(cells)) for c, cells in comps4),
            "cells": {(x, y, grid[y][x]) for y in range(len(grid)) for x in range(len(grid[0])) if grid[y][x] != 0}}


def classify(pairs):
    fin = [grid_facts(p["input"]) for p in pairs]
    fout = [grid_facts(p["output"]) for p in pairs]
    rel = []
    for a, b in zip(fin, fout):
        if a["n4"] == b["n4"]:
            rel.append("equal")
        elif a["n4"] > b["n4"]:
            rel.append("fewer")
        else:
            rel.append("more")
    count_relation = rel[0] if len(set(rel)) == 1 else "mixed"
    same_canvas = all(a["w"] == b["w"] and a["h"] == b["h"] for a, b in zip(fin, fout))
    eq8 = all(a["n8"] == b["n8"] for a, b in zip(fin, fout))
    eq4 = count_relation == "equal"
    out_subset = all(b["cells"] <= a["cells"] for a, b in zip(fin, fout)) and same_canvas
    in_subset = all(a["cells"] <= b["cells"] for a, b in zip(fin, fout)) and same_canvas
    out_single = all(b["n4"] == 1 for b in fout)
    out_empty = any(b["n4"] == 0 for b in fout)
    in_single = all(a["n4"] == 1 for a in fin)
    # output objects whose (colour, shape) also occurs among the input objects of the same pair
    preserved = 0
    total_out = 0
    for a, b in zip(fin, fout):
        avail = Counter(a["shapes"])
        for k, n in b["shapes"].items():
            total_out += n
            preserved += min(n, avail.get(k, 0))
    out_shape_in_input = (preserved / total_out) if total_out else None
    same_colors = all(a["colors"] == b["colors"] for a, b in zip(fin, fout))
    new_colors = any(set(b["colors"]) - set(a["colors"]) for a, b in zip(fin, fout))
    ratio_const = None
    if all(a["n4"] > 0 for a in fin):
        ratios = {b["n4"] / a["n4"] for a, b in zip(fin, fout)}
        if len(ratios) == 1:
            ratio_const = ratios.pop()
    diff_const = None
    diffs = {b["n4"] - a["n4"] for a, b in zip(fin, fout)}
    if len(diffs) == 1:
        diff_const = diffs.pop()
    return {
        "train_pairs": len(pairs), "count_relation_4conn": count_relation, "same_canvas": same_canvas,
        "counts_equal_under_8conn": eq8, "counts_equal_4conn": eq4,
        "in_counts": [a["n4"] for a in fin], "out_counts": [b["n4"] for b in fout],
        "in_counts_8": [a["n8"] for a in fin], "out_counts_8": [b["n8"] for b in fout],
        "in_pixels": [a["pixels"] for a in fin], "out_pixels": [b["pixels"] for b in fout],
        "in_dims": [[a["w"], a["h"]] for a in fin], "out_dims": [[b["w"], b["h"]] for b in fout],
        "output_cells_subset_of_input": out_subset, "input_cells_subset_of_output": in_subset,
        "output_single_object": out_single, "output_has_empty_grid": out_empty, "input_single_object": in_single,
        "output_objects_with_input_shape_fraction": out_shape_in_input,
        "same_color_sets": same_colors, "output_introduces_new_color": new_colors,
        "constant_count_ratio": ratio_const, "constant_count_difference": diff_const,
    }


def coarse_class(f):
    """Coarse bucket for the report (encoder-level facts only, not task semantics)."""
    r = f["count_relation_4conn"]
    if r == "equal":
        return "equal (not in the cardinality set)"
    if f["counts_equal_under_8conn"]:
        return "unequal under 4-conn, equal under 8-conn (segmentation view)"
    if r == "fewer":
        if f["output_cells_subset_of_input"]:
            return "fewer, output cells are a subset of the input cells (selection-like)"
        if f["output_single_object"]:
            return "fewer, single output object (merge/crop-like)"
        return "fewer, other"
    if r == "more":
        if f["input_cells_subset_of_output"]:
            return "more, input cells are a subset of the output cells (addition/replication-like)"
        return "more, other"
    return "mixed relation across train pairs"


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--source", default="data/arc1-training")
    ap.add_argument("--baseline", default="results/stage_b/per_task.csv")
    ap.add_argument("--out", default="results/stage_c/validation")
    args = ap.parse_args()
    out = Path(args.out)
    out.mkdir(parents=True, exist_ok=True)
    baseline = {}
    bp = Path(args.baseline)
    if bp.exists():
        with open(bp, encoding="utf-8", newline="") as f:
            for r in csv.DictReader(f):
                if r["config"] == "BaselineA":
                    baseline[r["task_id"]] = r
    rows = []
    for p in sorted(Path(args.source).glob("*.json")):
        with open(p, encoding="utf-8") as f:
            task = json.load(f)
        if not isinstance(task, dict) or "train" not in task:
            continue
        facts = classify(task["train"])
        facts["task_id"] = p.stem
        facts["coarse_class"] = coarse_class(facts)
        b = baseline.get(p.stem)
        facts["baseline_a_status"] = b["status"] if b else None
        facts["baseline_a_failure_stage"] = b["failure_stage"] if b else None
        rows.append(facts)
    card = [r for r in rows if r["baseline_a_failure_stage"] == "cardinality"]
    summary = {
        "tasks": len(rows), "baseline_a_cardinality_failures": len(card),
        "count_relation_all": dict(Counter(r["count_relation_4conn"] for r in rows)),
        "count_relation_cardinality_set": dict(Counter(r["count_relation_4conn"] for r in card)),
        "coarse_class_cardinality_set": dict(Counter(r["coarse_class"] for r in card)),
        "cardinality_set_equal_under_8conn": sum(1 for r in card if r["counts_equal_under_8conn"]),
        "cardinality_set_same_canvas": sum(1 for r in card if r["same_canvas"]),
        "cardinality_set_output_single_object": sum(1 for r in card if r["output_single_object"]),
        "cardinality_set_output_subset": sum(1 for r in card if r["output_cells_subset_of_input"]),
        "cardinality_set_input_subset": sum(1 for r in card if r["input_cells_subset_of_output"]),
        "cardinality_set_constant_difference": sum(1 for r in card if r["constant_count_difference"] is not None),
        "cardinality_set_constant_ratio": sum(1 for r in card if r["constant_count_ratio"] is not None),
        "cardinality_set_all_output_shapes_in_input": sum(1 for r in card if r["output_objects_with_input_shape_fraction"] == 1.0),
        "cardinality_set_new_output_color": sum(1 for r in card if r["output_introduces_new_color"]),
        "note": "encoder-level facts (background 0, single-colour components); not labels of the tasks' true operations",
    }
    with open(out / "cardinality_diagnosis.json", "w", encoding="utf-8", newline="\n") as f:
        json.dump({"summary": summary, "tasks": rows}, f, indent=1, ensure_ascii=False, default=str)
    cols = ["task_id", "baseline_a_status", "baseline_a_failure_stage", "train_pairs", "count_relation_4conn", "coarse_class", "same_canvas",
            "counts_equal_under_8conn", "in_counts", "out_counts", "in_counts_8", "out_counts_8", "in_pixels", "out_pixels", "in_dims", "out_dims",
            "output_cells_subset_of_input", "input_cells_subset_of_output", "output_single_object", "output_has_empty_grid", "input_single_object",
            "output_objects_with_input_shape_fraction", "same_color_sets", "output_introduces_new_color", "constant_count_ratio", "constant_count_difference"]
    with open(out / "cardinality_diagnosis.csv", "w", encoding="utf-8", newline="") as f:
        w = csv.DictWriter(f, fieldnames=cols, extrasaction="ignore")
        w.writeheader()
        for r in rows:
            w.writerow({k: (json.dumps(r[k]) if isinstance(r[k], list) else r[k]) for k in cols})
    print(json.dumps(summary, indent=1, ensure_ascii=False))


if __name__ == "__main__":
    main()
