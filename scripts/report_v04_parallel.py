"""Summarise v04-bench CSVs and check w1/w4 artifact equality (logical fields only).

Usage: python scripts/report_v04_parallel.py [results/v04-parallel]
Prints a Markdown table of median closure seconds per task and configuration,
plus actual/discarded evaluation counts and max live bytes, and verifies that
the stress matrices run with different worker counts agree on every logical
field of solution.json and derivation_graph.json.
"""
import csv
import json
import statistics
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / (sys.argv[1] if len(sys.argv) > 1 else "results/v04-parallel")
PHYSICAL_PREFIXES = ("parallel_",)
PHYSICAL_KEYS = {"wall_clock", "closure_wall_clock"}


def load_bench(path):
    with path.open(encoding="utf-8-sig", newline="") as f:
        return list(csv.DictReader(f))


def summarise(label, rows):
    by_task = {}
    for r in rows:
        by_task.setdefault(r["task"], []).append(r)
    out = {}
    for task, rs in by_task.items():
        closure = sorted(float(r["closure_seconds"]) for r in rs)
        front = sorted(float(r["front_seconds"]) for r in rs)
        out[task] = {
            "label": label,
            "workers": rs[0]["workers"], "capabilities": rs[0]["capabilities"],
            "n": len(rs),
            "closure_median": statistics.median(closure), "closure_min": closure[0], "closure_max": closure[-1],
            "front_median": statistics.median(front),
            "eval_only_median": statistics.median(float(r["eval_only_seconds"]) for r in rs) if "eval_only_seconds" in rs[0] else None,
            "eval_terms": rs[0].get("eval_terms"),
            "search_work": rs[0]["search_work"], "applications": rs[0]["operator_applications"],
            "actual": rs[0]["actual_evaluations"], "discarded": max(int(r["discarded"] or 0) for r in rs),
            "discarded_evaluated": max(int(r["discarded_evaluated"] or 0) for r in rs),
            "max_live": max((int(r["max_live_bytes"]) for r in rs if r["max_live_bytes"]), default=None),
            "mutator_ns": statistics.median(int(r["mutator_cpu_ns"]) for r in rs if r["mutator_cpu_ns"]) if rs[0]["mutator_cpu_ns"] else None,
            "gc_ns": statistics.median(int(r["gc_cpu_ns"]) for r in rs if r["gc_cpu_ns"]) if rs[0]["gc_cpu_ns"] else None,
        }
    return out


def table(configs):
    tasks = sorted({t for c in configs.values() for t in c})
    base = next(iter(configs.values()))
    lines = ["| task | work | " + " | ".join(f"{k} median s" for k in configs) + " | " + " | ".join(f"{k} speedup" for k in list(configs)[1:]) + " | " + " | ".join(f"{k} actual/discarded" for k in list(configs)[1:]) + " |",
             "|---|---:|" + "---:|" * (len(configs) + (len(configs) - 1) * 2)]
    for t in tasks:
        cells = [t, base[t]["search_work"]]
        cells += [f"{c[t]['closure_median']:.4f}" if t in c else "" for c in configs.values()]
        b = base[t]["closure_median"]
        for k, c in list(configs.items())[1:]:
            cells.append(f"{b / c[t]['closure_median']:.2f}x" if t in c and c[t]["closure_median"] > 0 else "")
        for k, c in list(configs.items())[1:]:
            cells.append(f"{c[t]['actual']}/{c[t]['discarded']} (eval {c[t]['discarded_evaluated']})" if t in c else "")
        lines.append("| " + " | ".join(str(x) for x in cells) + " |")
    return "\n".join(lines)


def strip(obj):
    if isinstance(obj, dict):
        return {k: strip(v) for k, v in obj.items()
                if not k.startswith(PHYSICAL_PREFIXES) and k not in PHYSICAL_KEYS and k != "parallel"}
    if isinstance(obj, list):
        return [strip(x) for x in obj]
    return obj


def compare_matrices(a, b):
    diffs = []
    rows_a = list(csv.DictReader((a / "metrics.csv").open(encoding="utf-8-sig", newline="")))
    rows_b = list(csv.DictReader((b / "metrics.csv").open(encoding="utf-8-sig", newline="")))
    assert len(rows_a) == len(rows_b) == 70
    logical = [k for k in rows_a[0] if k not in ("wall_clock", "closure_wall_clock", "workers")]
    for ra, rb in zip(rows_a, rows_b):
        for k in logical:
            if ra[k] != rb[k]:
                diffs.append((ra["task"], ra["mode"], k, ra[k], rb[k]))
        d = Path(ra["task"]) / ra["mode"]
        for name in ("solution.json", "derivation_graph.json", "contexts.json"):
            ja = strip(json.loads((a / d / name).read_text(encoding="utf-8-sig")))
            jb = strip(json.loads((b / d / name).read_text(encoding="utf-8-sig")))
            if ja != jb:
                diffs.append((ra["task"], ra["mode"], name, "differs", ""))
        ta = (a / d / "trace.txt").read_text(encoding="utf-8-sig")
        tb = (b / d / "trace.txt").read_text(encoding="utf-8-sig")
        if ta != tb:
            diffs.append((ra["task"], ra["mode"], "trace.txt", "differs", ""))
    return diffs


def main():
    bench = OUT / "bench"
    configs = {}
    for label, path in [("w1", bench / "bench-workers1-caps1.csv"), ("w2", bench / "bench-workers2-caps2.csv"),
                        ("w4", bench / "bench-workers4-caps4.csv"), ("w4 -qg", bench / "qg/bench-workers4-caps4.csv"),
                        ("w1 -qg", bench / "qg/bench-workers1-caps1.csv"),
                        ("9.10.3 w1", bench / "ghc-9.10.3/bench-workers1-caps1.csv"),
                        ("9.10.3 w4", bench / "ghc-9.10.3/bench-workers4-caps4.csv")]:
        if path.exists():
            configs[label] = summarise(label, load_bench(path))
    main_cfg = {k: configs[k] for k in ("w1", "w2", "w4", "w4 -qg") if k in configs}
    print(table(main_cfg))
    print()
    if "9.10.3 w1" in configs:
        print(table({k: configs[k] for k in ("9.10.3 w1", "9.10.3 w4") if k in configs}))
        print()
    for label, c in configs.items():
        for t, s in sorted(c.items()):
            mem = f"{s['max_live']/1e6:.1f} MB" if s["max_live"] else "n/a"
            cpu = f"mutator {s['mutator_ns']/1e6:.0f} ms, gc {s['gc_ns']/1e6:.0f} ms" if s["mutator_ns"] is not None else ""
            ev = f"eval-only {s['eval_only_median']:.4f}s ({s['eval_terms']} terms, {100*s['eval_only_median']/s['closure_median']:.1f}% of closure)" if s["eval_only_median"] is not None and s["closure_median"] > 0 else ""
            print(f"{label:10} {t:24} n={s['n']} closure median {s['closure_median']:.4f}s [{s['closure_min']:.4f}, {s['closure_max']:.4f}] front median {s['front_median']:.4f}s {ev} max_live {mem} {cpu}")
    w1, w4 = OUT / "stress-w1", OUT / "stress-w4"
    if w1.exists() and w4.exists():
        diffs = compare_matrices(w1, w4)
        print()
        print("stress-w1 vs stress-w4 logical differences:", len(diffs))
        for d in diffs[:20]:
            print("  ", d)


if __name__ == "__main__":
    main()
