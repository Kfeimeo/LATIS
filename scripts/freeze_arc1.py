"""Freeze filenames before implementation; never inspect grids during selection."""
import hashlib
import json
import pathlib
import random
import subprocess
import urllib.request

ROOT = pathlib.Path(__file__).resolve().parents[1]
OUT = ROOT / "results/v03"
SEED = 20261004

def fetch(url):
    req = urllib.request.Request(url, headers={"User-Agent": "LATIS-reproducible-audit"})
    return urllib.request.urlopen(req, timeout=60).read()

def canonical(value):
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode()

def main():
    OUT.mkdir(parents=True, exist_ok=True)
    manifest = OUT / "frozen_arc1_tasks.json"
    if manifest.exists():
        saved = json.loads(manifest.read_text())
        digest = saved.pop("hash")
        assert hashlib.sha256(canonical(saved)).hexdigest() == digest
        for name, digest in saved["task_sha256"].items():
            assert hashlib.sha256((ROOT / "data/arc1-frozen" / (name + ".json")).read_bytes()).hexdigest() == digest
        print("Existing immutable selection verified")
        return
    commit = json.loads(fetch("https://api.github.com/repos/fchollet/ARC-AGI/commits/master"))["sha"]
    tree = json.loads(fetch(f"https://api.github.com/repos/fchollet/ARC-AGI/git/trees/{commit}?recursive=1"))
    names = sorted(x["path"] for x in tree["tree"] if x["path"].startswith("data/training/") and x["path"].endswith(".json"))
    assert len(names) == 400
    selected = sorted(random.Random(SEED).sample(names, 30))
    dest = ROOT / "data/arc1-frozen"
    dest.mkdir(parents=True, exist_ok=True)
    hashes = {}
    for path in selected:
        content = fetch(f"https://raw.githubusercontent.com/fchollet/ARC-AGI/{commit}/{path}")
        name = pathlib.Path(path).stem
        (dest / (name + ".json")).write_bytes(content)
        hashes[name] = hashlib.sha256(content).hexdigest()
    saved = {"task_ids": sorted(hashes), "random_seed": SEED,
             "selection_procedure": "Python random.Random(seed).sample(sorted official data/training/*.json paths, 30), then sort. No grid reads, filtering or stratification.",
             "population": 400, "upstream_commit": commit,
             "source": "https://github.com/fchollet/ARC-AGI", "task_sha256": hashes,
             "baseline_commit": subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip(),
             "baseline_source_sha256": {str(p.relative_to(ROOT)).replace("\\", "/"): hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted((ROOT / "src").rglob("*.hs"))},
             "evaluation_opened": False, "frozen_before_v03_core": True}
    saved["hash"] = hashlib.sha256(canonical(saved)).hexdigest()
    manifest.write_text(json.dumps(saved, indent=2) + "\n", encoding="utf-8")
    print(f"Frozen {len(hashes)} tasks; manifest SHA256 {saved['hash']}")

if __name__ == "__main__":
    main()
