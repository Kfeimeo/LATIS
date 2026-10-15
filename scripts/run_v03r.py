"""Reproducible sequential v0.3R comparison; never changes frozen task data."""
import argparse
import datetime
import hashlib
import json
import pathlib
import subprocess
import time

ROOT = pathlib.Path(__file__).resolve().parents[1]
OUT = ROOT / "results/v03r"
CABAL = ["cabal", "--config-file=scripts/cabal.config"]
MODES = ["InducedTSLFull", "LegacyFamilies", "NoWitness", "NoVersionSpaceSharing",
         "NoTaskAbstraction", "NoEffectPropagation", "NoFVDependency"]


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def validate_inputs():
    manifest = json.loads((ROOT / "results/v03/frozen_arc1_tasks.json").read_text())
    data = dict(manifest)
    claimed = data.pop("hash")
    assert hashlib.sha256(json.dumps(data, sort_keys=True, separators=(",", ":")).encode()).hexdigest() == claimed
    for task, expected in manifest["task_sha256"].items():
        assert digest(ROOT / "data/arc1-frozen" / f"{task}.json") == expected
    for source, expected in manifest["baseline_source_sha256"].items():
        assert digest(ROOT / source) == expected, f"canonical/base legacy source changed: {source}"
    regression = sorted((ROOT / "results/v03/regression").glob("*/task.json"))
    stress = sorted((ROOT / "results/v03/stress").glob("*/task.json"))
    assert len(regression) == 17 and len(stress) == 10
    return manifest, regression, stress


def run_one(binary, fingerprint, group, task, path, mode, budget, timeout):
    directory = OUT / group / task / mode
    directory.mkdir(parents=True, exist_ok=True)
    args = [str(binary), "solve-v03" if mode == "LegacyFamilies" else "solve-v03r",
            "--task", str(path), "--out", str(directory), "--budget", str(budget), "--branches", "32"]
    args += ["--solutions", "128"] if mode == "LegacyFamilies" else ["--mode", mode, "--depth", "7", "--frontier", "32"]
    protocol = {"fingerprint": fingerprint, "input_sha256": digest(path), "command": args,
                "timeout_seconds": timeout, "group": group, "task": task, "ablation": mode}
    record = directory / "execution.json"
    result = directory / "solution.json"
    cached = record.exists() and result.exists() and json.loads(record.read_text()).get("protocol") == protocol
    if not cached:
        started = time.monotonic()
        error = None
        with (directory / "execution.log").open("w", encoding="utf-8") as log:
            try:
                subprocess.run(args, cwd=ROOT, stdout=log, stderr=subprocess.STDOUT,
                               timeout=timeout, check=True)
            except (subprocess.TimeoutExpired, subprocess.CalledProcessError) as exc:
                error = exc
        elapsed = time.monotonic() - started
        if error is not None:
            is_timeout = isinstance(error, subprocess.TimeoutExpired)
            row = {"task": task, "mode": mode, "train_exact": False, "heldout_exact": False,
                   "verification_completed": False, "program": None,
                   "failure": "SearchFailure" if is_timeout else "ImplementationBug",
                   "failure_evidence": f"external {timeout}s process budget" if is_timeout else str(error),
                   "statistics": {"wall_clock_seconds": elapsed}, "external_timeout": is_timeout}
            result.write_text(json.dumps(row, indent=2) + "\n", encoding="utf-8")
        record.write_text(json.dumps({"protocol": protocol, "elapsed_seconds": elapsed,
                          "finished_at": datetime.datetime.now(datetime.timezone.utc).isoformat()}, indent=2) + "\n", encoding="utf-8")
    row = json.loads(result.read_text())
    row.update(task=task, ablation=mode, input_sha256=digest(path))
    if group == "diagnostic":
        row["evaluation_set"] = "PreviouslyOpenedDiagnosticSet"
    if mode == "LegacyFamilies":
        row["legacy_failure_taxonomy"] = row.get("failure")
        row["legacy_path"] = "v0.3 fixed families plus handwritten hierarchical codecs"
    print(f"{group}/{task}/{mode}: train={row.get('train_exact')} heldout={row.get('heldout_exact')} failure={row.get('failure')}", flush=True)
    return row


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--groups", nargs="+", default=["core", "regression", "stress", "diagnostic"])
    parser.add_argument("--modes", nargs="+", default=MODES, choices=MODES)
    parser.add_argument("--timeout", type=int, default=60)
    parser.add_argument("--skip-build", action="store_true")
    parser.add_argument("--tests", action="store_true")
    args = parser.parse_args()
    manifest, regression, stress = validate_inputs()
    OUT.mkdir(parents=True, exist_ok=True)
    if not args.skip_build:
        subprocess.run(CABAL + ["build", "all", "--offline"], cwd=ROOT, check=True)
    binary = pathlib.Path(subprocess.check_output(CABAL + ["list-bin", "exe:latis"], cwd=ROOT, text=True).strip())
    paths = list((ROOT / "src").rglob("*.hs")) + [ROOT / "latis.cabal", ROOT / "app/Main.hs", pathlib.Path(__file__)]
    fingerprint = {"binary_sha256": digest(binary), "source_sha256": {p.relative_to(ROOT).as_posix(): digest(p) for p in sorted(paths)}}
    lock = {"version": "LATIS-v0.3R", "fingerprint": fingerprint, "frozen_manifest_hash": manifest["hash"],
            "diagnostic_label": "PreviouslyOpenedDiagnosticSet", "task_sha256": {str(p.relative_to(ROOT)): digest(p) for p in regression + stress},
            "note": "Development regressions and previously opened diagnostic data. No claim of a new unseen audit. Budgets count different algorithm-specific units; compare wall time separately."}
    (OUT / "protocol.json").write_text(json.dumps(lock, indent=2) + "\n", encoding="utf-8")
    if args.tests:
        with (OUT / "tests.log").open("w", encoding="utf-8") as log:
            subprocess.run(CABAL + ["test", "all", "--offline", "--test-show-details=direct"], cwd=ROOT, check=True, stdout=log, stderr=subprocess.STDOUT)
    groups = {"core": [("03560426", ROOT / "data/03560426.json")],
              "regression": [(p.parent.name, p) for p in regression],
              "stress": [(p.parent.name, p) for p in stress],
              "diagnostic": [(t, ROOT / "data/arc1-frozen" / f"{t}.json") for t in manifest["task_ids"]]}
    for group in args.groups:
        rows = []
        modes = args.modes if group != "diagnostic" else [m for m in args.modes if m in ["InducedTSLFull", "LegacyFamilies"]]
        for task, path in groups[group]:
            for mode in modes:
                rows.append(run_one(binary, fingerprint, group, task, path, mode, 25000 if group == "diagnostic" else 250000, args.timeout))
                (OUT / group / "comparison.json").write_text(json.dumps(rows, indent=2) + "\n", encoding="utf-8")
        if group == "core":
            full = OUT / "core/03560426/InducedTSLFull"
            if full.exists():
                target = OUT / "03560426"
                target.mkdir(exist_ok=True)
                for name in ["solution.json", "induced_tsl.json", "induced_tsl_trace.md", "version_space.json", "base_registry.json"]:
                    if (full / name).exists():
                        (target / name).write_bytes((full / name).read_bytes())
    validate_inputs()


if __name__ == "__main__":
    main()
