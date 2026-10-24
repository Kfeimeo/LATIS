#!/usr/bin/env python
"""LATIS Stage B -- real ARC-AGI-1 train-only ablation driver.

Runs the Stage B front-end configurations (BaselineA, B0Only,
NoStructuralGeneralization, NoSharedVSA, NoHierarchy, FullB and the three
FullB schedule variants) on the official 400 training tasks under the SAME
train-only isolation as the v0.6.1 / Stage A experiments: the solver binary
only receives train-only copies (test: []), one stage = one process,
in-process wall-clock timeout plus a hard watchdog, RTS heap limit.

Subcommands
  prepare  train-only copies + manifest + code provenance; checks the data hash
           against the v0.6.1 and Stage A runs
  run      every task x every configuration (fresh process per run)
  report   per_task.csv, metrics.csv, audit.json, summary.md, comparison with Stage A FullA
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
DEFAULT_OUT = ROOT / "results" / "stage_b" / "arc"
DEFAULT_BIN = ROOT / "build" / "latis-stage-b.exe"
V061_OUT = ROOT / "results" / "arc_agi1_train_only_fallback"
STAGE_A_OUT = ROOT / "results" / "stage_a" / "arc"
CONFIGS = ["BaselineA", "B0Only", "NoStructuralGeneralization", "NoSharedVSA", "NoHierarchy", "FullB", "FullB-SpecificFirst", "FullB-CostFirst", "FullB-Interleaved"]
STATUSES = stage_a.STATUSES
STAGES = stage_a.STAGES
B_METRICS = ("b_snapshots_built b_snapshot_work b_graph_nodes b_graph_classes b_graph_templates b_graph_closed_terms b_graph_truncations b_constant_only_dropped "
             "b_edges_confirmed b_edges_pending b_edges_not_supported b_type_edges b_closure_edges b_sccs b_layers b_substitutions_tried b_outside_universe b_edge_truncations "
             "b_vsa_nodes b_vsa_unions b_vsa_expanded b_vsa_expansion_mismatch b_sharing_avg_x100 b_sharing_max_x100 b_dag_evaluations b_reference_evaluations b_witness_full "
             "b_hierarchy_slots b_hierarchy_fits b_class_checks b_row_lookups b_flat_row_evaluations b_candidates_covered b_fitting_classes b_layer_exposed b_layer_searched "
             "b_layer_truncated b_slot_truncations b_global_truncations b_hierarchy_fallbacks b_hierarchy_solved_slots").split()


def log(msg):
    base.log(msg)


def stage_name(cfg):
    return f"stage-b-{cfg}"


# --------------------------------------------------------------------------- prepare

def cmd_prepare(args):
    base.cmd_prepare(args)
    out = Path(args.out)
    manifest = base.read_json(out / "data_manifest.json")
    check = {}
    for label, ref in (("v061", V061_OUT / "data_manifest.json"), ("stage_a", STAGE_A_OUT / "data_manifest.json")):
        check[f"{label}_manifest_found"] = ref.exists()
        if ref.exists():
            old = base.read_json(ref)
            check[f"{label}_combined_sha256"] = old["combined_sha256_of_task_hashes"]
            same = old["combined_sha256_of_task_hashes"] == manifest["combined_sha256_of_task_hashes"] or bool(args.limit or args.tasks)
            check[f"identical_data_vs_{label}"] = same
            if not same:
                sys.exit(f"data manifest differs from the {label} run; refusing to compare")
    check["stage_b_combined_sha256"] = manifest["combined_sha256_of_task_hashes"]
    code = base.read_json(out / "code_version.json")
    code["feature_stage"] = "Synthesis.Collection.Front.frontSearch SafeOnline with ARC.StageBEvaluate configurations (stage-b-<Config>)"
    code["stage_b_configs"] = CONFIGS
    code["r2_stage"] = "not re-run in Stage B; R2 outcomes quoted from results/arc_agi1_train_only_fallback"
    code["data_check"] = check
    base.write_json(out / "code_version.json", code)
    log(f"data check: {check}")


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
        rec = stage_a.run_stage(binary, cfg, out / task["train_only_file"], task_dir, timeout_ms)
        results[cfg] = rec
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
    # the Stage A driver names stages stage-a-<cfg>; Stage B stages are stage-b-<cfg>
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

csv.field_size_limit(2**31 - 1)  # Stage A per_task.csv carries long program/trace fields

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
    stage_a_rows = load_csv(STAGE_A_OUT / "per_task.csv", ("task_id", "config"))
    fulla = {tid: r for (tid, cfg), r in stage_a_rows.items() if cfg == "FullA"}
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
            sb = rec.get("stage_b") or {}
            refs = rec.get("referents") or []
            row = {"task_id": tid, "config": cfg, "ran": True, "train_pairs": t.get("train_pairs"), "status": rec.get("status"), "detail": rec.get("detail", ""),
                   "failure_stage": rec.get("failure_stage", ""), "canvas_changed": rec.get("canvas_changed"), "size_rule_exact": rec.get("size_rule_exact"),
                   "size_rule": size.get("rule") if isinstance(size, dict) else None, "grid_realization_ok": rec.get("grid_realization_ok"),
                   "typed_hole_slots_triggered": to_int(typed.get("typed_hole_slots_triggered")), "typed_hole_evaluations": to_int(typed.get("typed_hole_evaluations")),
                   "typed_hole_fits": to_int(typed.get("typed_hole_fits")), "typed_hole_truncations": to_int(typed.get("typed_hole_truncations")),
                   "search_work": rec.get("search_work"), "seconds": rec.get("wall_clock_seconds"), "timed_out": rec.get("timed_out"), "hard_kill": rec.get("hard_kill", False),
                   "rts_max_live_bytes": to_int(rec.get("rts_max_live_bytes")), "program": rec.get("program"), "hole_bindings": json.dumps(rec.get("hole_bindings") or [], ensure_ascii=False),
                   "v061_r2_status": (v061.get(tid) or {}).get("r2_status"), "stage_a_fulla_status": (fulla.get(tid) or {}).get("status"),
                   "stage_a_fulla_program": (fulla.get(tid) or {}).get("program"), "referent_axes": len(refs)}
            for k in B_METRICS:
                row[k] = to_int(sb.get(k))
            rows.append(row)
            audit[tid][cfg] = {"status": rec.get("status"), "detail": rec.get("detail"), "failure_stage": rec.get("failure_stage"), "program": rec.get("program"),
                               "stage_b": sb, "referents": refs, "typed_holes": typed, "size_rule": size, "search_work": rec.get("search_work"),
                               "wall_clock_seconds": rec.get("wall_clock_seconds"), "hole_bindings": rec.get("hole_bindings")}
    total = len(manifest["tasks"])
    by_cfg = {c: [r for r in rows if r.get("config") == c and r.get("ran")] for c in configs}
    base_rows = {r["task_id"]: r for r in by_cfg.get("BaselineA", [])}
    fulla_exact = sorted(tid for tid, r in fulla.items() if r.get("status") == "train_exact")
    metrics = {"experiment": "LATIS Stage B real ARC-AGI-1 train-only ablations", "total_tasks": total, "configs": configs, "code_version": code, "run": meta,
               "per_config": {}, "stage_a_reference": {"available": bool(fulla), "source": str(STAGE_A_OUT / "per_task.csv"), "fulla_train_exact_ids": fulla_exact}}
    csv_rows = []
    for cfg in configs:
        rs = by_cfg[cfg]
        st = {s: len([r for r in rs if r["status"] == s]) for s in STATUSES}
        stages = {s: len([r for r in rs if r["status"] != "train_exact" and (r.get("failure_stage") or "other") == s]) for s in STAGES}
        exact_ids = sorted(r["task_id"] for r in rs if r["status"] == "train_exact")
        fallback = [r for r in rs if r["status"] != "train_exact"]
        r2_prior = {k: len([r for r in fallback if (r.get("v061_r2_status") or "not_run") == k]) for k in ("train_exact", "no_solution", "timeout", "unsupported", "runtime_error", "not_run")}
        snap = [r for r in rs if (r.get("b_snapshots_built") or 0) > 0]
        same_as_fulla = None
        if cfg == "BaselineA" and fulla:
            same_as_fulla = {"status_identical": len([r for r in rs if r["status"] == (fulla.get(r["task_id"]) or {}).get("status")]),
                             "program_identical": len([r for r in rs if (r.get("program") or "") == ((fulla.get(r["task_id"]) or {}).get("program") or "")]), "n": len(rs)}
        sharing = [r.get("b_sharing_avg_x100") for r in snap if r.get("b_sharing_avg_x100")]
        per = {"tasks_run": len(rs), "status_counts": st, "train_exact_rate": (st["train_exact"] / total) if total else None, "fallback_count": len(fallback),
               "failure_stage_counts": stages, "train_exact_task_ids": exact_ids,
               "new_vs_stage_a_fulla": sorted(set(exact_ids) - set(fulla_exact)), "lost_vs_stage_a_fulla": sorted((set(fulla_exact) & set(r["task_id"] for r in rs)) - set(exact_ids)),
               "new_vs_baseline_a": sorted(set(exact_ids) - set(r["task_id"] for r in by_cfg.get("BaselineA", []) if r["status"] == "train_exact")),
               "lost_vs_baseline_a": sorted(set(r["task_id"] for r in by_cfg.get("BaselineA", []) if r["status"] == "train_exact") - set(exact_ids)),
               "search_work": stats([r.get("search_work") for r in rs]), "wall_clock_seconds": stats([r.get("seconds") for r in rs]),
               "peak_rts_max_live_bytes": max([r.get("rts_max_live_bytes") or 0 for r in rs] or [0]),
               "timeouts": st["timeout"], "hard_kills": len([r for r in rs if r.get("hard_kill")]),
               "typed_hole_slots_triggered_tasks": len([r for r in rs if (r.get("typed_hole_slots_triggered") or 0) > 0]),
               "typed_hole_evaluations_sum": sum((r.get("typed_hole_evaluations") or 0) for r in rs),
               "typed_hole_truncations_sum": sum((r.get("typed_hole_truncations") or 0) for r in rs),
               "snapshot_tasks": len(snap),
               "b_sums": {k: sum((r.get(k) or 0) for r in rs) for k in B_METRICS},
               "b_max": {k: max([(r.get(k) or 0) for r in rs] or [0]) for k in ("b_graph_nodes", "b_vsa_nodes", "b_edges_confirmed", "b_layers", "b_sharing_max_x100")},
               "sharing_avg_x100_mean_over_snapshot_tasks": (sum(sharing) / len(sharing)) if sharing else None,
               "sharing_max_x100": max([r.get("b_sharing_max_x100") or 0 for r in snap] or [0]),
               "vsa_expansion_mismatches": sum((r.get("b_vsa_expansion_mismatch") or 0) for r in rs),
               "witness_coverage": {"confirmed_edges": sum((r.get("b_edges_confirmed") or 0) for r in rs), "fully_witnessed": sum((r.get("b_witness_full") or 0) for r in rs)},
               "budget_truncations": {"universe": sum((r.get("b_graph_truncations") or 0) for r in rs), "edges": sum((r.get("b_edge_truncations") or 0) for r in rs),
                                      "slots": sum((r.get("b_slot_truncations") or 0) for r in rs), "typed_holes": sum((r.get("typed_hole_truncations") or 0) for r in rs)},
               "r2_prior_outcome_among_fallbacks": r2_prior, "r2_note": "R2 was not re-run; counts quote the v0.6.1 R2 stage", "same_as_stage_a_fulla": same_as_fulla}
        metrics["per_config"][cfg] = per
        csv_rows.append({"config": cfg, "tasks_run": len(rs), **{f"status_{s}": st[s] for s in STATUSES}, "train_exact_rate": per["train_exact_rate"],
                         **{f"stage_{s}": stages[s] for s in STAGES}, "new_vs_fulla": ";".join(per["new_vs_stage_a_fulla"]), "lost_vs_fulla": ";".join(per["lost_vs_stage_a_fulla"]),
                         "new_vs_baseline_a": ";".join(per["new_vs_baseline_a"]), "lost_vs_baseline_a": ";".join(per["lost_vs_baseline_a"]),
                         "search_work_sum": per["search_work"]["sum"], "search_work_median": per["search_work"]["median"], "search_work_max": per["search_work"]["max"],
                         "wall_sum_s": per["wall_clock_seconds"]["sum"], "wall_median_s": per["wall_clock_seconds"]["median"], "wall_max_s": per["wall_clock_seconds"]["max"],
                         "peak_rts_max_live_bytes": per["peak_rts_max_live_bytes"], "timeouts": per["timeouts"], "hard_kills": per["hard_kills"],
                         "typed_hole_slots_triggered_tasks": per["typed_hole_slots_triggered_tasks"], "typed_hole_evaluations_sum": per["typed_hole_evaluations_sum"],
                         "snapshot_tasks": per["snapshot_tasks"], **{f"sum_{k}": per["b_sums"][k] for k in B_METRICS},
                         "sharing_avg_x100_mean": per["sharing_avg_x100_mean_over_snapshot_tasks"], "sharing_max_x100": per["sharing_max_x100"],
                         "vsa_expansion_mismatches": per["vsa_expansion_mismatches"], "witness_full_over_confirmed": f"{per['witness_coverage']['fully_witnessed']}/{per['witness_coverage']['confirmed_edges']}"})
    if "FullB" in by_cfg and base_rows:
        trans, detail = {}, {}
        for r in by_cfg["FullB"]:
            b = base_rows.get(r["task_id"])
            if b:
                trans.setdefault(f"{b.get('failure_stage') or 'none'} -> {r.get('failure_stage') or 'none'}", []).append(r["task_id"])
            if r["status"] != "train_exact":
                detail.setdefault((r.get("detail") or "")[:110], []).append(r["task_id"])
        metrics["fullb_vs_baseline_a_failure_stage_transitions"] = {k: {"count": len(v), "task_ids": sorted(v)[:60]} for k, v in sorted(trans.items(), key=lambda kv: -len(kv[1]))}
        metrics["fullb_failure_details"] = {k: {"count": len(v), "task_ids": sorted(v)} for k, v in sorted(detail.items(), key=lambda kv: -len(kv[1]))[:30]}
        metrics["program_changes_fullb_vs_baseline_a"] = sorted(r["task_id"] for r in by_cfg["FullB"] if r["status"] == "train_exact" and base_rows.get(r["task_id"], {}).get("status") == "train_exact"
                                                              and (r.get("program") or "") != (base_rows[r["task_id"]].get("program") or ""))
    base.write_json(out / "metrics.json", metrics)
    base.write_json(out / "audit.json", audit)
    stage_dir = out.parent
    cols = ["task_id", "config", "ran", "train_pairs", "status", "failure_stage", "detail", "canvas_changed", "size_rule_exact", "size_rule", "grid_realization_ok",
            "typed_hole_slots_triggered", "typed_hole_evaluations", "typed_hole_fits", "typed_hole_truncations", "search_work", "seconds", "timed_out", "hard_kill",
            "rts_max_live_bytes", "referent_axes"] + B_METRICS + ["v061_r2_status", "stage_a_fulla_status", "hole_bindings", "program", "stage_a_fulla_program"]
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
    # witness / candidate-graph samples: the referent summaries of the FullB train-exact tasks and of the largest snapshots
    samples = {}
    for r in by_cfg.get("FullB", []):
        if (r.get("b_snapshots_built") or 0) > 0:
            samples[r["task_id"]] = audit[r["task_id"]]["FullB"]["referents"]
    base.write_json(out / "witness_samples.json", dict(sorted(samples.items(), key=lambda kv: -(sum(x["stats"]["edges_confirmed"] for x in kv[1]) if kv[1] else 0))[:40]))
    write_summary(out, metrics)
    log(f"report written: {out/'metrics.json'}, {stage_dir/'metrics.csv'}, {stage_dir/'per_task.csv'}, {out/'audit.json'}, {out/'witness_samples.json'}")


def fmt(n, d):
    return "N/A" if not d else f"{n}/{d} = {100.0*n/d:.2f}%"


def write_summary(out, m):
    T = m["total_tasks"]
    lines = ["# LATIS Stage B：真实 ARC-AGI-1 Train-only 消融结果（自动生成）", "", f"生成时间（UTC）：{datetime.now(timezone.utc).isoformat()}", ""]
    c = m.get("code_version") or {}
    lines.append(f"- 代码：git HEAD `{c.get('git_head')}`，工作区 diff 哈希 `{c.get('git_diff_sha256')}`，二进制 SHA256 `{c.get('binary_sha256')}`。")
    lines.append(f"- 数据校验：{json.dumps(c.get('data_check'), ensure_ascii=False)}")
    r = m.get("run") or {}
    lines.append(f"- 运行：{r.get('task_count')} 任务 × {len(m['configs'])} 配置，{r.get('workers')} 并行进程，Feature 墙钟 {r.get('feature_timeout_ms')} ms，RTS `{r.get('rts')}`；总墙钟 {r.get('wall_clock_seconds')}")
    lines.append(f"- Stage A FullA train-exact 参考：{', '.join(m['stage_a_reference']['fulla_train_exact_ids'])}")
    lines.append("")
    lines.append("| 配置 | train_exact | no_solution | timeout | runtime_error | 新增 vs FullA | 丢失 vs FullA | 快照任务 | 节点总 | 类总 | 确认边 | 待证边 | 类型边 | VSA 节点 / 展开 | 共享率均/最大 (x100) | 类检查 | 行查找 | typed-hole 评估 | search_work 总/中位/最大 | 墙钟 总/中位/最大 (s) | 峰值 max_live_bytes |")
    lines.append("|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|")
    for cfg in m["configs"]:
        p = m["per_config"][cfg]
        st, s, sw, wc = p["status_counts"], p["b_sums"], p["search_work"], p["wall_clock_seconds"]
        sh = p["sharing_avg_x100_mean_over_snapshot_tasks"]
        lines.append(f"| {cfg} | {fmt(st['train_exact'], T)} | {st['no_solution']} | {st['timeout']} | {st['runtime_error']} | {', '.join(p['new_vs_stage_a_fulla']) or '—'} | {', '.join(p['lost_vs_stage_a_fulla']) or '—'} | {p['snapshot_tasks']} | {s['b_graph_nodes']} | {s['b_graph_classes']} | {s['b_edges_confirmed']} | {s['b_edges_pending']} | {s['b_type_edges']} | {s['b_vsa_nodes']} / {s['b_vsa_expanded']} | {sh if sh is None else round(sh)} / {p['sharing_max_x100']} | {s['b_class_checks']} | {s['b_row_lookups']} | {p['typed_hole_evaluations_sum']} | {int(sw['sum'] or 0)}/{sw['median']}/{sw['max']} | {wc['sum']:.1f}/{wc['median']:.3f}/{wc['max']:.2f} | {p['peak_rts_max_live_bytes']} |")
    lines.append("")
    lines.append("## 失败环节分布（非 train_exact 任务）")
    lines.append("")
    lines.append("| 配置 | " + " | ".join(STAGES) + " |")
    lines.append("|---|" + "---|" * len(STAGES))
    for cfg in m["configs"]:
        s = m["per_config"][cfg]["failure_stage_counts"]
        lines.append(f"| {cfg} | " + " | ".join(str(s[k]) for k in STAGES) + " |")
    lines.append("")
    lines.append("## 预算截断与 Witness 覆盖")
    lines.append("")
    lines.append("| 配置 | universe 截断 | 边预算截断 | slot 截断 | typed-hole 截断 | 全 witness 边 / 确认边 | VSA 展开不一致 |")
    lines.append("|---|---|---|---|---|---|---|")
    for cfg in m["configs"]:
        p = m["per_config"][cfg]
        b, w = p["budget_truncations"], p["witness_coverage"]
        lines.append(f"| {cfg} | {b['universe']} | {b['edges']} | {b['slots']} | {b['typed_holes']} | {w['fully_witnessed']}/{w['confirmed_edges']} | {p['vsa_expansion_mismatches']} |")
    if m.get("fullb_vs_baseline_a_failure_stage_transitions"):
        lines += ["", "## FullB 相对 BaselineA 的失败环节迁移", "", "| 迁移 | 数量 |", "|---|---|"]
        for k, v in m["fullb_vs_baseline_a_failure_stage_transitions"].items():
            lines.append(f"| `{k}` | {v['count']} |")
    if m.get("program_changes_fullb_vs_baseline_a") is not None:
        lines += ["", f"FullB 与 BaselineA 均 train-exact 但程序不同的任务：{', '.join(m['program_changes_fullb_vs_baseline_a']) or '—'}"]
    lines.append("")
    lines.append("R2 本轮未重跑；回退任务的 R2 结果引用 v0.6.1 的记录。峰值内存口径：RTS `max_live_bytes`（进程级最大值）。")
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
