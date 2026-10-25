"""Audit the Stage D executable substrate; never label BaselineC as FullD."""
import csv
import hashlib
import json
import subprocess
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "results/stage_d"


def read(path):
    return json.loads(path.read_text(encoding="utf-8-sig"))


def write(name, value):
    (OUT / name).write_text(json.dumps(value, ensure_ascii=False, indent=2), encoding="utf-8")


def verify_pixels(graph):
    width, height = graph["width"], graph["height"]
    grid = [[graph["background"] for _ in range(width)] for _ in range(height)]
    previous_emission = -1
    for pixel in graph["pixels"]:
        assert 0 <= pixel["x"] < width and 0 <= pixel["y"] < height
        assert 0 <= pixel["color"] <= 9
        assert previous_emission <= pixel["emission"] < graph["emission_count"]
        assert pixel["sources"] and set(pixel["sources"]) <= set(graph["source_ids"])
        previous_emission = pixel["emission"]
        grid[pixel["y"]][pixel["x"]] = pixel["color"]
    assert grid == graph["grid"]


def main():
    OUT.mkdir(parents=True, exist_ok=True)
    graphs = list((OUT / "mechanism").glob("*.graph.json"))
    for path in graphs:
        verify_pixels(read(path))
    assert len(graphs) == 15, "expected 3 seeds x (4 training + 1 heldout)"
    # Tampering must fail the independent verifier.
    bad = read(graphs[0])
    bad["pixels"][0]["x"] = bad["width"]
    try:
        verify_pixels(bad)
    except AssertionError:
        pass
    else:
        raise AssertionError("tampered render evidence accepted")
    pools = [read(p) for p in sorted((OUT / "mechanism").glob("pool-*.json"))]
    suites = {}
    for path in sorted((OUT / "validation").glob("*-tests.txt")):
        text = path.read_text(encoding="utf-8-sig", errors="replace")
        assert "FAIL " not in text and "error:" not in text.lower(), path
        count = sum(line.startswith("PASS ") for line in text.splitlines())
        # Some historical suites only print one suite-level success message;
        # absence of granular counts is not evidence of zero assertions.
        suites[path.stem] = count if count else None
    replay = OUT / "baseline_c_replay"
    baseline = ROOT / "results/stage_c/arc_idle"
    old, new = {}, {}
    for folder, store in ((baseline, old), (replay, new)):
        for path in (folder / "tasks").glob("*/stage-c-ObjectShapeFull.json"):
            store[path.parent.name] = read(path)
    rows = []
    for tid, record in sorted(new.items()):
        previous = old.get(tid, {})
        completed = record.get("status") != "timeout" and previous.get("status") != "timeout"
        rows.append({"task_id": tid, "config": "BaselineC_replay_new_binary",
                     "status": record.get("status"), "previous_status": previous.get("status"),
                     "train_exact": record.get("train_exact"), "failure_stage": record.get("failure_stage"),
                     "search_work": record.get("search_work"), "previous_search_work": previous.get("search_work"),
                     "common_completed": completed,
                     "work_equal": record.get("search_work") == previous.get("search_work") if completed else None,
                     "wall_clock_seconds": record.get("wall_clock_seconds"),
                     "rts_max_live_bytes": record.get("rts_max_live_bytes"),
                     "first_solution_work": (record.get("counters") or {}).get("first_solution_work"),
                     "total_work_to_exhaustion": (record.get("counters") or {}).get("total_work_to_exhaustion"),
                     "stage_d_search": "not_implemented"})
    if rows:
        with (OUT / "per_task.csv").open("w", newline="", encoding="utf-8") as f:
            writer = csv.DictWriter(f, fieldnames=list(rows[0]))
            writer.writeheader()
            writer.writerows(rows)
    old_exact = {k for k, v in old.items() if v.get("train_exact")}
    new_exact = {k for k, v in new.items() if v.get("train_exact")}
    comparable = [r for r in rows if r["common_completed"]]
    stats = {"implementation_status": "partial_P0_executable_substrate",
             "not_FullD": True, "full_d_train_exact": None, "full_d_fallback_rate": None,
             "full_d_search_work": None, "full_d_arc_experiment": "not_run_no_joint_search",
             "validation_assertions": suites, "independently_verified_pixel_graphs": len(graphs),
             "parameter_unit_experiments": pools,
             "baseline_c_replay": {"tasks": len(new), "train_exact": len(new_exact),
                                   "old_successes": len(old_exact),
                                   "lost_old_solutions": sorted((old_exact & set(new))-new_exact),
                                   "old_successes_not_run": sorted(old_exact-set(new)),
                                   "new_solutions": sorted(new_exact-old_exact),
                                   "timeouts": sum(v.get("status") == "timeout" for v in new.values()),
                                   "common_completed": len(comparable),
                                   "work_equal": sum(r["work_equal"] for r in comparable),
                                   "search_work_common_sum": sum(r["search_work"] for r in comparable),
                                   "old_search_work_common_sum": sum(r["previous_search_work"] for r in comparable),
                                   "fallback_required_count": sum(not v.get("train_exact", False) for v in new.values()),
                                   "fallback_executed": False,
                                   "peak_rts_max_live_bytes_completed": max((v.get("rts_max_live_bytes", 0) for v in new.values()), default=None),
                                   "wall_seconds_sum": sum(v.get("wall_clock_seconds", 0) for v in new.values())}}
    write("metrics.json", stats)
    write("new_solutions.json", {"FullD": None, "reason": "FullD search not implemented or run",
                                 "BaselineC_replay": stats["baseline_c_replay"]})
    with (OUT / "metrics.csv").open("w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerow(["experiment", "status", "tasks", "train_exact"])
        writer.writerow(["BaselineC_replay", "completed" if len(new) == 400 else "partial", len(new), len(new_exact)])
        for cfg in ["BaselineA", "BaselineB", "TypedParamsOnly", "ComposeOnly", "TypedCompose", "FullD", "NoParamVSA"]:
            writer.writerow([cfg, "not_run", "", ""])
    files = ["src/Synthesis/Collection/Parameter.hs", "src/Synthesis/Collection/Relation.hs",
             "src/Synthesis/Collection/Front.hs", "test/StageDMain.hs", "build/latis-stage-d-substrate.exe", "build/stage-d-final-tests.exe"]
    audit = {"generated_at_utc": datetime.now(timezone.utc).isoformat(), "metrics": stats,
             "git_head": subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip(),
             "git_status": subprocess.check_output(["git", "status", "--porcelain"], cwd=ROOT, text=True),
             "sha256": {name: hashlib.sha256((ROOT / name).read_bytes()).hexdigest() for name in files if (ROOT / name).exists()},
             "missing_P0": ["task-level joint parameter/grid search and trigger/config wiring",
                            "full legacy Count/Offset migration and independent differential tests",
                            "TypedGoal snapshots with witnessed ordering, cached at task level",
                            "complete six-family solver mechanism matrix with baseline negative controls",
                            "eight-configuration ARC matrix and first/total work-time instrumentation"],
             "compiler": subprocess.check_output(["E:/ghcup/ghc/9.10.3/bin/ghc.exe", "--version"], text=True).strip()}
    if (replay / "data_manifest.json").exists():
        manifest = read(replay / "data_manifest.json")
        audit["data_sha256"] = manifest["combined_sha256_of_task_hashes"]
        assert audit["data_sha256"] == read(baseline / "data_manifest.json")["combined_sha256_of_task_hashes"]
        audit["baseline_run_metadata"] = read(replay / "run_meta.json")
        version = read(replay / "code_version.json")
        audit["run_id"] = "stage-d-substrate-" + version["run_id"]
        audit["baseline_binary_sha256"] = version["binary_sha256"]
        audit["source_version_note"] = "Final source hashes above; baseline binary predates Param record-label opacity hardening. That later API-only change is covered by final StageD tests and is unreachable from baseline search. Baseline binary is preserved at its original hash."
        assert audit["sha256"]["build/latis-stage-d-substrate.exe"] == version["binary_sha256"]
        for task in (replay / "train_only").glob("*.json"):
            assert read(task)["test"] == [], task
    write("audit.json", audit)
    print(json.dumps(stats, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
