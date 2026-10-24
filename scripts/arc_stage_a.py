#!/usr/bin/env python
"""LATIS Stage A -- real ARC-AGI-1 train-only ablation driver.

Runs the Stage A front-end configurations (BaselineV061, GridSizeOnly,
TypedNaryOnly, FullA, NoFeatureArg, NoConstantArg, FullAMinusParity) on the
official 400 training tasks under the SAME train-only isolation as the v0.6.1
experiment (scripts/arc_train_only.py): the solver binary only receives
train-only copies (test: []), one stage = one process, in-process wall-clock
timeout plus a hard watchdog, RTS heap limit, no test field anywhere.

Subcommands
  prepare  train-only copies + manifest + code provenance (reuses arc_train_only.cmd_prepare)
           and checks the data hash against the v0.6.1 run
  run      every task x every configuration (fresh process per run)
  report   per_task.csv, metrics.csv, audit.json, summary.md, regression vs v0.6.1
  all      prepare + run + report

R2 is NOT re-run in this round: fallback tasks carry the R2 outcome recorded by
the v0.6.1 experiment (per_task.csv of results/arc_agi1_train_only_fallback),
which is labelled as such in the report.
"""
import argparse
import csv
import json
import statistics
import subprocess
import sys
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
from datetime import datetime, timezone
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import arc_train_only as base  # noqa: E402

ROOT = base.ROOT
DEFAULT_OUT = ROOT / "results" / "stage_a" / "arc"
DEFAULT_BIN = ROOT / "build" / "latis-stage-a.exe"
V061_OUT = ROOT / "results" / "arc_agi1_train_only_fallback"
CONFIGS = ["BaselineV061", "GridSizeOnly", "TypedNaryOnly", "FullA", "NoFeatureArg", "NoConstantArg", "FullAMinusParity"]
STATUSES = ("train_exact", "no_solution", "timeout", "unsupported", "runtime_error")
STAGES = ("none", "layout_guard", "grounding", "size_rule", "cardinality", "alignment_validation", "alignment", "transformation", "grid_realization", "grid_exact_check", "other")


def log(msg):
    base.log(msg)


def stage_name(cfg):
    return f"stage-a-{cfg}"


# --------------------------------------------------------------------------- prepare

def cmd_prepare(args):
    base.cmd_prepare(args)
    out = Path(args.out)
    manifest = base.read_json(out / "data_manifest.json")
    ref = V061_OUT / "data_manifest.json"
    check = {"v061_manifest_found": ref.exists()}
    if ref.exists():
        old = base.read_json(ref)
        check["v061_combined_sha256"] = old["combined_sha256_of_task_hashes"]
        check["stage_a_combined_sha256"] = manifest["combined_sha256_of_task_hashes"]
        check["identical_data"] = old["combined_sha256_of_task_hashes"] == manifest["combined_sha256_of_task_hashes"] or bool(args.limit or args.tasks)
        if not check["identical_data"]:
            sys.exit("data manifest differs from the v0.6.1 run; refusing to compare")
    code = base.read_json(out / "code_version.json")
    code["feature_stage"] = "Synthesis.Collection.Front.frontSearch SafeOnline with ARC.StageAEvaluate configurations (stage-a-<Config>)"
    code["stage_a_configs"] = CONFIGS
    code["r2_stage"] = "not re-run in Stage A; R2 outcomes quoted from results/arc_agi1_train_only_fallback"
    code["data_check"] = check
    base.write_json(out / "code_version.json", code)
    log(f"data check: {check}")


# --------------------------------------------------------------------------- run

def run_stage(binary, cfg, train_file, task_dir, timeout_ms):
    """One configuration on one task in a fresh process (+RTS -T for peak memory)."""
    task_dir.mkdir(parents=True, exist_ok=True)
    stage = stage_name(cfg)
    result_file = task_dir / f"{stage}.json"
    if result_file.exists():
        result_file.unlink()
    cmd = [str(binary), "arc-train-only-stage", "--stage", stage, "--task", str(train_file), "--out", str(task_dir),
           "--timeout-ms", str(timeout_ms), "+RTS", f"-M{base.RTS_MAX_HEAP}", "-T", "-RTS"]
    hard = timeout_ms / 1000 + base.HARD_KILL_GRACE_S
    started = time.monotonic()
    hard_kill = False
    try:
        proc = subprocess.run(cmd, capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=hard, cwd=ROOT)
        exit_code, stdout, stderr = proc.returncode, proc.stdout, proc.stderr
    except subprocess.TimeoutExpired as e:
        hard_kill = True
        exit_code = None
        stdout = (e.stdout or b"").decode("utf-8", "replace") if isinstance(e.stdout, bytes) else (e.stdout or "")
        stderr = (e.stderr or b"").decode("utf-8", "replace") if isinstance(e.stderr, bytes) else (e.stderr or "")
    elapsed = time.monotonic() - started
    (task_dir / f"{stage}.stderr.txt").write_text(stderr or "", encoding="utf-8")
    if hard_kill:
        rec = {"stage": stage, "status": "timeout", "detail": f"hard kill by driver watchdog after {hard:.0f}s", "train_exact": False,
               "timed_out": True, "hard_kill": True, "search_work": None, "wall_clock_seconds": elapsed, "program": None, "counters": {}}
        base.write_json(result_file, rec)
    elif not result_file.exists():
        tail = (stderr or "")[-2000:]
        rec = {"stage": stage, "status": "runtime_error", "detail": f"process exited without a result file; exit={exit_code}; stderr tail: {tail}",
               "train_exact": False, "timed_out": False, "hard_kill": False, "search_work": None, "wall_clock_seconds": elapsed, "program": None, "counters": {}}
        base.write_json(result_file, rec)
    else:
        rec = base.read_json(result_file)
        rec["hard_kill"] = False
    rec["exit_code"] = exit_code
    rec["driver_elapsed_seconds"] = elapsed
    return rec


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
        results[cfg] = run_stage(binary, cfg, out / task["train_only_file"], task_dir, timeout_ms)
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

def load_v061():
    p = V061_OUT / "per_task.csv"
    if not p.exists():
        return {}
    with open(p, encoding="utf-8", newline="") as f:
        return {r["task_id"]: r for r in csv.DictReader(f)}


def stats(values):
    vals = [v for v in values if v is not None]
    if not vals:
        return {"count": 0, "sum": 0, "median": None, "max": None}
    return {"count": len(vals), "sum": sum(vals), "median": statistics.median(vals), "max": max(vals)}


def to_int(x):
    try:
        return int(x)
    except (TypeError, ValueError):
        return None


def cmd_report(args):
    out = Path(args.out)
    manifest = base.read_json(out / "data_manifest.json")
    code = base.read_json(out / "code_version.json") if (out / "code_version.json").exists() else {}
    meta = base.read_json(out / "run_meta.json") if (out / "run_meta.json").exists() else {}
    configs = (meta.get("configs") or CONFIGS)
    v061 = load_v061()
    rows = []
    audit = {}
    for t in manifest["tasks"]:
        tid = t["task_id"]
        task_dir = out / "tasks" / tid
        audit[tid] = {}
        for cfg in configs:
            rec = base.load_stage(task_dir, stage_name(cfg))
            if rec is None:
                rows.append({"task_id": tid, "config": cfg, "ran": False})
                continue
            counters = rec.get("counters") or {}
            typed = rec.get("typed_holes") or {}
            size = rec.get("size_rule") or {}
            row = {
                "task_id": tid, "config": cfg, "ran": True, "train_pairs": t.get("train_pairs"),
                "status": rec.get("status"), "detail": rec.get("detail", ""), "failure_stage": rec.get("failure_stage", ""),
                "canvas_changed": rec.get("canvas_changed"), "size_rule_exact": rec.get("size_rule_exact"),
                "size_rule": size.get("rule") if isinstance(size, dict) else None,
                "size_rule_candidates": to_int(size.get("candidates")) if isinstance(size, dict) else None,
                "size_rule_evaluations": to_int(size.get("evaluations")) if isinstance(size, dict) else None,
                "size_rule_truncations": to_int(size.get("truncations")) if isinstance(size, dict) else None,
                "grid_realization_ok": rec.get("grid_realization_ok"), "grid_realizations_attempted": to_int(rec.get("grid_realizations_attempted")),
                "realization_render_errors": to_int(rec.get("realization_render_errors")), "realization_mismatches": to_int(rec.get("realization_mismatches")),
                "typed_hole_slots_triggered": to_int(typed.get("typed_hole_slots_triggered")), "typed_hole_templates": to_int(typed.get("typed_hole_templates")),
                "typed_hole_evaluations": to_int(typed.get("typed_hole_evaluations")), "typed_hole_fits": to_int(typed.get("typed_hole_fits")),
                "typed_hole_constant_fits": to_int(typed.get("typed_hole_constant_fits")), "typed_hole_feature_fits": to_int(typed.get("typed_hole_feature_fits")),
                "typed_hole_truncations": to_int(typed.get("typed_hole_truncations")),
                "search_work": rec.get("search_work"), "seconds": rec.get("wall_clock_seconds"), "timed_out": rec.get("timed_out"), "hard_kill": rec.get("hard_kill", False),
                "rts_max_live_bytes": to_int(rec.get("rts_max_live_bytes")), "rts_max_mem_in_use_bytes": to_int(rec.get("rts_max_mem_in_use_bytes")),
                "program": rec.get("program"), "hole_bindings": json.dumps(rec.get("hole_bindings") or [], ensure_ascii=False),
                "v061_feature_status": (v061.get(tid) or {}).get("feature_status"), "v061_feature_detail": (v061.get(tid) or {}).get("feature_detail"),
                "v061_r2_status": (v061.get(tid) or {}).get("r2_status"), "v061_pipeline_train_exact": (v061.get(tid) or {}).get("pipeline_train_exact"),
            }
            rows.append(row)
            audit[tid][cfg] = {"status": rec.get("status"), "detail": rec.get("detail"), "failure_stage": rec.get("failure_stage"),
                               "size_rule": size, "grid_realization": {k: rec.get(k) for k in ("grid_realization_ok", "grid_realizations_attempted", "realization_render_errors", "realization_mismatches")},
                               "typed_holes": typed, "hole_bindings": rec.get("hole_bindings"), "typed_slot_features": rec.get("typed_slot_features"),
                               "semantic_classes": rec.get("semantic_classes_detail"), "program": rec.get("program"), "search_work": rec.get("search_work"),
                               "wall_clock_seconds": rec.get("wall_clock_seconds"), "budget_truncations": {"size_rule": size.get("truncations") if isinstance(size, dict) else None,
                                                                                                       "typed_holes": typed.get("typed_hole_truncations")}}
    total = len(manifest["tasks"])
    by_cfg = {c: [r for r in rows if r.get("config") == c and r.get("ran")] for c in configs}
    base_rows = {r["task_id"]: r for r in by_cfg.get("BaselineV061", [])}
    metrics = {"experiment": "LATIS Stage A real ARC-AGI-1 train-only ablations", "total_tasks": total, "configs": configs,
               "code_version": code, "run": meta, "per_config": {}, "v061_reference": {"available": bool(v061), "source": str(V061_OUT / "per_task.csv")}}
    csv_rows = []
    for cfg in configs:
        rs = by_cfg[cfg]
        st = {s: len([r for r in rs if r["status"] == s]) for s in STATUSES}
        stages = {s: len([r for r in rs if r["status"] != "train_exact" and (r.get("failure_stage") or "other") == s]) for s in STAGES}
        exact_ids = sorted(r["task_id"] for r in rs if r["status"] == "train_exact")
        v061_exact = sorted(tid for tid, r in v061.items() if r.get("feature_status") == "train_exact")
        canvas_changed = [r for r in rs if r.get("canvas_changed") is True]
        entering = [r for r in canvas_changed if (r.get("failure_stage") or "") != "layout_guard"]
        size_exact = [r for r in rs if r.get("size_rule_exact") is True]
        size_exact_changed = [r for r in size_exact if r.get("canvas_changed") is True]
        real_ok = [r for r in rs if r.get("grid_realization_ok") is True]
        fallback = [r for r in rs if r["status"] != "train_exact"]
        r2_prior = {k: len([r for r in fallback if (r.get("v061_r2_status") or "not_run") == k]) for k in ("train_exact", "no_solution", "timeout", "unsupported", "runtime_error", "not_run")}
        same_as_v061 = None
        if cfg == "BaselineV061" and v061:
            same_as_v061 = {"status_identical": len([r for r in rs if r["status"] == (v061.get(r["task_id"]) or {}).get("feature_status")]),
                            "program_identical": len([r for r in rs if (r.get("program") or "") == ((v061.get(r["task_id"]) or {}).get("feature_program") or "")
                                                      or _program_equal_modulo_size(r.get("program"), (v061.get(r["task_id"]) or {}).get("feature_program"))]),
                            "n": len(rs)}
        per = {"tasks_run": len(rs), "status_counts": st, "train_exact_rate": (st["train_exact"] / total) if total else None,
               "fallback_count": len(fallback), "failure_stage_counts": stages,
               "canvas_changed_tasks": len(canvas_changed), "canvas_changed_entering_search": len(entering),
               "size_rule_exact_count": len(size_exact), "size_rule_exact_among_canvas_changed": len(size_exact_changed),
               "grid_realization_ok_count": len(real_ok),
               "typed_hole_slots_triggered_tasks": len([r for r in rs if (r.get("typed_hole_slots_triggered") or 0) > 0]),
               "typed_hole_templates_sum": sum((r.get("typed_hole_templates") or 0) for r in rs),
               "typed_hole_evaluations_sum": sum((r.get("typed_hole_evaluations") or 0) for r in rs),
               "typed_hole_fits_sum": sum((r.get("typed_hole_fits") or 0) for r in rs),
               "typed_hole_truncations_sum": sum((r.get("typed_hole_truncations") or 0) for r in rs),
               "size_rule_candidates_sum": sum((r.get("size_rule_candidates") or 0) for r in rs),
               "size_rule_truncations_sum": sum((r.get("size_rule_truncations") or 0) for r in rs),
               "search_work": stats([r.get("search_work") for r in rs]), "wall_clock_seconds": stats([r.get("seconds") for r in rs]),
               "peak_rts_max_live_bytes": max([r.get("rts_max_live_bytes") or 0 for r in rs] or [0]),
               "peak_rts_max_mem_in_use_bytes": max([r.get("rts_max_mem_in_use_bytes") or 0 for r in rs] or [0]),
               "timeouts": len([r for r in rs if r["status"] == "timeout"]), "hard_kills": len([r for r in rs if r.get("hard_kill")]),
               "train_exact_task_ids": exact_ids, "new_vs_v061_feature": sorted(set(exact_ids) - set(v061_exact)), "lost_vs_v061_feature": sorted(set(v061_exact) - set(exact_ids)),
               "r2_prior_outcome_among_fallbacks": r2_prior, "r2_note": "R2 was not re-run; counts quote the v0.6.1 R2 stage for the tasks that fall back under this configuration",
               "same_as_v061": same_as_v061}
        metrics["per_config"][cfg] = per
        csv_rows.append({"config": cfg, "tasks_run": len(rs), **{f"status_{s}": st[s] for s in STATUSES}, "train_exact_rate": per["train_exact_rate"],
                         **{f"stage_{s}": stages[s] for s in STAGES}, "canvas_changed_tasks": len(canvas_changed), "canvas_changed_entering_search": len(entering),
                         "size_rule_exact": len(size_exact), "size_rule_exact_among_canvas_changed": len(size_exact_changed), "grid_realization_ok": len(real_ok),
                         "typed_hole_slots_triggered_tasks": per["typed_hole_slots_triggered_tasks"], "typed_hole_templates_sum": per["typed_hole_templates_sum"],
                         "typed_hole_evaluations_sum": per["typed_hole_evaluations_sum"], "typed_hole_fits_sum": per["typed_hole_fits_sum"], "typed_hole_truncations_sum": per["typed_hole_truncations_sum"],
                         "size_rule_candidates_sum": per["size_rule_candidates_sum"], "size_rule_truncations_sum": per["size_rule_truncations_sum"],
                         "search_work_sum": per["search_work"]["sum"], "search_work_median": per["search_work"]["median"], "search_work_max": per["search_work"]["max"],
                         "wall_sum_s": per["wall_clock_seconds"]["sum"], "wall_median_s": per["wall_clock_seconds"]["median"], "wall_max_s": per["wall_clock_seconds"]["max"],
                         "peak_rts_max_live_bytes": per["peak_rts_max_live_bytes"], "timeouts": per["timeouts"], "hard_kills": per["hard_kills"],
                         "new_vs_v061": ";".join(per["new_vs_v061_feature"]), "lost_vs_v061": ";".join(per["lost_vs_v061_feature"])})
    # transitions FullA vs baseline
    if "FullA" in by_cfg and base_rows:
        trans = {}
        for r in by_cfg["FullA"]:
            b = base_rows.get(r["task_id"])
            if not b:
                continue
            key = f"{b.get('failure_stage') or 'none'} -> {r.get('failure_stage') or 'none'}"
            trans.setdefault(key, []).append(r["task_id"])
        metrics["fulla_vs_baseline_failure_stage_transitions"] = {k: {"count": len(v), "task_ids": sorted(v)[:60]} for k, v in sorted(trans.items(), key=lambda kv: -len(kv[1]))}
        detail = {}
        for r in by_cfg["FullA"]:
            if r["status"] != "train_exact":
                d = (r.get("detail") or "")[:110]
                detail.setdefault(d, []).append(r["task_id"])
        metrics["fulla_failure_details"] = {k: {"count": len(v), "task_ids": sorted(v)} for k, v in sorted(detail.items(), key=lambda kv: -len(kv[1]))[:30]}
    base.write_json(out / "metrics.json", metrics)
    base.write_json(out / "audit.json", audit)
    stage_dir = out.parent
    cols = ["task_id", "config", "ran", "train_pairs", "status", "failure_stage", "detail", "canvas_changed", "size_rule_exact", "size_rule", "size_rule_candidates",
            "size_rule_evaluations", "size_rule_truncations", "grid_realization_ok", "grid_realizations_attempted", "realization_render_errors", "realization_mismatches",
            "typed_hole_slots_triggered", "typed_hole_templates", "typed_hole_evaluations", "typed_hole_fits", "typed_hole_constant_fits", "typed_hole_feature_fits",
            "typed_hole_truncations", "search_work", "seconds", "timed_out", "hard_kill", "rts_max_live_bytes", "rts_max_mem_in_use_bytes",
            "v061_feature_status", "v061_feature_detail", "v061_r2_status", "v061_pipeline_train_exact", "hole_bindings", "program"]
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
    log(f"report written: {out/'metrics.json'}, {stage_dir/'metrics.csv'}, {stage_dir/'per_task.csv'}, {out/'audit.json'}")


def _program_equal_modulo_size(new, old):
    """BaselineV061 programs differ from v0.6.1 only by the added progSize = Nothing field."""
    if not new or not old:
        return False
    return new.replace(", progSize = Nothing", "") == old


def fmt(n, d):
    return "N/A" if not d else f"{n}/{d} = {100.0*n/d:.2f}%"


def write_summary(out, m):
    T = m["total_tasks"]
    lines = ["# LATIS Stage A：真实 ARC-AGI-1 Train-only 消融结果（自动生成）", "", f"生成时间（UTC）：{datetime.now(timezone.utc).isoformat()}", ""]
    c = m.get("code_version") or {}
    lines.append(f"- 代码：git HEAD `{c.get('git_head')}`，工作区 diff 哈希 `{c.get('git_diff_sha256')}`，二进制 SHA256 `{c.get('binary_sha256')}`。")
    lines.append(f"- 数据校验：{json.dumps(c.get('data_check'), ensure_ascii=False)}")
    r = m.get("run") or {}
    lines.append(f"- 运行：{r.get('task_count')} 任务 × {len(m['configs'])} 配置，{r.get('workers')} 并行进程，Feature 墙钟 {r.get('feature_timeout_ms')} ms，RTS `{r.get('rts')}`；总墙钟 {r.get('wall_clock_seconds')}")
    lines.append("")
    lines.append("| 配置 | train_exact | no_solution | unsupported | timeout | runtime_error | canvas 变化进入搜索 | SizeRule-exact（canvas 变化） | Grid realization ok | typed-hole 触发任务 | typed-hole 评估 | 新增 vs v0.6.1 | 丢失 vs v0.6.1 | search_work 总/中位/最大 | 墙钟 总/中位/最大 (s) | 峰值 max_live_bytes |")
    lines.append("|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|")
    for cfg in m["configs"]:
        p = m["per_config"][cfg]
        st = p["status_counts"]
        sw, wc = p["search_work"], p["wall_clock_seconds"]
        lines.append(f"| {cfg} | {fmt(st['train_exact'], T)} | {st['no_solution']} | {st['unsupported']} | {st['timeout']} | {st['runtime_error']} | {p['canvas_changed_entering_search']}/{p['canvas_changed_tasks']} | {p['size_rule_exact_among_canvas_changed']}/{p['canvas_changed_tasks']} | {p['grid_realization_ok_count']} | {p['typed_hole_slots_triggered_tasks']} | {p['typed_hole_evaluations_sum']} | {', '.join(p['new_vs_v061_feature']) or '—'} | {', '.join(p['lost_vs_v061_feature']) or '—'} | {int(sw['sum'] or 0)}/{sw['median']}/{sw['max']} | {wc['sum']:.1f}/{wc['median']:.3f}/{wc['max']:.2f} | {p['peak_rts_max_live_bytes']} |")
    lines.append("")
    lines.append("## 失败环节分布（非 train_exact 任务）")
    lines.append("")
    lines.append("| 配置 | " + " | ".join(STAGES) + " |")
    lines.append("|---|" + "---|" * len(STAGES))
    for cfg in m["configs"]:
        s = m["per_config"][cfg]["failure_stage_counts"]
        lines.append(f"| {cfg} | " + " | ".join(str(s[k]) for k in STAGES) + " |")
    if m.get("fulla_vs_baseline_failure_stage_transitions"):
        lines.append("")
        lines.append("## FullA 相对 BaselineV061 的失败环节迁移")
        lines.append("")
        lines.append("| 迁移 | 数量 |")
        lines.append("|---|---|")
        for k, v in m["fulla_vs_baseline_failure_stage_transitions"].items():
            lines.append(f"| `{k}` | {v['count']} |")
    if m.get("fulla_failure_details"):
        lines.append("")
        lines.append("## FullA 失败字符串（前 30）")
        lines.append("")
        lines.append("| 失败字符串（截断） | 数量 |")
        lines.append("|---|---|")
        for k, v in m["fulla_failure_details"].items():
            lines.append(f"| `{k}` | {v['count']} |")
    lines.append("")
    lines.append("R2 本轮未重跑；每个配置回退任务的 R2 结果引用 v0.6.1 的记录（`r2_prior_outcome_among_fallbacks`）。峰值内存口径：RTS `max_live_bytes`（进程级最大值，需 `+RTS -T`）。")
    with open(out / "summary.md", "w", encoding="utf-8", newline="\n") as f:
        f.write("\n".join(lines) + "\n")


# --------------------------------------------------------------------------- main

def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    for name in ("prepare", "run", "report", "all"):
        p = sub.add_parser(name)
        base.add_common(p)
        p.set_defaults(out=str(DEFAULT_OUT), binary=str(DEFAULT_BIN))
        p.add_argument("--configs", default="", help="comma-separated subset of " + ",".join(CONFIGS))
    args = ap.parse_args()
    if args.cmd == "prepare":
        cmd_prepare(args)
    elif args.cmd == "run":
        cmd_run(args)
    elif args.cmd == "report":
        cmd_report(args)
    elif args.cmd == "all":
        cmd_prepare(args)
        cmd_run(args)
        cmd_report(args)


if __name__ == "__main__":
    main()
