#!/usr/bin/env python
"""LATIS Stage C -- real ARC-AGI-1 train-only ablation driver.

Runs the Stage C front-end configurations (BaselineA, BaselineB, ShapeOnly,
RelationsOnly, ObjectShapeFull, ObjectShapeGoalDirected) on the official 400
training tasks under the SAME train-only isolation as the v0.6.1 / Stage A /
Stage B experiments: the solver binary only receives train-only copies
(test: []), one stage = one process, in-process wall-clock timeout plus a hard
watchdog, RTS heap limit.

Subcommands
  prepare  train-only copies + manifest + code provenance; checks the data hash
           against the v0.6.1, Stage A and Stage B runs
  run      every task x every configuration (fresh process per run)
  report   per_task.csv, metrics.csv, audit.json, new_solutions.json, summary.md;
           comparison with Stage A FullA and Stage B FullB; the three-count
           breakdown of the cardinality set (entered relation search / found an
           executable relation / full train-exact)
  all      prepare + run + report

R2 is NOT re-run; fallback tasks quote the R2 outcome recorded by the v0.6.1
experiment, labelled as such.
"""
import argparse
import csv
import json
import statistics
import sys
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
from datetime import datetime, timezone
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import arc_train_only as base  # noqa: E402
import arc_stage_a as stage_a  # noqa: E402

ROOT = base.ROOT
DEFAULT_OUT = ROOT / "results" / "stage_c" / "arc"
DEFAULT_BIN = ROOT / "build" / "latis-stage-c.exe"
V061_OUT = ROOT / "results" / "arc_agi1_train_only_fallback"
STAGE_A_OUT = ROOT / "results" / "stage_a" / "arc"
STAGE_B_OUT = ROOT / "results" / "stage_b" / "arc"
CONFIGS = ["BaselineA", "BaselineB", "ShapeOnly", "RelationsOnly", "ObjectShapeFull", "ObjectShapeGoalDirected"]
STATUSES = stage_a.STATUSES
STAGES = ("none", "layout_guard", "grounding", "size_rule", "cardinality", "relation_search", "shape_decomposition", "alignment_validation", "alignment",
          "transformation", "grid_realization", "grid_exact_check", "render", "other")
C_METRICS = ("c_relation_triggered c_relation_trigger_cardinality c_relation_trigger_fallback c_relation_candidates c_relation_tried c_relation_executions "
             "c_relation_fits c_relation_truncated c_relation_selected_cost c_relation_shape_used c_object_count_exact c_object_transform_exact "
             "c_shape_masks c_shape_decomposed c_shape_decomposed_truncated c_shape_unrepresentable c_shape_truncated c_shape_ast_total c_shape_ties c_shape_work "
             "c_diagonal_chains_accepted c_diagonal_chains_rejected c_view_pixels_merged c_size_object_features").split()
B_METRICS = ("b_snapshots_built b_snapshot_work b_graph_nodes b_graph_classes b_graph_truncations b_edges_confirmed b_edges_pending b_vsa_nodes b_vsa_expanded "
             "b_dag_evaluations b_reference_evaluations b_class_checks b_row_lookups b_hierarchy_slots b_hierarchy_solved_slots b_global_truncations "
             "b_goal_leaves_dropped b_goal_cache_hits b_goal_queries b_goal_level1_hits b_goal_level2_builds").split()

csv.field_size_limit(2**31 - 1)


def log(msg):
    base.log(msg)


def stage_name(cfg):
    return f"stage-c-{cfg}"


# --------------------------------------------------------------------------- prepare

def cmd_prepare(args):
    base.cmd_prepare(args)
    out = Path(args.out)
    manifest = base.read_json(out / "data_manifest.json")
    check = {}
    for label, ref in (("v061", V061_OUT / "data_manifest.json"), ("stage_a", STAGE_A_OUT / "data_manifest.json"), ("stage_b", STAGE_B_OUT / "data_manifest.json")):
        check[f"{label}_manifest_found"] = ref.exists()
        if ref.exists():
            old = base.read_json(ref)
            check[f"{label}_combined_sha256"] = old["combined_sha256_of_task_hashes"]
            same = old["combined_sha256_of_task_hashes"] == manifest["combined_sha256_of_task_hashes"] or bool(args.limit or args.tasks)
            check[f"identical_data_vs_{label}"] = same
            if not same:
                sys.exit(f"data manifest differs from the {label} run; refusing to compare")
    check["stage_c_combined_sha256"] = manifest["combined_sha256_of_task_hashes"]
    code = base.read_json(out / "code_version.json")
    code["feature_stage"] = "Synthesis.Collection.Front.frontSearch SafeOnline with ARC.StageCEvaluate configurations (stage-c-<Config>)"
    code["stage_c_configs"] = CONFIGS
    code["r2_stage"] = "not re-run in Stage C; R2 outcomes quoted from results/arc_agi1_train_only_fallback"
    code["data_check"] = check
    code["run_id"] = datetime.now(timezone.utc).strftime("stage-c-%Y%m%dT%H%M%SZ")
    base.write_json(out / "code_version.json", code)
    log(f"data check: {check}; run_id {code['run_id']}")


# --------------------------------------------------------------------------- run

def run_task(binary, out, task, configs, timeout_ms, force):
    task_id = task["task_id"]
    task_dir = out / "tasks" / task_id
    results = {}
    for cfg in configs:
        f = task_dir / f"{stage_name(cfg)}.json"
        if f.exists() and not force:
            results[cfg] = base.read_json(f)
            continue
        if not task["parse_ok"]:
            results[cfg] = {"status": "unsupported", "detail": f"parse: {task['parse_error']}"}
            continue
        results[cfg] = stage_a.run_stage(binary, cfg, out / task["train_only_file"], task_dir, timeout_ms)
    return task_id, results


def cmd_run(args):
    out = Path(args.out)
    manifest = base.read_json(out / "data_manifest.json")
    binary = Path(args.binary)
    if not binary.exists():
        sys.exit(f"binary not found: {binary}")
    tasks = manifest["tasks"]
    if args.tasks:
        wanted = set(args.tasks.split(","))
        tasks = [t for t in tasks if t["task_id"] in wanted]
    if args.limit:
        tasks = tasks[: args.limit]
    configs = args.configs.split(",") if args.configs else CONFIGS
    stage_a.stage_name = stage_name
    log(f"running {len(tasks)} tasks x {len(configs)} configs with {args.workers} workers; feature timeout {args.feature_timeout_ms} ms")
    meta = {"started_utc": datetime.now(timezone.utc).isoformat(), "workers": args.workers, "configs": configs,
            "feature_timeout_ms": args.feature_timeout_ms, "task_count": len(tasks), "rts": f"-M{base.RTS_MAX_HEAP} -T"}
    base.write_json(out / "run_meta.json", meta)
    started = time.monotonic()
    done = 0
    with ThreadPoolExecutor(max_workers=args.workers) as pool:
        futures = {pool.submit(run_task, binary, out, t, configs, args.feature_timeout_ms, args.force): t for t in tasks}
        for fut in as_completed(futures):
            t = futures[fut]
            try:
                tid, res = fut.result()
                done += 1
                log(f"[{done}/{len(tasks)}] {tid} " + " ".join(f"{c}={res[c].get('status')}" for c in configs) + f" t={time.monotonic()-started:.0f}s")
            except Exception as e:
                log(f"[driver error] {t['task_id']}: {e}")
    meta["finished_utc"] = datetime.now(timezone.utc).isoformat()
    meta["wall_clock_seconds"] = time.monotonic() - started
    base.write_json(out / "run_meta.json", meta)


# --------------------------------------------------------------------------- report

def load_csv(p, key):
    if not p.exists():
        return {}
    with open(p, encoding="utf-8", newline="") as f:
        return {(r[key[0]], r[key[1]]) if isinstance(key, tuple) else r[key]: r for r in csv.DictReader(f)}


def to_int(x):
    try:
        return int(x)
    except (TypeError, ValueError):
        return None


def stats(values):
    vals = [v for v in values if v is not None]
    if not vals:
        return {"count": 0, "sum": 0, "median": None, "max": None}
    return {"count": len(vals), "sum": sum(vals), "median": statistics.median(vals), "max": max(vals)}


def cmd_report(args):
    out = Path(args.out)
    manifest = base.read_json(out / "data_manifest.json")
    code = base.read_json(out / "code_version.json") if (out / "code_version.json").exists() else {}
    meta = base.read_json(out / "run_meta.json") if (out / "run_meta.json").exists() else {}
    configs = (meta.get("configs") or CONFIGS)
    v061 = stage_a.load_v061()
    stage_b_rows = load_csv(STAGE_B_OUT / "per_task.csv", ("task_id", "config"))
    fullb = {tid: r for (tid, cfg), r in stage_b_rows.items() if cfg == "FullB"}
    fulla = {tid: r for (tid, cfg), r in load_csv(STAGE_A_OUT / "per_task.csv", ("task_id", "config")).items() if cfg == "FullA"}
    fulla_source = str(STAGE_A_OUT / "per_task.csv")
    if not fulla:
        # the Stage A result directory is not present; the Stage B run verified BaselineA == FullA on all 400 tasks
        fulla = {tid: r for (tid, cfg), r in stage_b_rows.items() if cfg == "BaselineA"}
        fulla_source = str(STAGE_B_OUT / "per_task.csv") + " (BaselineA rows, verified identical to Stage A FullA)"
    if not v061:
        # the v0.6.1 result directory is not present; the Stage B per-task rows carry the quoted R2 status
        v061 = {tid: {"r2_status": r.get("v061_r2_status")} for (tid, cfg), r in stage_b_rows.items() if r.get("v061_r2_status")}
    diag_path = ROOT / "results" / "stage_c" / "validation" / "cardinality_diagnosis.json"
    diag = {t["task_id"]: t for t in base.read_json(diag_path)["tasks"]} if diag_path.exists() else {}
    rows, audit = [], {}
    for t in manifest["tasks"]:
        tid = t["task_id"]
        task_dir = out / "tasks" / tid
        audit[tid] = {}
        for cfg in configs:
            rec = base.load_stage(task_dir, stage_name(cfg))
            if rec is None:
                rows.append({"task_id": tid, "config": cfg, "ran": False})
                continue
            typed = rec.get("typed_holes") or {}
            size = rec.get("size_rule") or {}
            sc = rec.get("stage_c") or {}
            sb = rec.get("stage_b") or {}
            rels = rec.get("relations") or []
            shapes = rec.get("shapes") or []
            row = {"task_id": tid, "config": cfg, "ran": True, "train_pairs": t.get("train_pairs"), "status": rec.get("status"), "detail": rec.get("detail", ""),
                   "failure_stage": rec.get("failure_stage", ""), "canvas_changed": rec.get("canvas_changed"), "size_rule_exact": rec.get("size_rule_exact"),
                   "size_rule": size.get("rule") if isinstance(size, dict) else None, "grid_realization_ok": rec.get("grid_realization_ok"),
                   "object_count_exact": rec.get("object_count_exact"), "object_transform_exact": rec.get("object_transform_exact"),
                   "object_transform": rec.get("object_transform"), "relations_surviving": len(rels), "shape_masks": len(shapes),
                   "shape_decomposed": len([s for s in shapes if s.get("decomposition")]),
                   "shape_decomposed_truncated": len([s for s in shapes if s.get("decomposition") and s.get("truncated")]),
                   "shape_unrepresentable": len([s for s in shapes if not s.get("decomposition") and not s.get("truncated")]),
                   "shape_truncated_no_expression": len([s for s in shapes if not s.get("decomposition") and s.get("truncated")]),
                   "shape_instances": sum(int(s.get("occurrences") or 0) for s in shapes),
                   "typed_hole_slots_triggered": to_int(typed.get("typed_hole_slots_triggered")), "typed_hole_evaluations": to_int(typed.get("typed_hole_evaluations")),
                   "typed_hole_truncations": to_int(typed.get("typed_hole_truncations")),
                   "search_work": rec.get("search_work"), "seconds": rec.get("wall_clock_seconds"), "timed_out": rec.get("timed_out"), "hard_kill": rec.get("hard_kill", False),
                   "rts_max_live_bytes": to_int(rec.get("rts_max_live_bytes")), "program": rec.get("program"), "hole_bindings": json.dumps(rec.get("hole_bindings") or [], ensure_ascii=False),
                   "v061_r2_status": (v061.get(tid) or {}).get("r2_status"), "stage_a_fulla_status": (fulla.get(tid) or {}).get("status"),
                   "stage_b_fullb_status": (fullb.get(tid) or {}).get("status"),
                   "count_relation_4conn": (diag.get(tid) or {}).get("count_relation_4conn"), "baseline_a_stage_b_run": (diag.get(tid) or {}).get("baseline_a_failure_stage")}
            for k in C_METRICS:
                row[k] = to_int(sc.get(k))
            for k in B_METRICS:
                row[k] = to_int(sb.get(k))
            rows.append(row)
            audit[tid][cfg] = {"status": rec.get("status"), "detail": rec.get("detail"), "failure_stage": rec.get("failure_stage"), "program": rec.get("program"),
                               "object_transform": rec.get("object_transform"), "relations": rels, "shapes": shapes[:40], "stage_c": sc, "stage_b": sb,
                               "typed_holes": typed, "size_rule": size, "search_work": rec.get("search_work"), "wall_clock_seconds": rec.get("wall_clock_seconds"),
                               "hole_bindings": rec.get("hole_bindings"), "diagnostics": rec.get("diagnostics")}
    total = len(manifest["tasks"])
    by_cfg = {c: [r for r in rows if r.get("config") == c and r.get("ran")] for c in configs}
    base_rows = {r["task_id"]: r for r in by_cfg.get("BaselineA", [])}
    fulla_exact = sorted(tid for tid, r in fulla.items() if r.get("status") == "train_exact")
    fullb_exact = sorted(tid for tid, r in fullb.items() if r.get("status") == "train_exact")
    # the cardinality set: tasks BaselineA (this run) rejects at the cardinality precondition
    card_set = sorted(r["task_id"] for r in by_cfg.get("BaselineA", []) if r.get("failure_stage") == "cardinality")
    metrics = {"experiment": "LATIS Stage C real ARC-AGI-1 train-only ablations", "total_tasks": total, "configs": configs, "code_version": code, "run": meta,
               "per_config": {}, "stage_a_reference": {"available": bool(fulla), "source": fulla_source, "fulla_train_exact_ids": fulla_exact},
               "stage_b_reference": {"available": bool(fullb), "fullb_train_exact_ids": fullb_exact}, "cardinality_set_size": len(card_set)}
    csv_rows = []
    for cfg in configs:
        rs = by_cfg[cfg]
        st = {s: len([r for r in rs if r["status"] == s]) for s in STATUSES}
        stages = {s: len([r for r in rs if r["status"] != "train_exact" and (r.get("failure_stage") or "other") == s]) for s in STAGES}
        exact_ids = sorted(r["task_id"] for r in rs if r["status"] == "train_exact")
        fallback = [r for r in rs if r["status"] != "train_exact"]
        r2_prior = {k: len([r for r in fallback if (r.get("v061_r2_status") or "not_run") == k]) for k in ("train_exact", "no_solution", "timeout", "unsupported", "runtime_error", "not_run")}
        card_rows = [r for r in rs if r["task_id"] in card_set]
        entered = [r for r in card_rows if (r.get("c_relation_triggered") or 0) > 0]
        found = [r for r in entered if (r.get("c_relation_fits") or 0) > 0]
        card_exact = [r for r in card_rows if r["status"] == "train_exact"]
        same_as_ref = None
        if cfg == "BaselineA" and fulla:
            same_as_ref = {"reference": "Stage A FullA", "status_identical": len([r for r in rs if r["status"] == (fulla.get(r["task_id"]) or {}).get("status")]),
                           "program_identical": len([r for r in rs if (r.get("program") or "") == ((fulla.get(r["task_id"]) or {}).get("program") or "")]), "n": len(rs)}
        if cfg == "BaselineB" and fullb:
            same_as_ref = {"reference": "Stage B FullB", "status_identical": len([r for r in rs if r["status"] == (fullb.get(r["task_id"]) or {}).get("status")]),
                           "program_identical": len([r for r in rs if (r.get("program") or "") == ((fullb.get(r["task_id"]) or {}).get("program") or "")]), "n": len(rs)}
        per = {"tasks_run": len(rs), "status_counts": st, "train_exact_rate": (st["train_exact"] / total) if total else None, "fallback_count": len(fallback),
               "failure_stage_counts": stages, "train_exact_task_ids": exact_ids,
               "new_vs_stage_a_fulla": sorted(set(exact_ids) - set(fulla_exact)), "lost_vs_stage_a_fulla": sorted((set(fulla_exact) & set(r["task_id"] for r in rs)) - set(exact_ids)),
               "new_vs_stage_b_fullb": sorted(set(exact_ids) - set(fullb_exact)), "lost_vs_stage_b_fullb": sorted((set(fullb_exact) & set(r["task_id"] for r in rs)) - set(exact_ids)),
               "new_vs_baseline_a": sorted(set(exact_ids) - set(base_rows) | set()) if False else sorted(set(exact_ids) - set(k for k, v in base_rows.items() if v["status"] == "train_exact")),
               "lost_vs_baseline_a": sorted(set(k for k, v in base_rows.items() if v["status"] == "train_exact") - set(exact_ids)),
               "search_work": stats([r.get("search_work") for r in rs]), "wall_clock_seconds": stats([r.get("seconds") for r in rs]),
               "peak_rts_max_live_bytes": max([r.get("rts_max_live_bytes") or 0 for r in rs] or [0]),
               "timeouts": st["timeout"], "hard_kills": len([r for r in rs if r.get("hard_kill")]),
               "size_rule_exact_tasks": len([r for r in rs if r.get("size_rule_exact") in (True, "True", "true")]),
               "object_count_exact_tasks": len([r for r in rs if r.get("object_count_exact") in (True, "True", "true")]),
               "object_transform_exact_tasks": len([r for r in rs if r.get("object_transform_exact") in (True, "True", "true")]),
               "relation_search_entered_tasks": len([r for r in rs if (r.get("c_relation_triggered") or 0) > 0]),
               "relation_search_found_fit_tasks": len([r for r in rs if (r.get("c_relation_fits") or 0) > 0]),
               "relation_trigger_cardinality_tasks": len([r for r in rs if (r.get("c_relation_trigger_cardinality") or 0) > 0]),
               "relation_trigger_fallback_tasks": len([r for r in rs if (r.get("c_relation_trigger_fallback") or 0) > 0]),
               "relation_truncated_tasks": len([r for r in rs if (r.get("c_relation_truncated") or 0) > 0]),
               "cardinality_set": {"size": len(card_rows), "entered_relation_search": len(entered), "found_executable_relation": len(found), "full_train_exact": len(card_exact),
                                   "train_exact_ids": sorted(r["task_id"] for r in card_exact), "found_but_not_exact_ids": sorted(set(r["task_id"] for r in found) - set(r["task_id"] for r in card_exact))},
               "c_sums": {k: sum((r.get(k) or 0) for r in rs) for k in C_METRICS},
               "b_sums": {k: sum((r.get(k) or 0) for r in rs) for k in B_METRICS},
               "shape": {"unit": "sum over tasks of task-level distinct masks (input+output, all training pairs); object instances separately",
                         "tasks_with_masks": len([r for r in rs if (r.get("c_shape_masks") or 0) > 0]), "masks": sum((r.get("c_shape_masks") or 0) for r in rs),
                         "object_instances": sum((r.get("shape_instances") or 0) for r in rs),
                         "decomposed": sum((r.get("c_shape_decomposed") or 0) for r in rs),
                         "decomposed_within_truncated_candidates": sum((r.get("shape_decomposed_truncated") or 0) for r in rs),
                         "unrepresentable": sum((r.get("c_shape_unrepresentable") or 0) for r in rs),
                         "truncated_flag": sum((r.get("c_shape_truncated") or 0) for r in rs),
                         "truncated_without_expression": sum((r.get("shape_truncated_no_expression") or 0) for r in rs),
                         "ast_total": sum((r.get("c_shape_ast_total") or 0) for r in rs),
                         "ties": sum((r.get("c_shape_ties") or 0) for r in rs), "work": sum((r.get("c_shape_work") or 0) for r in rs)},
               "diagonal_view": {"chains_accepted": sum((r.get("c_diagonal_chains_accepted") or 0) for r in rs), "chains_rejected": sum((r.get("c_diagonal_chains_rejected") or 0) for r in rs),
                                 "pixels_merged": sum((r.get("c_view_pixels_merged") or 0) for r in rs), "tasks_with_chains": len([r for r in rs if (r.get("c_diagonal_chains_accepted") or 0) > 0])},
               "r2_prior_outcome_among_fallbacks": r2_prior, "r2_note": "R2 was not re-run; counts quote the v0.6.1 R2 stage", "same_as_reference": same_as_ref}
        metrics["per_config"][cfg] = per
        csv_rows.append({"config": cfg, "tasks_run": len(rs), **{f"status_{s}": st[s] for s in STATUSES}, "train_exact_rate": per["train_exact_rate"],
                         **{f"stage_{s}": stages[s] for s in STAGES}, "new_vs_fulla": ";".join(per["new_vs_stage_a_fulla"]), "lost_vs_fulla": ";".join(per["lost_vs_stage_a_fulla"]),
                         "new_vs_fullb": ";".join(per["new_vs_stage_b_fullb"]), "lost_vs_fullb": ";".join(per["lost_vs_stage_b_fullb"]),
                         "new_vs_baseline_a": ";".join(per["new_vs_baseline_a"]), "lost_vs_baseline_a": ";".join(per["lost_vs_baseline_a"]),
                         "search_work_sum": per["search_work"]["sum"], "search_work_median": per["search_work"]["median"], "search_work_max": per["search_work"]["max"],
                         "wall_sum_s": per["wall_clock_seconds"]["sum"], "wall_median_s": per["wall_clock_seconds"]["median"], "wall_max_s": per["wall_clock_seconds"]["max"],
                         "peak_rts_max_live_bytes": per["peak_rts_max_live_bytes"], "timeouts": per["timeouts"], "hard_kills": per["hard_kills"],
                         "size_rule_exact_tasks": per["size_rule_exact_tasks"], "object_count_exact_tasks": per["object_count_exact_tasks"], "object_transform_exact_tasks": per["object_transform_exact_tasks"],
                         "relation_entered": per["relation_search_entered_tasks"], "relation_found_fit": per["relation_search_found_fit_tasks"],
                         "card_entered": per["cardinality_set"]["entered_relation_search"], "card_found": per["cardinality_set"]["found_executable_relation"], "card_exact": per["cardinality_set"]["full_train_exact"],
                         **{f"sum_{k}": per["c_sums"][k] for k in C_METRICS}, **{f"sum_{k}": per["b_sums"][k] for k in B_METRICS}})
    if "ObjectShapeFull" in by_cfg and base_rows:
        trans, detail = {}, {}
        for r in by_cfg["ObjectShapeFull"]:
            b = base_rows.get(r["task_id"])
            if b:
                trans.setdefault(f"{b.get('failure_stage') or 'none'} -> {r.get('failure_stage') or 'none'}", []).append(r["task_id"])
            if r["status"] != "train_exact":
                detail.setdefault((r.get("detail") or "")[:120], []).append(r["task_id"])
        metrics["full_vs_baseline_a_failure_stage_transitions"] = {k: {"count": len(v), "task_ids": sorted(v)[:60]} for k, v in sorted(trans.items(), key=lambda kv: -len(kv[1]))}
        metrics["full_failure_details"] = {k: {"count": len(v), "task_ids": sorted(v)} for k, v in sorted(detail.items(), key=lambda kv: -len(kv[1]))[:40]}
        metrics["program_changes_full_vs_baseline_a"] = sorted(r["task_id"] for r in by_cfg["ObjectShapeFull"] if r["status"] == "train_exact" and base_rows.get(r["task_id"], {}).get("status") == "train_exact"
                                                             and (r.get("program") or "") != (base_rows[r["task_id"]].get("program") or ""))
    # goal-directed vs original Stage B snapshot (same Stage B flags)
    if "ObjectShapeGoalDirected" in by_cfg and "BaselineB" in by_cfg:
        gd = {r["task_id"]: r for r in by_cfg["ObjectShapeGoalDirected"]}
        bb = {r["task_id"]: r for r in by_cfg["BaselineB"]}
        common = [tid for tid in gd if tid in bb and ((gd[tid].get("b_snapshots_built") or 0) > 0 or (bb[tid].get("b_snapshots_built") or 0) > 0)]
        metrics["goal_directed_vs_baseline_b"] = {"snapshot_tasks": len(common),
                                                  **{k: {"goal_directed": sum((gd[t].get(k) or 0) for t in common), "baseline_b": sum((bb[t].get(k) or 0) for t in common)}
                                                     for k in ("b_graph_nodes", "b_snapshot_work", "b_dag_evaluations", "b_reference_evaluations", "b_hierarchy_solved_slots", "b_row_lookups", "b_goal_leaves_dropped", "b_goal_cache_hits", "b_goal_queries")}}
    base.write_json(out / "metrics.json", metrics)
    base.write_json(out / "audit.json", audit)
    # new solutions: full program, transformation, witnesses, per-case grid check (train_exact is re-verified by the binary)
    new_sol = {}
    for cfg in configs:
        for tid in metrics["per_config"][cfg]["new_vs_stage_a_fulla"]:
            a = audit[tid][cfg]
            new_sol.setdefault(tid, {})[cfg] = {"program": a["program"], "object_transform": a["object_transform"], "relations": a["relations"], "size_rule": a["size_rule"],
                                                "hole_bindings": a["hole_bindings"], "diagnostics": a["diagnostics"], "whole_grid_exact_on_every_training_pair": True}
    base.write_json(out / "new_solutions.json", new_sol)
    stage_dir = out.parent
    cols = ["task_id", "config", "ran", "train_pairs", "status", "failure_stage", "detail", "canvas_changed", "size_rule_exact", "size_rule", "grid_realization_ok",
            "object_count_exact", "object_transform_exact", "object_transform", "relations_surviving", "shape_masks", "shape_decomposed", "shape_decomposed_truncated", "shape_unrepresentable", "shape_truncated_no_expression", "shape_instances",
            "typed_hole_slots_triggered", "typed_hole_evaluations", "typed_hole_truncations", "search_work", "seconds", "timed_out", "hard_kill",
            "rts_max_live_bytes", "count_relation_4conn", "baseline_a_stage_b_run"] + C_METRICS + B_METRICS + ["v061_r2_status", "stage_a_fulla_status", "stage_b_fullb_status", "hole_bindings", "program"]
    for target in (out / "per_task.csv", stage_dir / "per_task.csv"):
        with open(target, "w", encoding="utf-8", newline="") as f:
            w = csv.DictWriter(f, fieldnames=cols, extrasaction="ignore")
            w.writeheader()
            for r in rows:
                w.writerow({k: ("" if r.get(k) is None else r.get(k)) for k in cols})
    for target in (out / "metrics.csv", stage_dir / "metrics.csv"):
        with open(target, "w", encoding="utf-8", newline="") as f:
            w = csv.DictWriter(f, fieldnames=list(csv_rows[0].keys()) if csv_rows else ["config"])
            w.writeheader()
            for r in csv_rows:
                w.writerow(r)
    write_summary(out, metrics)
    log(f"report written: {out/'metrics.json'}, {stage_dir/'metrics.csv'}, {stage_dir/'per_task.csv'}, {out/'audit.json'}, {out/'new_solutions.json'}")


def fmt(n, d):
    return "N/A" if not d else f"{n}/{d} = {100.0*n/d:.2f}%"


def write_summary(out, m):
    T = m["total_tasks"]
    lines = ["# LATIS Stage C：真实 ARC-AGI-1 Train-only 消融结果（自动生成）", "", f"生成时间（UTC）：{datetime.now(timezone.utc).isoformat()}", ""]
    c = m.get("code_version") or {}
    lines.append(f"- run_id `{c.get('run_id')}`；代码：git HEAD `{c.get('git_head')}`，工作区 diff 哈希 `{c.get('git_diff_sha256')}`，二进制 SHA256 `{c.get('binary_sha256')}`。")
    lines.append(f"- 数据校验：{json.dumps(c.get('data_check'), ensure_ascii=False)}")
    r = m.get("run") or {}
    lines.append(f"- 运行：{r.get('task_count')} 任务 × {len(m['configs'])} 配置，{r.get('workers')} 并行进程，Feature 墙钟 {r.get('feature_timeout_ms')} ms，RTS `{r.get('rts')}`；总墙钟 {r.get('wall_clock_seconds')}")
    lines.append(f"- Stage A FullA train-exact 参考：{', '.join(m['stage_a_reference']['fulla_train_exact_ids'])}")
    lines.append(f"- Stage B FullB train-exact 参考：{', '.join(m['stage_b_reference']['fullb_train_exact_ids'])}")
    lines.append(f"- cardinality 集合（本轮 BaselineA 在 cardinality 前提处拒绝的任务）：{m['cardinality_set_size']} 题")
    lines.append("")
    lines.append("| 配置 | train_exact | no_solution | timeout | 新增 vs FullA | 丢失 vs FullA | SizeRule-exact | Object-Count-exact | Object-Transform-exact | 进入关系搜索 | 找到可执行关系 | 关系搜索截断 | search_work 总/中位/最大 | 墙钟 总/中位/最大 (s) | 峰值 max_live_bytes |")
    lines.append("|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|")
    for cfg in m["configs"]:
        p = m["per_config"][cfg]
        st, sw, wc = p["status_counts"], p["search_work"], p["wall_clock_seconds"]
        lines.append(f"| {cfg} | {fmt(st['train_exact'], T)} | {st['no_solution']} | {st['timeout']} | {', '.join(p['new_vs_stage_a_fulla']) or '—'} | {', '.join(p['lost_vs_stage_a_fulla']) or '—'} | {p['size_rule_exact_tasks']} | {p['object_count_exact_tasks']} | {p['object_transform_exact_tasks']} | {p['relation_search_entered_tasks']} | {p['relation_search_found_fit_tasks']} | {p['relation_truncated_tasks']} | {int(sw['sum'] or 0)}/{sw['median']}/{sw['max']} | {wc['sum']:.1f}/{wc['median']:.3f}/{wc['max']:.2f} | {p['peak_rts_max_live_bytes']} |")
    lines += ["", "## cardinality 集合的三个数量（不混同）", "", "| 配置 | 集合大小 | 进入关系搜索 | 找到可执行关系 | 完整 train-exact | train-exact IDs |", "|---|---|---|---|---|---|"]
    for cfg in m["configs"]:
        cs = m["per_config"][cfg]["cardinality_set"]
        lines.append(f"| {cfg} | {cs['size']} | {cs['entered_relation_search']} | {cs['found_executable_relation']} | {cs['full_train_exact']} | {', '.join(cs['train_exact_ids']) or '—'} |")
    lines += ["", "## 首次拒绝原因分布（非 train_exact 任务）", "", "| 配置 | " + " | ".join(STAGES) + " |", "|---|" + "---|" * len(STAGES)]
    for cfg in m["configs"]:
        s = m["per_config"][cfg]["failure_stage_counts"]
        lines.append(f"| {cfg} | " + " | ".join(str(s[k]) for k in STAGES) + " |")
    lines += ["", "## Shape 分解与对角视图（统计单位：逐任务去重的 mask，跨任务求和；对象实例另列）", "",
              "| 配置 | 有对象的任务 | 对象实例 | 任务内不同 mask | 已分解（其中在截断候选集内找到） | 不可表示(深度2) | 截断且无表达式 | 分区检查 | AST 总 | 并列(ties-1) | 分解工作 | 对角链接受/拒绝 | 合并像素 | 有链任务 |",
              "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|"]
    for cfg in m["configs"]:
        p = m["per_config"][cfg]
        sh, dv = p["shape"], p["diagonal_view"]
        part = sh['decomposed'] + sh['unrepresentable'] + sh['truncated_without_expression']
        lines.append(f"| {cfg} | {sh['tasks_with_masks']} | {sh['object_instances']} | {sh['masks']} | {sh['decomposed']}（{sh['decomposed_within_truncated_candidates']}） | {sh['unrepresentable']} | {sh['truncated_without_expression']} | {part}={sh['masks']} {'✓' if part == sh['masks'] else '✗'} | {sh['ast_total']} | {sh['ties']} | {sh['work']} | {dv['chains_accepted']}/{dv['chains_rejected']} | {dv['pixels_merged']} | {dv['tasks_with_chains']} |")
    if m.get("full_vs_baseline_a_failure_stage_transitions"):
        lines += ["", "## ObjectShapeFull 相对 BaselineA 的失败环节迁移", "", "| 迁移 | 数量 |", "|---|---|"]
        for k, v in m["full_vs_baseline_a_failure_stage_transitions"].items():
            lines.append(f"| `{k}` | {v['count']} |")
    if m.get("goal_directed_vs_baseline_b"):
        g = m["goal_directed_vs_baseline_b"]
        lines += ["", f"## 目标驱动快照 vs BaselineB（{g['snapshot_tasks']} 个打开层级的任务）", "", "| 量 | ObjectShapeGoalDirected | BaselineB |", "|---|---|---|"]
        for k, v in g.items():
            if isinstance(v, dict):
                lines.append(f"| {k} | {v['goal_directed']} | {v['baseline_b']} |")
    for cfg in m["configs"]:
        p = m["per_config"][cfg]
        if p.get("same_as_reference"):
            lines += ["", f"{cfg} 与 {p['same_as_reference']['reference']} 逐题比较：状态相同 {p['same_as_reference']['status_identical']}/{p['same_as_reference']['n']}，程序相同 {p['same_as_reference']['program_identical']}/{p['same_as_reference']['n']}。"]
    if m.get("program_changes_full_vs_baseline_a") is not None:
        lines += ["", f"ObjectShapeFull 与 BaselineA 均 train-exact 但程序不同的任务：{', '.join(m['program_changes_full_vs_baseline_a']) or '—'}"]
    lines += ["", "R2 本轮未重跑；回退任务的 R2 结果引用 v0.6.1 的记录。峰值内存口径：RTS `max_live_bytes`（进程级最大值）。"]
    with open(out / "summary.md", "w", encoding="utf-8", newline="\n") as f:
        f.write("\n".join(lines) + "\n")


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    for name in ("prepare", "run", "report", "all"):
        p = sub.add_parser(name)
        base.add_common(p)
        p.set_defaults(out=str(DEFAULT_OUT), binary=str(DEFAULT_BIN))
        p.add_argument("--configs", default="", help="comma-separated subset of " + ",".join(CONFIGS))
    args = ap.parse_args()
    if args.cmd in ("prepare", "all"):
        cmd_prepare(args)
    if args.cmd in ("run", "all"):
        cmd_run(args)
    if args.cmd in ("report", "all"):
        cmd_report(args)


if __name__ == "__main__":
    main()
