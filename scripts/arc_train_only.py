#!/usr/bin/env python
"""LATIS v0.6.1 -- real ARC-AGI-1 train-only fallback experiment driver.

Subcommands
  prepare  hash the official task files, strip every "test" field into
           train-only copies, record data/code provenance and budgets
  run      run the two-stage chain (Feature -> R2 fallback) as isolated
           processes, one stage per process, with hard wall-clock watchdogs
  report   aggregate per_task.csv, metrics.json, summary.md
  test     data-integrity, leak-isolation, timeout and fallback-chain tests
  all      prepare + test + run + report

The solver binary only ever receives the train-only copies.  Nothing in this
driver reads a test output for any decision; test fields are dropped in
`prepare` and the binary refuses files that still contain them.
"""
import argparse
import csv
import hashlib
import json
import os
import platform
import shutil
import statistics
import subprocess
import sys
import threading
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DEFAULT_SOURCE = ROOT / "data" / "arc1-training"
DEFAULT_OUT = ROOT / "results" / "arc_agi1_train_only_fallback"
DEFAULT_BIN = ROOT / "build" / "latis-arc-train-only.exe"
UPSTREAM = {
    "source": "https://github.com/fchollet/ARC-AGI",
    "upstream_path": "data/training",
    "upstream_commit": "399030444e0ab0cc8b4e199870fb20b863846f34",
    "split": "training",
    "expected_count": 400,
    "local_copy": "data/arc1-training",
}
# Fixed experiment budgets (wall-clock per stage, in-process) and the
# driver's hard watchdog grace.  Search-work budgets are the entries'
# existing defaults and are recorded verbatim by the binary.
DEFAULT_FEATURE_TIMEOUT_MS = 60_000
DEFAULT_V04_TIMEOUT_MS = 60_000
DEFAULT_R2_TIMEOUT_MS = 300_000
HARD_KILL_GRACE_S = 30
RTS_MAX_HEAP = "4g"
STAGES = ("feature", "feature-v04", "r2")
FALLBACK_REASONS = ("no_solution", "timeout", "unsupported", "runtime_error")

print_lock = threading.Lock()


def log(msg):
    with print_lock:
        print(msg, flush=True)


def sha256_file(path):
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for chunk in iter(lambda: f.read(1 << 20), b""):
            h.update(chunk)
    return h.hexdigest()


def sha256_text(text):
    return hashlib.sha256(text.encode("utf-8")).hexdigest()


def write_json(path, obj):
    Path(path).parent.mkdir(parents=True, exist_ok=True)
    with open(path, "w", encoding="utf-8", newline="\n") as f:
        json.dump(obj, f, indent=2, sort_keys=True)
        f.write("\n")


def read_json(path):
    with open(path, "r", encoding="utf-8") as f:
        return json.load(f)


def is_grid(g):
    return (isinstance(g, list) and len(g) > 0 and all(isinstance(r, list) and len(r) == len(g[0]) and len(r) > 0
            and all(isinstance(c, int) and not isinstance(c, bool) and 0 <= c <= 9 for c in r) for r in g))


def validate_task(obj):
    """Return (ok, reason, train_pairs). Only the train field is inspected."""
    if not isinstance(obj, dict) or "train" not in obj:
        return False, "missing train field", None
    train = obj["train"]
    if not isinstance(train, list) or not train:
        return False, "train is not a non-empty list", None
    for i, pair in enumerate(train):
        if not isinstance(pair, dict) or "input" not in pair or "output" not in pair:
            return False, f"train[{i}] lacks input/output", None
        if not is_grid(pair["input"]) or not is_grid(pair["output"]):
            return False, f"train[{i}] grid invalid (ragged, empty, or colour outside 0..9)", None
    return True, "", [{"input": p["input"], "output": p["output"]} for p in train]


def strip_to_train_only(obj):
    """The ONLY place a task object is converted for the solver: keep train, drop test."""
    ok, reason, train = validate_task(obj)
    if not ok:
        return None, reason
    return {"train": train, "test": []}, ""


def git(*args):
    try:
        return subprocess.run(["git", *args], cwd=ROOT, capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=60).stdout.strip()
    except Exception as e:  # pragma: no cover
        return f"unavailable: {e}"


# --------------------------------------------------------------------------- prepare

def cmd_prepare(args):
    out = Path(args.out)
    source = Path(args.source)
    out.mkdir(parents=True, exist_ok=True)
    train_dir = out / "train_only"
    if train_dir.exists():
        shutil.rmtree(train_dir)
    train_dir.mkdir(parents=True)
    files = sorted(p for p in source.glob("*.json"))
    if args.limit:
        files = files[: args.limit]
    if args.tasks:
        wanted = set(args.tasks.split(","))
        files = [p for p in files if p.stem in wanted]
    tasks = []
    for p in files:
        rec = {"task_id": p.stem, "file": str(p.relative_to(ROOT)) if p.is_relative_to(ROOT) else str(p),
               "sha256": sha256_file(p), "bytes": p.stat().st_size}
        try:
            with open(p, "r", encoding="utf-8") as f:
                obj = json.load(f)
            stripped, reason = strip_to_train_only(obj)
        except Exception as e:
            stripped, reason = None, f"json parse error: {e}"
        if stripped is None:
            rec.update({"parse_ok": False, "parse_error": reason, "train_only_file": None})
        else:
            text = json.dumps(stripped, separators=(",", ":"), sort_keys=True) + "\n"
            dest = train_dir / f"{p.stem}.json"
            with open(dest, "w", encoding="utf-8", newline="\n") as f:
                f.write(text)
            rec.update({"parse_ok": True, "parse_error": "", "train_only_file": str(dest.relative_to(out)),
                        "train_only_sha256": sha256_text(text), "train_pairs": len(stripped["train"]),
                        "test_pairs_dropped": len(obj.get("test", [])) if isinstance(obj.get("test", []), list) else None})
        tasks.append(rec)
    combined = sha256_text("\n".join(f"{t['task_id']} {t['sha256']}" for t in tasks))
    manifest = {
        **UPSTREAM,
        "source_dir": str(source),
        "task_count": len(tasks),
        "parse_ok_count": sum(1 for t in tasks if t["parse_ok"]),
        "combined_sha256_of_task_hashes": combined,
        "prepared_at_utc": datetime.now(timezone.utc).isoformat(),
        "tasks": tasks,
    }
    write_json(out / "data_manifest.json", manifest)
    binary = Path(args.binary)
    code = {
        "git_head": git("rev-parse", "HEAD"),
        "git_status_porcelain": git("status", "--porcelain"),
        "git_diff_sha256": sha256_text(git("diff")),
        "binary": str(binary),
        "binary_sha256": sha256_file(binary) if binary.exists() else None,
        "python": sys.version,
        "platform": platform.platform(),
        "cpu_count": os.cpu_count(),
        "budgets": {
            "feature_timeout_ms": args.feature_timeout_ms,
            "feature_v04_timeout_ms": args.v04_timeout_ms,
            "r2_timeout_ms": args.r2_timeout_ms,
            "hard_kill_grace_s": HARD_KILL_GRACE_S,
            "rts_max_heap": RTS_MAX_HEAP,
            "workers": args.workers,
            "search_work_budgets": "entry defaults, recorded verbatim in each stage JSON under 'config'",
        },
        "feature_stage": "Synthesis.Collection.Front.frontSearch SafeOnline (ARC.CollectionV61Evaluate.v61Config)",
        "r2_stage": "Synthesis.InducedR2.Learn.inducedSearch Full (V4.r2Config of v61Config.legacyConfig = R2.defaultInduced)",
        "diagnostic_stage": "Synthesis.Triggered.frontSearch Full V4.defaultConfig (v0.4 feature front; never affects fallback)",
    }
    write_json(out / "code_version.json", code)
    log(f"prepared {len(tasks)} tasks ({manifest['parse_ok_count']} parse ok) -> {out}")


# --------------------------------------------------------------------------- run

def run_stage(binary, stage, train_file, task_dir, timeout_ms):
    """Run one stage in a fresh process. Returns the stage record (dict)."""
    task_dir.mkdir(parents=True, exist_ok=True)
    result_file = task_dir / f"{stage}.json"
    if result_file.exists():
        result_file.unlink()
    cmd = [str(binary), "arc-train-only-stage", "--stage", stage, "--task", str(train_file), "--out", str(task_dir),
           "--timeout-ms", str(timeout_ms), "+RTS", f"-M{RTS_MAX_HEAP}", "-RTS"]
    hard = timeout_ms / 1000 + HARD_KILL_GRACE_S
    started = time.monotonic()
    started_utc = datetime.now(timezone.utc).isoformat()
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
    (task_dir / f"{stage}.stdout.txt").write_text(stdout or "", encoding="utf-8")
    (task_dir / f"{stage}.stderr.txt").write_text(stderr or "", encoding="utf-8")
    if hard_kill:
        rec = {"stage": stage, "status": "timeout", "detail": f"hard kill by driver watchdog after {hard:.0f}s (in-process timeout did not fire)",
               "train_exact": False, "timed_out": True, "hard_kill": True, "search_work": None, "wall_clock_seconds": elapsed,
               "timeout_ms": timeout_ms, "program": None, "counters": {}}
        write_json(result_file, rec)
    elif not result_file.exists():
        tail = (stderr or "")[-2000:]
        detail = "process exited without a result file"
        if "heap" in tail.lower() and "exhausted" in tail.lower():
            detail = "RTS heap exhausted (-M limit)"
        rec = {"stage": stage, "status": "runtime_error", "detail": f"{detail}; exit={exit_code}; stderr tail: {tail}",
               "train_exact": False, "timed_out": False, "hard_kill": False, "search_work": None, "wall_clock_seconds": elapsed,
               "timeout_ms": timeout_ms, "program": None, "counters": {}}
        write_json(result_file, rec)
    else:
        rec = read_json(result_file)
        rec["hard_kill"] = False
    rec["exit_code"] = exit_code
    rec["driver_elapsed_seconds"] = elapsed
    rec["started_utc"] = started_utc
    return rec


def run_task(binary, out, task, budgets, with_v04):
    task_id = task["task_id"]
    task_dir = out / "tasks" / task_id
    task_dir.mkdir(parents=True, exist_ok=True)
    driver = {"task_id": task_id, "stages": [], "started_utc": datetime.now(timezone.utc).isoformat()}
    if not task["parse_ok"]:
        driver.update({"feature_status": "unsupported", "feature_detail": f"parse: {task['parse_error']}",
                       "fallback": True, "fallback_reason": "unsupported", "r2_run": False, "r2_status": None,
                       "pipeline_train_exact": False})
        # R2 cannot run without a parsable task either; record it explicitly.
        write_json(task_dir / "driver.json", driver)
        return driver
    train_file = out / task["train_only_file"]
    feat = run_stage(binary, "feature", train_file, task_dir, budgets["feature"])
    driver["stages"].append("feature")
    driver["feature_status"] = feat["status"]
    driver["feature_detail"] = feat.get("detail", "")
    if with_v04:
        v04 = run_stage(binary, "feature-v04", train_file, task_dir, budgets["feature-v04"])
        driver["stages"].append("feature-v04")
        driver["v04_status"] = v04["status"]
    fallback = feat["status"] != "train_exact"
    driver["fallback"] = fallback
    driver["fallback_reason"] = None if not fallback else (feat["status"] if feat["status"] in FALLBACK_REASONS else "runtime_error")
    if fallback:
        r2 = run_stage(binary, "r2", train_file, task_dir, budgets["r2"])
        driver["stages"].append("r2")
        driver["r2_run"] = True
        driver["r2_status"] = r2["status"]
        driver["pipeline_train_exact"] = r2["status"] == "train_exact"
    else:
        driver["r2_run"] = False
        driver["r2_status"] = None
        driver["pipeline_train_exact"] = True
    driver["finished_utc"] = datetime.now(timezone.utc).isoformat()
    write_json(task_dir / "driver.json", driver)
    return driver


def cmd_run(args):
    out = Path(args.out)
    manifest = read_json(out / "data_manifest.json")
    binary = Path(args.binary)
    if not binary.exists():
        sys.exit(f"binary not found: {binary}")
    tasks = manifest["tasks"]
    if args.tasks:
        wanted = set(args.tasks.split(","))
        tasks = [t for t in tasks if t["task_id"] in wanted]
    if args.limit:
        tasks = tasks[: args.limit]
    budgets = {"feature": args.feature_timeout_ms, "feature-v04": args.v04_timeout_ms, "r2": args.r2_timeout_ms}
    todo = []
    for t in tasks:
        if not args.force and (out / "tasks" / t["task_id"] / "driver.json").exists():
            continue
        todo.append(t)
    log(f"running {len(todo)} of {len(tasks)} tasks with {args.workers} workers; budgets={budgets} ms; v04 diagnostic={not args.no_v04}")
    run_meta = {"started_utc": datetime.now(timezone.utc).isoformat(), "workers": args.workers, "budgets_ms": budgets,
                "task_count": len(tasks), "resumed_skipped": len(tasks) - len(todo), "with_v04": not args.no_v04}
    write_json(out / "run_meta.json", run_meta)
    started = time.monotonic()
    done = 0
    with ThreadPoolExecutor(max_workers=args.workers) as pool:
        futures = {pool.submit(run_task, binary, out, t, budgets, not args.no_v04): t for t in todo}
        for fut in as_completed(futures):
            t = futures[fut]
            try:
                d = fut.result()
                done += 1
                log(f"[{done}/{len(todo)}] {t['task_id']} feature={d.get('feature_status')} fallback={d.get('fallback_reason')} r2={d.get('r2_status')} v04={d.get('v04_status')} t={time.monotonic()-started:.0f}s")
            except Exception as e:
                log(f"[driver error] {t['task_id']}: {e}")
    run_meta["finished_utc"] = datetime.now(timezone.utc).isoformat()
    run_meta["wall_clock_seconds"] = time.monotonic() - started
    write_json(out / "run_meta.json", run_meta)


# --------------------------------------------------------------------------- report

def failure_family(detail):
    if not detail:
        return ""
    head = detail.split(":")[0].strip()
    return head[:60]


def load_stage(task_dir, stage):
    p = task_dir / f"{stage}.json"
    return read_json(p) if p.exists() else None


def ratio(num, den):
    return None if den == 0 else num / den


def fmt_rate(num, den):
    return "N/A" if den == 0 else f"{num}/{den} = {100.0*num/den:.2f}%"


def stats(values):
    vals = [v for v in values if v is not None]
    if not vals:
        return {"count": 0, "sum": 0, "median": None, "max": None, "mean": None}
    return {"count": len(vals), "sum": sum(vals), "median": statistics.median(vals), "max": max(vals), "mean": statistics.fmean(vals)}


def cmd_report(args):
    out = Path(args.out)
    manifest = read_json(out / "data_manifest.json")
    code = read_json(out / "code_version.json") if (out / "code_version.json").exists() else {}
    run_meta = read_json(out / "run_meta.json") if (out / "run_meta.json").exists() else {}
    rows = []
    for t in manifest["tasks"]:
        tid = t["task_id"]
        task_dir = out / "tasks" / tid
        driver = load_stage(task_dir, "driver")
        feat = load_stage(task_dir, "feature")
        v04 = load_stage(task_dir, "feature-v04")
        r2 = load_stage(task_dir, "r2")
        row = {"task_id": tid, "parse_ok": t["parse_ok"], "parse_error": t.get("parse_error", ""), "train_pairs": t.get("train_pairs"),
               "ran": driver is not None}
        if driver is None:
            rows.append(row)
            continue
        diag = (feat or {}).get("diagnostics", {}) if isinstance((feat or {}).get("diagnostics"), dict) else {}
        row.update({
            "feature_status": driver.get("feature_status"), "feature_detail": driver.get("feature_detail", ""),
            "feature_failure_family": failure_family(driver.get("feature_detail", "")) if driver.get("feature_status") != "train_exact" else "",
            "feature_search_work": (feat or {}).get("search_work"), "feature_seconds": (feat or {}).get("wall_clock_seconds"),
            "feature_timed_out": (feat or {}).get("timed_out"), "feature_hard_kill": (feat or {}).get("hard_kill", False),
            "feature_program": (feat or {}).get("program"),
            "fallback": driver.get("fallback"), "fallback_reason": driver.get("fallback_reason"),
            "r2_run": driver.get("r2_run"), "r2_status": driver.get("r2_status"), "r2_detail": (r2 or {}).get("detail", ""),
            "r2_search_work": (r2 or {}).get("search_work"), "r2_seconds": (r2 or {}).get("wall_clock_seconds"),
            "r2_timed_out": (r2 or {}).get("timed_out"), "r2_hard_kill": (r2 or {}).get("hard_kill", False),
            "r2_bounded": (r2 or {}).get("bounded"), "r2_program": (r2 or {}).get("program"),
            "pipeline_train_exact": driver.get("pipeline_train_exact"),
            "v04_status": (v04 or {}).get("status"), "v04_detail": (v04 or {}).get("detail", ""),
            "v04_search_work": (v04 or {}).get("search_work"), "v04_seconds": (v04 or {}).get("wall_clock_seconds"),
            "same_canvas": diag.get("same_canvas"), "equal_object_counts": diag.get("equal_object_counts"),
            "input_dims": json.dumps(diag.get("input_dims")) if diag else "", "output_dims": json.dumps(diag.get("output_dims")) if diag else "",
            "input_object_counts": json.dumps(diag.get("input_object_counts")) if diag else "",
        })
        rows.append(row)

    total = len(rows)
    ran = [r for r in rows if r.get("ran")]
    feature_exact = [r for r in ran if r.get("feature_status") == "train_exact"]
    fallbacks = [r for r in ran if r.get("fallback")]
    by_reason = {k: [r for r in fallbacks if r.get("fallback_reason") == k] for k in FALLBACK_REASONS}
    r2_exact = [r for r in fallbacks if r.get("r2_status") == "train_exact"]
    r2_timeouts = [r for r in fallbacks if r.get("r2_status") == "timeout"]
    r2_errors = [r for r in fallbacks if r.get("r2_status") == "runtime_error"]
    pipeline_exact = [r for r in ran if r.get("pipeline_train_exact")]
    not_ran = [r for r in rows if not r.get("ran")]
    # conditional denominator: tasks that parsed and were accepted by the feature interface
    processable = [r for r in ran if r.get("feature_status") in ("train_exact", "no_solution", "timeout")]
    proc_fallbacks = [r for r in processable if r.get("fallback")]
    proc_r2_exact = [r for r in proc_fallbacks if r.get("r2_status") == "train_exact"]
    v04_exact = [r for r in ran if r.get("v04_status") == "train_exact"]
    v04_only = [r for r in v04_exact if r.get("feature_status") != "train_exact"]
    feat_only = [r for r in feature_exact if r.get("v04_status") != "train_exact"]

    families = {}
    for r in fallbacks:
        fam = r.get("feature_failure_family") or r.get("fallback_reason")
        families.setdefault(fam, []).append(r["task_id"])
    details = {}
    for r in fallbacks:
        d = (r.get("feature_detail") or "")[:120]
        details.setdefault(d, []).append(r["task_id"])
    r2_details = {}
    for r in fallbacks:
        if r.get("r2_status") != "train_exact":
            d = f"{r.get('r2_status')}: {(r.get('r2_detail') or '')[:120]}"
            r2_details.setdefault(d, []).append(r["task_id"])

    ids = lambda rs: sorted(r["task_id"] for r in rs)
    metrics = {
        "experiment": "LATIS v0.6.1 real ARC-AGI-1 train-only fallback",
        "data": {k: manifest[k] for k in ("source", "upstream_path", "upstream_commit", "split", "expected_count", "task_count", "parse_ok_count", "combined_sha256_of_task_hashes")},
        "code_version": {k: code.get(k) for k in ("git_head", "git_diff_sha256", "binary_sha256", "feature_stage", "r2_stage", "diagnostic_stage")},
        "budgets": code.get("budgets"),
        "run": run_meta,
        "total_tasks": total,
        "tasks_run": len(ran),
        "tasks_not_run": len(not_ran),
        "feature_train_exact_count": len(feature_exact),
        "feature_train_exact_rate": ratio(len(feature_exact), total),
        "fallback_count": len(fallbacks),
        "fallback_rate": ratio(len(fallbacks), total),
        "fallback_reason_no_solution": len(by_reason["no_solution"]),
        "fallback_reason_timeout": len(by_reason["timeout"]),
        "fallback_reason_unsupported": len(by_reason["unsupported"]),
        "fallback_reason_runtime_error": len(by_reason["runtime_error"]),
        "fallback_rate_search_only": ratio(len(by_reason["no_solution"]) + len(by_reason["timeout"]), total),
        "fallback_rate_unsupported_or_error": ratio(len(by_reason["unsupported"]) + len(by_reason["runtime_error"]), total),
        "r2_train_exact_count": len(r2_exact),
        "r2_train_exact_rate_among_fallbacks": ratio(len(r2_exact), len(fallbacks)),
        "r2_timeout_count": len(r2_timeouts),
        "r2_runtime_error_count": len(r2_errors),
        "pipeline_train_exact_count": len(pipeline_exact),
        "pipeline_train_exact_rate": ratio(len(pipeline_exact), total),
        "conditional_processable": {
            "definition": "parsed and accepted by the Feature interface (feature status in train_exact/no_solution/timeout)",
            "count": len(processable),
            "feature_train_exact_count": len([r for r in processable if r.get("feature_status") == "train_exact"]),
            "feature_train_exact_rate": ratio(len([r for r in processable if r.get("feature_status") == "train_exact"]), len(processable)),
            "fallback_count": len(proc_fallbacks),
            "fallback_rate": ratio(len(proc_fallbacks), len(processable)),
            "r2_train_exact_count": len(proc_r2_exact),
            "r2_train_exact_rate_among_fallbacks": ratio(len(proc_r2_exact), len(proc_fallbacks)),
            "pipeline_train_exact_count": len([r for r in processable if r.get("pipeline_train_exact")]),
            "pipeline_train_exact_rate": ratio(len([r for r in processable if r.get("pipeline_train_exact")]), len(processable)),
        },
        "feature_wall_clock_seconds": stats([r.get("feature_seconds") for r in ran]),
        "feature_search_work": stats([r.get("feature_search_work") for r in ran]),
        "feature_timeout_count": len([r for r in ran if r.get("feature_status") == "timeout"]),
        "feature_hard_kill_count": len([r for r in ran if r.get("feature_hard_kill")]),
        "r2_wall_clock_seconds": stats([r.get("r2_seconds") for r in fallbacks]),
        "r2_search_work": stats([r.get("r2_search_work") for r in fallbacks]),
        "r2_hard_kill_count": len([r for r in fallbacks if r.get("r2_hard_kill")]),
        "r2_bounded_count": len([r for r in fallbacks if r.get("r2_bounded") is True]),
        "v04_diagnostic": {
            "note": "v0.4 triggered feature front run on the same train-only inputs; never influences the fallback chain",
            "train_exact_count": len(v04_exact),
            "train_exact_rate": ratio(len(v04_exact), total),
            "status_counts": {s: len([r for r in ran if r.get("v04_status") == s]) for s in ("train_exact", "no_solution", "timeout", "unsupported", "runtime_error")},
            "v04_only_task_ids": ids(v04_only), "v061_only_task_ids": ids(feat_only),
            "wall_clock_seconds": stats([r.get("v04_seconds") for r in ran]),
        },
        "task_ids": {
            "feature_train_exact": ids(feature_exact),
            "fallback_no_solution": ids(by_reason["no_solution"]),
            "fallback_timeout": ids(by_reason["timeout"]),
            "fallback_unsupported": ids(by_reason["unsupported"]),
            "fallback_runtime_error": ids(by_reason["runtime_error"]),
            "r2_train_exact": ids(r2_exact),
            "r2_timeout": ids(r2_timeouts),
            "r2_runtime_error": ids(r2_errors),
            "pipeline_train_exact": ids(pipeline_exact),
            "not_run": ids(not_ran),
        },
        "feature_failure_families": {k: {"count": len(v), "task_ids": sorted(v)} for k, v in sorted(families.items(), key=lambda kv: -len(kv[1]))},
        "feature_failure_details": {k: {"count": len(v), "task_ids": sorted(v)} for k, v in sorted(details.items(), key=lambda kv: -len(kv[1]))},
        "r2_failure_details": {k: {"count": len(v), "task_ids": sorted(v)} for k, v in sorted(r2_details.items(), key=lambda kv: -len(kv[1]))},
        "structure": {
            "same_canvas_count": len([r for r in ran if r.get("same_canvas") is True]),
            "same_canvas_and_equal_object_counts": len([r for r in ran if r.get("same_canvas") is True and r.get("equal_object_counts") is True]),
        },
    }
    write_json(out / "metrics.json", metrics)
    columns = ["task_id", "parse_ok", "parse_error", "train_pairs", "ran", "feature_status", "feature_failure_family", "feature_detail",
               "feature_search_work", "feature_seconds", "feature_timed_out", "feature_hard_kill", "fallback", "fallback_reason",
               "r2_run", "r2_status", "r2_detail", "r2_search_work", "r2_seconds", "r2_timed_out", "r2_hard_kill", "r2_bounded",
               "pipeline_train_exact", "v04_status", "v04_detail", "v04_search_work", "v04_seconds", "same_canvas", "equal_object_counts",
               "input_dims", "output_dims", "input_object_counts", "feature_program", "r2_program"]
    with open(out / "per_task.csv", "w", encoding="utf-8", newline="") as f:
        w = csv.DictWriter(f, fieldnames=columns, extrasaction="ignore")
        w.writeheader()
        for r in rows:
            w.writerow({k: ("" if r.get(k) is None else r.get(k)) for k in columns})
    write_summary(out, metrics, rows)
    log(f"report written: {out/'metrics.json'}, {out/'per_task.csv'}, {out/'summary.md'}")


def write_summary(out, m, rows):
    T = m["total_tasks"]
    fb = m["fallback_count"]
    tests = read_json(out / "tests" / "test_report.json") if (out / "tests" / "test_report.json").exists() else None
    cp = m["conditional_processable"]
    v04 = m["v04_diagnostic"]
    fw, fwork, rw, rwork = m["feature_wall_clock_seconds"], m["feature_search_work"], m["r2_wall_clock_seconds"], m["r2_search_work"]
    b = m.get("budgets") or {}

    def secs(s):
        return "N/A" if s["count"] == 0 else f"sum {s['sum']:.1f}s, median {s['median']:.2f}s, max {s['max']:.1f}s (n={s['count']})"

    def work(s):
        return "N/A" if s["count"] == 0 else f"sum {int(s['sum'])}, median {s['median']:.0f}, max {int(s['max'])} (n={s['count']})"

    def idlist(key, limit=400):
        xs = m["task_ids"][key]
        return ("（无）" if not xs else ", ".join(xs[:limit]) + ("" if len(xs) <= limit else f" … 共 {len(xs)}"))

    lines = []
    lines.append("# LATIS v0.6.1：真实 ARC-AGI-1 Train-only Fallback 实验结果\n")
    lines.append(f"生成时间（UTC）：{datetime.now(timezone.utc).isoformat()}\n")
    lines.append("## 数据与代码\n")
    d = m["data"]
    lines.append(f"- 数据来源：{d['source']}，`{d['upstream_path']}`，commit `{d['upstream_commit']}`，split = {d['split']}；本地副本 `data/arc1-training/`。")
    lines.append(f"- 任务数：{d['task_count']}（期望 {d['expected_count']}），可解析 {d['parse_ok_count']}；全部任务文件 SHA256 组合哈希 `{d['combined_sha256_of_task_hashes']}`（逐文件哈希见 `data_manifest.json`）。")
    c = m["code_version"]
    lines.append(f"- 代码版本：git HEAD `{c.get('git_head')}`，工作区 diff 哈希 `{c.get('git_diff_sha256')}`，二进制 SHA256 `{c.get('binary_sha256')}`。")
    lines.append(f"- Feature 阶段：`{c.get('feature_stage')}`；R2 阶段：`{c.get('r2_stage')}`；诊断列：`{c.get('diagnostic_stage')}`。")
    lines.append(f"- 预算（事先固定）：Feature 墙钟 {b.get('feature_timeout_ms')} ms，R2 墙钟 {b.get('r2_timeout_ms')} ms，v0.4 诊断 {b.get('feature_v04_timeout_ms')} ms；驱动器硬杀宽限 {b.get('hard_kill_grace_s')} s；RTS 堆上限 {b.get('rts_max_heap')}；搜索工作量预算为各入口既有默认值（逐任务记录于每个 stage JSON 的 `config`）。")
    lines.append(f"- 并行：{(m.get('run') or {}).get('workers')} 个任务进程并行，每个 stage 为独立进程；求解器只接收 `train_only/<id>.json`（`test: []`），含 test 对的文件会被二进制拒绝（exit 3）。\n")
    lines.append("## 端到端指标（分母 = 全部官方任务）\n")
    lines.append("| 指标 | 值 |\n|---|---|")
    lines.append(f"| total_tasks | {T} |")
    lines.append(f"| feature_train_exact_count / rate | {fmt_rate(m['feature_train_exact_count'], T)} |")
    lines.append(f"| fallback_count / rate | {fmt_rate(fb, T)} |")
    lines.append(f"| fallback_reason_no_solution | {m['fallback_reason_no_solution']} ({fmt_rate(m['fallback_reason_no_solution'], T)}) |")
    lines.append(f"| fallback_reason_timeout | {m['fallback_reason_timeout']} ({fmt_rate(m['fallback_reason_timeout'], T)}) |")
    lines.append(f"| fallback_reason_unsupported | {m['fallback_reason_unsupported']} ({fmt_rate(m['fallback_reason_unsupported'], T)}) |")
    lines.append(f"| fallback_reason_runtime_error | {m['fallback_reason_runtime_error']} ({fmt_rate(m['fallback_reason_runtime_error'], T)}) |")
    lines.append(f"| r2_train_exact_count / rate among fallbacks | {fmt_rate(m['r2_train_exact_count'], fb)} |")
    lines.append(f"| r2 timeout / runtime_error | {m['r2_timeout_count']} / {m['r2_runtime_error_count']} |")
    lines.append(f"| pipeline_train_exact_count / rate | {fmt_rate(m['pipeline_train_exact_count'], T)} |")
    lines.append(f"| Feature wall-clock | {secs(fw)} |")
    lines.append(f"| Feature search_work | {work(fwork)} |")
    lines.append(f"| Feature timeouts (in-process / hard-kill) | {m['feature_timeout_count']} / {m['feature_hard_kill_count']} |")
    lines.append(f"| R2 wall-clock (fallback tasks) | {secs(rw)} |")
    lines.append(f"| R2 search_work (total_expanded_work) | {work(rwork)} |")
    lines.append(f"| R2 timeouts (in-process / hard-kill) | {m['r2_timeout_count']} / {m['r2_hard_kill_count']} |")
    lines.append(f"| tasks not run | {m['tasks_not_run']} |\n")
    lines.append("## 条件指标（分母 = 可解析且被 Feature 接口接受的任务）\n")
    lines.append(f"定义：{cp['definition']}。\n")
    lines.append("| 指标 | 值 |\n|---|---|")
    lines.append(f"| processable_count | {cp['count']} |")
    lines.append(f"| feature_train_exact | {fmt_rate(cp['feature_train_exact_count'], cp['count'])} |")
    lines.append(f"| fallback | {fmt_rate(cp['fallback_count'], cp['count'])} |")
    lines.append(f"| r2_train_exact among fallbacks | {fmt_rate(cp['r2_train_exact_count'], cp['fallback_count'])} |")
    lines.append(f"| pipeline_train_exact | {fmt_rate(cp['pipeline_train_exact_count'], cp['count'])} |\n")
    lines.append("## 五个问题的回答\n")
    lines.append(f"1. **真实 ARC-AGI-1 training 上的 Feature train-exact rate**：{fmt_rate(m['feature_train_exact_count'], T)}（条件分母：{fmt_rate(cp['feature_train_exact_count'], cp['count'])}）。任务：{idlist('feature_train_exact')}。")
    so = m['fallback_reason_no_solution'] + m['fallback_reason_timeout']
    lines.append(f"2. **仅因训练精确解缺失或超时而回退的比例**：{fmt_rate(so, T)}（no_solution {m['fallback_reason_no_solution']} + timeout {m['fallback_reason_timeout']}）。")
    ue = m['fallback_reason_unsupported'] + m['fallback_reason_runtime_error']
    lines.append(f"3. **因输入不受支持或运行错误而回退的任务数**：{ue}（unsupported {m['fallback_reason_unsupported']}，runtime_error {m['fallback_reason_runtime_error']}；{fmt_rate(ue, T)}）。")
    lines.append(f"4. **R2 在回退任务中恢复的训练精确解**：{fmt_rate(m['r2_train_exact_count'], fb)}；R2 超时 {m['r2_timeout_count']}，运行错误 {m['r2_runtime_error_count']}。任务：{idlist('r2_train_exact')}。")
    fams = list(m["feature_failure_families"].items())
    top = "；".join(f"`{k}` {v['count']}" for k, v in fams[:8]) if fams else "（无回退）"
    lines.append(f"5. **Feature 算法的主要失败原因**（按失败字符串前缀分组）：{top}。完整分布见下表与 `metrics.json` 的 `feature_failure_details`。\n")
    lines.append("## Feature 失败原因分布\n")
    lines.append("| 失败类别（前缀） | 数量 | 占回退 |\n|---|---|---|")
    for k, v in fams:
        lines.append(f"| `{k}` | {v['count']} | {fmt_rate(v['count'], fb)} |")
    lines.append("\n详细失败字符串（前 15 条）：\n")
    lines.append("| 失败字符串（截断） | 数量 |\n|---|---|")
    for k, v in list(m["feature_failure_details"].items())[:15]:
        lines.append(f"| `{k}` | {v['count']} |")
    lines.append("\n## R2 回退结果分布\n")
    lines.append("| R2 状态: 失败字符串（截断） | 数量 |\n|---|---|")
    for k, v in list(m["r2_failure_details"].items())[:15]:
        lines.append(f"| `{k}` | {v['count']} |")
    lines.append("\n## 各类别任务 ID\n")
    for key, title in [("feature_train_exact", "Feature train-exact"), ("fallback_no_solution", "回退：no_solution"), ("fallback_timeout", "回退：timeout"),
                       ("fallback_unsupported", "回退：unsupported"), ("fallback_runtime_error", "回退：runtime_error"),
                       ("r2_train_exact", "R2 train-exact"), ("r2_timeout", "R2 timeout"), ("r2_runtime_error", "R2 runtime_error"), ("not_run", "未运行")]:
        lines.append(f"- **{title}**（{len(m['task_ids'][key])}）：{idlist(key)}")
    lines.append("\n## 诊断列：v0.4 triggered feature front（不参与回退链）\n")
    lines.append(f"- train-exact：{fmt_rate(v04['train_exact_count'], T)}；状态分布 {json.dumps(v04['status_counts'])}；wall-clock {secs(v04['wall_clock_seconds'])}。")
    lines.append(f"- 仅 v0.4 解出：{', '.join(v04['v04_only_task_ids']) or '（无）'}；仅 v0.6.1 解出：{', '.join(v04['v061_only_task_ids']) or '（无）'}。")
    st = m["structure"]
    lines.append(f"\n## 结构性事实\n\n- 输入输出画布相同的任务：{st['same_canvas_count']}/{T}；画布相同且编码器对象数逐例相等：{st['same_canvas_and_equal_object_counts']}/{T}（v0.6.1 collection front 的两个硬前提）。")
    if tests:
        lines.append("\n## 测试结果（数据完整性 / 防泄漏 / 超时 / 回退链路）\n")
        lines.append("| 测试 | 结果 | 说明 |\n|---|---|---|")
        for t in tests["tests"]:
            lines.append(f"| {t['name']} | {'PASS' if t['passed'] else 'FAIL'} | {t['detail'][:200]} |")
        lines.append(f"\n{tests['passed']}/{tests['total']} 通过；详情 `tests/test_report.json`。")
    lines.append("\n## 范围说明\n")
    lines.append("- 本轮不评估 test 泛化准确率，不根据 test 输出选择程序，也不宣称 train-exact 等价于真实规则正确。")
    lines.append("- Feature / DSL / prior / 搜索策略未修改；未加入任务 ID 特例；预算在 smoke test 后、全量运行前固定，不按单任务结果调整。")
    lines.append("- `unsupported` 的判定：任务文件解析失败，或 Feature 前端在搜索开始前的接口前提拒绝（v0.6.1：失败字符串前缀 `layout:` / `grounding:`）；其余无程序的情况计为 `no_solution`（例如 `RankAlign: unequal input/output cardinality` 是在编码并计数对象后由搜索阶段给出的拒绝）。")
    with open(out / "summary.md", "w", encoding="utf-8", newline="\n") as f:
        f.write("\n".join(lines) + "\n")


# --------------------------------------------------------------------------- tests

def cmd_test(args):
    out = Path(args.out)
    binary = Path(args.binary)
    tdir = out / "tests"
    if tdir.exists():
        shutil.rmtree(tdir)
    tdir.mkdir(parents=True)
    manifest = read_json(out / "data_manifest.json")
    source = Path(manifest["source_dir"])
    results = []

    def record(name, passed, detail):
        results.append({"name": name, "passed": bool(passed), "detail": detail})
        log(f"{'PASS' if passed else 'FAIL'} {name}: {detail}")

    # 1. data integrity: count, hashes stable, all parse, frozen-subset consistency
    files = sorted(source.glob("*.json"))
    subset = bool(args.limit or args.tasks)
    expected_listed = min(manifest["expected_count"], args.limit) if args.limit and not args.tasks else manifest["expected_count"]
    record("data_count", len(files) == manifest["expected_count"] and (manifest["task_count"] == expected_listed or (args.tasks and manifest["task_count"] > 0)),
           f"{len(files)} files in source (expected {manifest['expected_count']}), manifest lists {manifest['task_count']}" + (" [smoke subset]" if subset else ""))
    mism = [t["task_id"] for t in manifest["tasks"] if sha256_file(source / f"{t['task_id']}.json") != t["sha256"]]
    record("data_hashes_stable", not mism, f"{len(mism)} files changed since manifest" + (f": {mism[:5]}" if mism else ""))
    record("data_all_parse", manifest["parse_ok_count"] == manifest["task_count"],
           f"{manifest['parse_ok_count']}/{manifest['task_count']} parse; errors: {[t['task_id'] for t in manifest['tasks'] if not t['parse_ok']][:5]}")
    frozen = ROOT / "results" / "v03" / "frozen_arc1_tasks.json"
    if frozen.exists():
        fz = read_json(frozen)
        by_id = {t["task_id"]: t["sha256"] for t in manifest["tasks"]}
        bad = [tid for tid, h in fz["task_sha256"].items() if tid in by_id and by_id[tid] != h]
        present = [tid for tid in fz["task_sha256"] if tid in by_id]
        record("data_matches_v03_frozen_subset", not bad and (len(present) == len(fz["task_sha256"]) or args.limit),
               f"{len(present)}/{len(fz['task_sha256'])} frozen tasks present, {len(bad)} hash mismatches; upstream commit equal: {fz.get('upstream_commit') == manifest['upstream_commit']}")

    # 2. leak isolation at the file level
    bad_files = []
    for t in manifest["tasks"]:
        if not t["parse_ok"]:
            continue
        obj = read_json(out / t["train_only_file"])
        if set(obj.keys()) != {"train", "test"} or obj["test"] != []:
            bad_files.append(t["task_id"])
    record("leak_train_only_files_have_empty_test", not bad_files, f"{len(bad_files)} train-only files carry test content")
    # the stripped file must be byte-identical whether the source test field is real, corrupted or absent
    sample = [t for t in manifest["tasks"] if t["parse_ok"]][:5]
    same = True
    for t in sample:
        obj = read_json(source / f"{t['task_id']}.json")
        variants = [dict(obj)]
        corrupted = dict(obj)
        corrupted["test"] = [{"input": [[9]], "output": [[1, 2], [3, 4]]}]
        variants.append(corrupted)
        absent = {k: v for k, v in obj.items() if k != "test"}
        variants.append(absent)
        texts = set()
        for v in variants:
            s, _ = strip_to_train_only(v)
            texts.add(json.dumps(s, separators=(",", ":"), sort_keys=True))
        if len(texts) != 1 or sha256_text(next(iter(texts)) + "\n") != t["train_only_sha256"]:
            same = False
    record("leak_stripping_independent_of_test_field", same, f"{len(sample)} tasks: stripped output identical for real/corrupted/absent test fields and equals manifest hash")

    # 3. leak guard in the binary: a file with test pairs is refused before any search
    if binary.exists() and sample:
        src = source / f"{sample[0]['task_id']}.json"
        guard_dir = tdir / "leak_guard"
        proc = subprocess.run([str(binary), "arc-train-only-stage", "--stage", "feature", "--task", str(src), "--out", str(guard_dir), "--timeout-ms", "1000"],
                              capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=120, cwd=ROOT)
        rec = read_json(guard_dir / "feature.json") if (guard_dir / "feature.json").exists() else {}
        record("leak_binary_refuses_test_pairs", proc.returncode == 3 and rec.get("status") == "refused_test_pairs",
               f"exit={proc.returncode}, status={rec.get('status')}")

        # A train-only copy of 03560426 (evaluation task, front-solvable with ~3000
        # work units) gives the timeout probes a stage that actually searches.
        chain_dir = tdir / "chain"
        chain_dir.mkdir(parents=True, exist_ok=True)
        solvable_src = ROOT / "data" / "03560426.json"
        solv_file = None
        if solvable_src.exists():
            s, _ = strip_to_train_only(read_json(solvable_src))
            solv_file = chain_dir / "03560426.json"
            solv_file.write_text(json.dumps(s, separators=(",", ":"), sort_keys=True) + "\n", encoding="utf-8")
        # 4. timeout handling and R2 independence after a Feature timeout
        probe = solv_file if solv_file else out / sample[0]["train_only_file"]
        probe_id = probe.stem
        tdir_to = tdir / "timeout"
        f_full = run_stage(binary, "feature", probe, tdir_to / "full", args.feature_timeout_ms)
        f1 = run_stage(binary, "feature", probe, tdir_to, 1)
        record("timeout_feature_classified", f1["status"] == "timeout" and f1["timed_out"] is True and not f1["hard_kill"] and f_full["status"] != "timeout",
               f"task {probe_id}: full budget -> {f_full['status']} (work={f_full.get('search_work')}, {f_full.get('wall_clock_seconds')}s); 1 ms budget -> status={f1['status']} detail={f1.get('detail','')[:60]} seconds={f1.get('wall_clock_seconds')}")
        r_small = run_stage(binary, "r2", probe, tdir_to, 1)
        record("timeout_r2_classified", r_small["status"] == "timeout" and not r_small["hard_kill"],
               f"task {probe_id} r2 with 1 ms budget -> status={r_small['status']} seconds={r_small.get('wall_clock_seconds')}")
        r_full = run_stage(binary, "r2", probe, tdir_to, args.r2_timeout_ms)
        record("r2_runs_independently_after_feature_timeout", r_full["status"] in ("train_exact", "no_solution", "timeout", "unsupported") and r_full["exit_code"] == 0,
               f"fresh r2 process on {probe_id} after the feature timeout -> status={r_full['status']} work={r_full.get('search_work')} seconds={r_full.get('wall_clock_seconds'):.2f}; separate process, no shared state")

        # 5. fallback chain: a front-solvable task triggers no R2; a front-failing task triggers R2
        if solv_file:
            task = {"task_id": "03560426-trainonly", "parse_ok": True, "train_only_file": str(solv_file.relative_to(out))}
            d1 = run_task(binary, out, task, {"feature": args.feature_timeout_ms, "feature-v04": args.v04_timeout_ms, "r2": args.r2_timeout_ms}, False)
            shutil.move(str(out / "tasks" / task["task_id"]), str(chain_dir / "solvable"))
            record("chain_front_success_skips_r2", d1["feature_status"] == "train_exact" and d1["r2_run"] is False and d1["pipeline_train_exact"] is True,
                   f"03560426 (train-only): feature={d1['feature_status']} r2_run={d1['r2_run']}")
        t0 = sample[0]
        task = {"task_id": t0["task_id"] + "-chain", "parse_ok": True, "train_only_file": t0["train_only_file"]}
        d2 = run_task(binary, out, task, {"feature": args.feature_timeout_ms, "feature-v04": args.v04_timeout_ms, "r2": args.r2_timeout_ms}, False)
        shutil.move(str(out / "tasks" / task["task_id"]), str(chain_dir / "fallback"))
        record("chain_front_failure_triggers_r2", (d2["feature_status"] == "train_exact") != (d2["r2_run"] is True) and ((not d2["r2_run"]) or d2["r2_status"] is not None),
               f"{t0['task_id']}: feature={d2['feature_status']} fallback_reason={d2['fallback_reason']} r2_run={d2['r2_run']} r2={d2['r2_status']}")

        # 6. determinism of the feature stage
        det_dir_a, det_dir_b = tdir / "det_a", tdir / "det_b"
        a = run_stage(binary, "feature", out / t0["train_only_file"], det_dir_a, args.feature_timeout_ms)
        b_ = run_stage(binary, "feature", out / t0["train_only_file"], det_dir_b, args.feature_timeout_ms)
        keys = ("status", "detail", "program", "search_work", "counters")
        record("feature_stage_deterministic", all(a.get(k) == b_.get(k) for k in keys), f"{t0['task_id']}: identical on {keys}")
    else:
        record("binary_available", False, f"binary missing: {binary}")

    report = {"total": len(results), "passed": sum(1 for r in results if r["passed"]), "tests": results,
              "run_at_utc": datetime.now(timezone.utc).isoformat()}
    write_json(tdir / "test_report.json", report)
    log(f"tests: {report['passed']}/{report['total']} passed")
    return report["passed"] == report["total"]


# --------------------------------------------------------------------------- main

def add_common(p):
    p.add_argument("--out", default=str(DEFAULT_OUT))
    p.add_argument("--source", default=str(DEFAULT_SOURCE))
    p.add_argument("--binary", default=str(DEFAULT_BIN))
    p.add_argument("--workers", type=int, default=6)
    p.add_argument("--limit", type=int, default=0)
    p.add_argument("--tasks", default="")
    p.add_argument("--force", action="store_true")
    p.add_argument("--no-v04", action="store_true", help="skip the v0.4 diagnostic column")
    p.add_argument("--feature-timeout-ms", type=int, default=DEFAULT_FEATURE_TIMEOUT_MS)
    p.add_argument("--v04-timeout-ms", type=int, default=DEFAULT_V04_TIMEOUT_MS)
    p.add_argument("--r2-timeout-ms", type=int, default=DEFAULT_R2_TIMEOUT_MS)


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    for name in ("prepare", "run", "report", "test", "all"):
        add_common(sub.add_parser(name))
    args = ap.parse_args()
    if args.cmd == "prepare":
        cmd_prepare(args)
    elif args.cmd == "run":
        cmd_run(args)
    elif args.cmd == "report":
        cmd_report(args)
    elif args.cmd == "test":
        ok = cmd_test(args)
        sys.exit(0 if ok else 1)
    elif args.cmd == "all":
        cmd_prepare(args)
        ok = cmd_test(args)
        if not ok and not args.force:
            sys.exit("tests failed; aborting before the run (use --force to override)")
        cmd_run(args)
        cmd_report(args)


if __name__ == "__main__":
    main()
