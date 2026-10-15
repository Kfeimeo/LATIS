"""Sequential development validation, followed by a sealed 30-task audit."""
import datetime
import hashlib
import json
import pathlib
import re
import shutil
import subprocess
import sys
import time

ROOT = pathlib.Path(__file__).resolve().parents[1]
OUT = ROOT / "results/v03"
CABAL = ["cabal", "--config-file=scripts/cabal.config"]

def run(args, **kwargs):
    return subprocess.run(args, cwd=ROOT, check=True, **kwargs)

def sources():
    paths = list((ROOT / "src").rglob("*.hs")) + list((ROOT / "test").rglob("*.hs")) + list((ROOT / "app").rglob("*.hs")) + [ROOT / "latis.cabal", ROOT / "scripts/run_v03.py", ROOT / "scripts/freeze_arc1.py"]
    return {p.relative_to(ROOT).as_posix(): hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(paths)}

def validate_manifest():
    manifest = json.loads((OUT / "frozen_arc1_tasks.json").read_text())
    data = dict(manifest)
    digest = data.pop("hash")
    canonical = json.dumps(data, sort_keys=True, separators=(",", ":")).encode()
    assert hashlib.sha256(canonical).hexdigest() == digest
    assert len(manifest["task_ids"]) == 30 and len(set(manifest["task_ids"])) == 30
    for task, digest in manifest["task_sha256"].items():
        assert hashlib.sha256((ROOT / "data/arc1-frozen" / (task + ".json")).read_bytes()).hexdigest() == digest
    for source, digest in manifest["baseline_source_sha256"].items():
        assert hashlib.sha256((ROOT / source).read_bytes()).hexdigest() == digest, source
    return manifest

def audit(binary, manifest):
    target = OUT / "frozen-audit"
    target.mkdir(exist_ok=True)
    ledger_path = OUT / "audit_opened.json"
    now = datetime.datetime.now(datetime.timezone(datetime.timedelta(hours=8))).isoformat()
    locked = {"source_sha256": sources(), "binary_sha256": hashlib.sha256(binary.read_bytes()).hexdigest(),
              "manifest_hash": manifest["hash"], "version": "LATIS-v0.3-first-frozen-audit",
              "mode": "V03Full", "state_budget": 25000, "correspondence_budget": 32,
              "solution_limit": 128, "per_task_timeout_seconds": 60,
              "protocol": "One sequential run per manifest ID. Solver receives training pairs only; public test outputs used after selection. No grammar, observer, weight or task-set changes after opening."}
    if ledger_path.exists():
        previous = json.loads(ledger_path.read_text())
        assert all(previous[k] == v for k, v in locked.items()), "Audit already opened: source/binary/protocol changed. A new version label is required; never overwrite the first audit."
    else:
        ledger_path.write_text(json.dumps(dict(locked, opened_at=now, evaluation_opened=True), indent=2) + "\n", encoding="utf-8")
    rows = []
    for i, task in enumerate(manifest["task_ids"], 1):
        dest = target / task
        dest.mkdir(exist_ok=True)
        result = dest / "solution.json"
        if not result.exists():
            started = time.monotonic()
            args = [str(binary), "solve-v03", "--task", f"data/arc1-frozen/{task}.json", "--out", str(dest),
                    "--budget", "25000", "--branches", "32", "--solutions", "128"]
            with (dest / "execution.log").open("w", encoding="utf-8") as log:
                try:
                    run(args, timeout=60, stdout=log, stderr=subprocess.STDOUT)
                except (subprocess.TimeoutExpired, subprocess.CalledProcessError) as error:
                    timeout = isinstance(error, subprocess.TimeoutExpired)
                    row = {"task": task, "mode": "V03Full", "route": None, "program": None,
                           "train_exact": False, "heldout_exact": False, "verification_completed": False,
                           "failure": "BudgetFailure" if timeout else "VerifierOrImplementationFailure",
                           "failure_evidence": "External 60-second wall budget reached" if timeout else f"Executable exited {error.returncode}; see execution.log",
                           "statistics": {"budget_exhausted": timeout, "wall_clock_seconds": time.monotonic()-started}}
                    result.write_text(json.dumps(row, indent=2) + "\n", encoding="utf-8")
        row = json.loads(result.read_text())
        rows.append(row)
        print(f"Frozen {i}/30: {task} {row['failure']}", flush=True)
    (target / "audit.json").write_text(json.dumps(rows, indent=2) + "\n", encoding="utf-8")

def publish_stress_traces():
    """Also expose the requested results/v03/<task>/latent_trace.md paths."""
    rows = json.loads((OUT / "stress/suite.json").read_text())
    for row in rows:
        name = row["task"]
        assert re.fullmatch(r"[A-J]-[a-z-]+", name)
        dest = OUT / name
        dest.mkdir(exist_ok=True)
        for filename in ("latent_trace.md", "hypotheses.json", "solution.json", "task.json"):
            shutil.copy2(OUT / "stress" / name / filename, dest / filename)

def main():
    manifest = validate_manifest()
    run(CABAL + ["build", "all", "--offline"])
    binary = pathlib.Path(subprocess.check_output(CABAL + ["list-bin", "exe:latis"], cwd=ROOT, text=True).strip())
    if "--audit-only" not in sys.argv:
        with (OUT / "tests.log").open("w", encoding="utf-8") as log:
            run(CABAL + ["test", "--offline", "--test-show-details=direct"], stdout=log, stderr=subprocess.STDOUT)
        for cmd, subdir in [("v03-stress", "stress"), ("v03-regression", "regression"), ("v03-ablation", "stress")]:
            run([str(binary), cmd, "--out", str(OUT / subdir)])
        run([str(binary), "solve-v03", "--task", "data/03560426.json", "--out", str(OUT / "core")])
    if "--no-audit" not in sys.argv:
        publish_stress_traces()
        audit(binary, manifest)
        run([sys.executable, "scripts/make_v03_report.py"])

if __name__ == "__main__":
    main()
