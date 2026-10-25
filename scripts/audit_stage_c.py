#!/usr/bin/env python
"""LATIS Stage C audit -- recompute the reported figures from the raw per-task
result files. Read-only with respect to results/stage_c/arc*; writes its own
machine-readable details under results/stage_c/audit/.

  python -I scripts/audit_stage_c.py [--main results/stage_c/arc] [--idle results/stage_c/arc_idle] [--out results/stage_c/audit]

Checks
  1. Shape decomposition statistics: unit of counting, the overlap between
     "decomposed" and "truncated", per-task consistency of the c_shape_*
     counters with the per-mask records, dataset-level deduplication.
  2. Headline metrics: train-exact per configuration, new/lost vs BaselineA,
     the flow of the BaselineA cardinality set, relation-search truncation /
     timeouts / fits, diagonal-view counts -- for the main run and the idle rerun.
"""
import argparse
import csv
import json
import statistics
from collections import Counter, defaultdict
from pathlib import Path

CONFIGS = ["BaselineA", "BaselineB", "ShapeOnly", "RelationsOnly", "ObjectShapeFull", "ObjectShapeGoalDirected"]


def load_run(out):
    out = Path(out)
    manifest = json.load(open(out / "data_manifest.json", encoding="utf-8"))
    recs = defaultdict(dict)
    for t in manifest["tasks"]:
        tid = t["task_id"]
        for cfg in CONFIGS:
            p = out / "tasks" / tid / f"stage-c-{cfg}.json"
            if p.exists():
                recs[cfg][tid] = json.load(open(p, encoding="utf-8"))
    return recs


def shape_audit(recs, cfg, out):
    rows = []
    totals = Counter()
    inconsistent = []
    dataset_masks = {}
    for tid, rec in sorted(recs[cfg].items()):
        shapes = rec.get("shapes") or []
        sc = rec.get("stage_c") or {}
        masks = len(shapes)
        decomposed = sum(1 for s in shapes if s["decomposition"])
        truncated = sum(1 for s in shapes if s["truncated"])
        both = sum(1 for s in shapes if s["decomposition"] and s["truncated"])
        unrepresentable = sum(1 for s in shapes if not s["decomposition"] and not s["truncated"])
        truncated_only = truncated - both
        ast = sum(int(s["ast_size"]) for s in shapes)
        ties = sum(max(0, int(s["ties"]) - 1) for s in shapes)
        instances = sum(int(s["occurrences"]) for s in shapes)
        for s in shapes:
            dataset_masks.setdefault(s["mask"], (s["decomposition"], s["truncated"], s["ast_size"]))
        counters = {k: int(sc.get(k, 0)) for k in ("c_shape_masks", "c_shape_decomposed", "c_shape_unrepresentable", "c_shape_truncated", "c_shape_ast_total", "c_shape_ties")}
        ok = (counters["c_shape_masks"] == masks and counters["c_shape_decomposed"] == decomposed and counters["c_shape_unrepresentable"] == unrepresentable
              and counters["c_shape_truncated"] == truncated and counters["c_shape_ast_total"] == ast and counters["c_shape_ties"] == ties)
        if not ok and shapes:
            inconsistent.append(tid)
        row = {"task_id": tid, "status": rec.get("status"), "object_instances": instances, "task_distinct_masks": masks, "decomposed": decomposed,
               "decomposed_within_truncated_candidates": both, "unrepresentable_depth2": unrepresentable, "truncated_without_expression": truncated_only,
               "truncated_flag_total": truncated, "partition_check": masks == decomposed + unrepresentable + truncated_only, "ast_total": ast, "extra_minimum_ties": ties,
               "counters_consistent": ok, **counters}
        rows.append(row)
        for k in ("object_instances", "task_distinct_masks", "decomposed", "decomposed_within_truncated_candidates", "unrepresentable_depth2", "truncated_without_expression", "truncated_flag_total", "ast_total", "extra_minimum_ties"):
            totals[k] += row[k]
    with open(out / f"shape_audit_{cfg}.csv", "w", encoding="utf-8", newline="") as f:
        w = csv.DictWriter(f, fieldnames=list(rows[0].keys()))
        w.writeheader()
        w.writerows(rows)
    dd = len(dataset_masks)
    dd_dec = sum(1 for d, t, _ in dataset_masks.values() if d)
    dd_unrep = sum(1 for d, t, _ in dataset_masks.values() if not d and not t)
    dd_trunc = sum(1 for d, t, _ in dataset_masks.values() if t and not d)
    summary = {
        "config": cfg, "unit": "per task: distinct ShapeMask over every object of every training pair, input and output side; reported totals are SUMS over tasks (a mask shared by two tasks is counted twice); object instances are counted separately as 'occurrences'",
        "tasks_with_masks": sum(1 for r in rows if r["task_distinct_masks"] > 0), "totals": dict(totals),
        "partition": {"masks": totals["task_distinct_masks"], "decomposed + unrepresentable + truncated_without_expression": totals["decomposed"] + totals["unrepresentable_depth2"] + totals["truncated_without_expression"],
                      "reported_sum_decomposed+unrepresentable+truncated_flag": totals["decomposed"] + totals["unrepresentable_depth2"] + totals["truncated_flag_total"],
                      "difference_explained_by_overlap": totals["decomposed_within_truncated_candidates"]},
        "coverage": {"decomposed_over_task_distinct_masks": totals["decomposed"] / totals["task_distinct_masks"] if totals["task_distinct_masks"] else None,
                     "decomposed_with_guaranteed_minimum_over_task_distinct_masks": (totals["decomposed"] - totals["decomposed_within_truncated_candidates"]) / totals["task_distinct_masks"] if totals["task_distinct_masks"] else None,
                     "decomposed_over_object_instances_note": "not computable from the records without per-instance flags; occurrences are reported per mask"},
        "ast": {"sum_over_decomposed_masks": totals["ast_total"], "mean_over_decomposed_masks": totals["ast_total"] / totals["decomposed"] if totals["decomposed"] else None,
                "note": "ast_size is 0 for masks without an expression, so the sum ranges over decomposed masks only"},
        "ties": {"sum_of_(ties-1)_over_masks": totals["extra_minimum_ties"], "note": "dcTies counts ALL minimum-size expressions including primitive aliases (a 1x1 pixel is Square, Rectangle, two DiagonalBars and four Triangles: ties=8)"},
        "dataset_level_distinct_masks": {"count": dd, "decomposed": dd_dec, "unrepresentable_depth2": dd_unrep, "truncated_without_expression": dd_trunc},
        "per_task_counter_inconsistencies": inconsistent,
    }
    json.dump(summary, open(out / f"shape_summary_{cfg}.json", "w", encoding="utf-8"), indent=1, ensure_ascii=False)
    return summary


def metrics_recheck(recs, label):
    res = {"run": label}
    base = recs["BaselineA"]
    base_exact = {t for t, r in base.items() if r.get("status") == "train_exact"}
    card = {t for t, r in base.items() if r.get("failure_stage") == "cardinality"}
    res["baseline_a_train_exact"] = sorted(base_exact)
    res["cardinality_set_size"] = len(card)
    per = {}
    for cfg in CONFIGS:
        rs = recs[cfg]
        exact = {t for t, r in rs.items() if r.get("status") == "train_exact"}
        sc = lambda t, k: int((rs[t].get("stage_c") or {}).get(k, 0))
        card_rows = [t for t in card if t in rs]
        flow = Counter((rs[t].get("failure_stage") or rs[t].get("status")) for t in card_rows)
        per[cfg] = {
            "tasks": len(rs), "train_exact": len(exact), "train_exact_ids": sorted(exact),
            "new_vs_baseline_a": sorted(exact - base_exact), "lost_vs_baseline_a": sorted(base_exact - exact),
            "timeouts": sorted(t for t, r in rs.items() if r.get("status") == "timeout"),
            "relation_entered_tasks": sum(1 for t in rs if sc(t, "c_relation_triggered") > 0),
            "relation_found_fit_tasks": sum(1 for t in rs if sc(t, "c_relation_fits") > 0),
            "relation_truncated_tasks": sum(1 for t in rs if sc(t, "c_relation_truncated") > 0),
            "relation_executions": sum(sc(t, "c_relation_executions") for t in rs), "relation_tried": sum(sc(t, "c_relation_tried") for t in rs),
            "relation_candidates": sum(sc(t, "c_relation_candidates") for t in rs),
            "relation_fit_but_not_exact": sorted(t for t in rs if sc(t, "c_relation_fits") > 0 and rs[t].get("status") != "train_exact"),
            "cardinality_set": {"size": len(card_rows), "entered": sum(1 for t in card_rows if sc(t, "c_relation_triggered") > 0),
                                "found_fit": sum(1 for t in card_rows if sc(t, "c_relation_fits") > 0),
                                "train_exact": sorted(t for t in card_rows if rs[t].get("status") == "train_exact"),
                                "first_rejection_flow": dict(flow)},
            "diagonal_chains_accepted": sum(sc(t, "c_diagonal_chains_accepted") for t in rs), "diagonal_chains_rejected": sum(sc(t, "c_diagonal_chains_rejected") for t in rs),
            "tasks_with_accepted_chains": sum(1 for t in rs if sc(t, "c_diagonal_chains_accepted") > 0),
            "search_work_sum": sum(int(rs[t].get("search_work") or 0) for t in rs),
            "wall_sum": round(sum(float(rs[t].get("wall_clock_seconds") or 0) for t in rs), 1),
        }
    res["per_config"] = per
    return res


def compare_runs(a, b):
    out = {}
    for cfg in CONFIGS:
        ra, rb = a[cfg], b[cfg]
        common = [t for t in ra if t in rb]
        same_status = [t for t in common if ra[t].get("status") == rb[t].get("status")]
        both_done = [t for t in common if ra[t].get("status") != "timeout" and rb[t].get("status") != "timeout"]
        same_work = [t for t in both_done if ra[t].get("search_work") == rb[t].get("search_work")]
        out[cfg] = {"common": len(common), "same_status": len(same_status), "status_diffs": [(t, ra[t].get("status"), rb[t].get("status")) for t in common if ra[t].get("status") != rb[t].get("status")],
                    "both_finished": len(both_done), "identical_search_work": len(same_work),
                    "work_diffs": [(t, ra[t].get("search_work"), rb[t].get("search_work")) for t in both_done if ra[t].get("search_work") != rb[t].get("search_work")][:10]}
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--main", default="results/stage_c/arc")
    ap.add_argument("--idle", default="results/stage_c/arc_idle")
    ap.add_argument("--out", default="results/stage_c/audit")
    args = ap.parse_args()
    out = Path(args.out)
    out.mkdir(parents=True, exist_ok=True)
    main_recs = load_run(args.main)
    report = {"shape": {}, "metrics": {}, "runs_compared": None}
    for cfg in ("ObjectShapeFull", "ShapeOnly", "ObjectShapeGoalDirected"):
        report["shape"][cfg] = shape_audit(main_recs, cfg, out)
    report["metrics"]["main"] = metrics_recheck(main_recs, args.main)
    if Path(args.idle).exists():
        idle_recs = load_run(args.idle)
        report["metrics"]["idle"] = metrics_recheck(idle_recs, args.idle)
        report["runs_compared"] = compare_runs(main_recs, idle_recs)
    json.dump(report, open(out / "audit_recheck.json", "w", encoding="utf-8"), indent=1, ensure_ascii=False)
    # cardinality flow CSV (main run)
    base = main_recs["BaselineA"]
    card = sorted(t for t, r in base.items() if r.get("failure_stage") == "cardinality")
    with open(out / "cardinality_flow.csv", "w", encoding="utf-8", newline="") as f:
        w = csv.writer(f)
        w.writerow(["task_id"] + [f"{c}_status" for c in CONFIGS] + [f"{c}_first_rejection" for c in CONFIGS] + ["Full_relation_triggered", "Full_relation_tried", "Full_relation_fits", "Full_relation_truncated"])
        for t in card:
            full = main_recs["ObjectShapeFull"].get(t, {})
            sc = full.get("stage_c") or {}
            w.writerow([t] + [main_recs[c].get(t, {}).get("status") for c in CONFIGS] + [main_recs[c].get(t, {}).get("failure_stage") for c in CONFIGS]
                       + [sc.get("c_relation_triggered"), sc.get("c_relation_tried"), sc.get("c_relation_fits"), sc.get("c_relation_truncated")])
    s = report["shape"]["ObjectShapeFull"]
    print(json.dumps({"shape_ObjectShapeFull": {"totals": s["totals"], "partition": s["partition"], "coverage": s["coverage"], "dataset_level": s["dataset_level_distinct_masks"], "inconsistent_tasks": s["per_task_counter_inconsistencies"]}}, indent=1, ensure_ascii=False))
    for run in ("main", "idle"):
        if run in report["metrics"]:
            m = report["metrics"][run]
            print(run, "cardinality set", m["cardinality_set_size"])
            for cfg in CONFIGS:
                p = m["per_config"][cfg]
                print(f"  {cfg}: exact {p['train_exact']} new {p['new_vs_baseline_a']} lost {p['lost_vs_baseline_a']} timeouts {p['timeouts']} | relation entered/fit/trunc {p['relation_entered_tasks']}/{p['relation_found_fit_tasks']}/{p['relation_truncated_tasks']} fit-not-exact {p['relation_fit_but_not_exact']} | card {p['cardinality_set']} | diag {p['diagonal_chains_accepted']}/{p['diagonal_chains_rejected']} tasks {p['tasks_with_accepted_chains']}")
    if report["runs_compared"]:
        for cfg, c in report["runs_compared"].items():
            print("compare", cfg, c)


if __name__ == "__main__":
    main()
