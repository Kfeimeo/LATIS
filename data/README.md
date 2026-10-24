# ARC-AGI sample provenance

`arc1-frozen/` contains 30 unmodified official **training** task JSON files, uniformly sampled from the sorted 400 filenames with seed `20261004` before implementing v0.3. No grids were inspected in selection. Source commit, selection procedure, task IDs and per-file SHA256 are in `results/v03/frozen_arc1_tasks.json`; existing selection is verified, never replaced. The same upstream Apache-2.0 license below applies. This is a frozen subset of public ARC-1 training data, not the official private evaluation benchmark.

`arc1-training/` contains all 400 unmodified official **training** task JSON files from the same upstream commit (`399030444e0ab0cc8b4e199870fb20b863846f34`), downloaded 2026-10-22 for the v0.6.1 train-only fallback experiment (`scripts/arc_train_only.py`). Per-file SHA256 are in `results/arc_agi1_train_only_fallback/data_manifest.json`; the solver only ever receives train-only copies with `test: []`. See `arc1-training/README.md`.

`03560426.json` is an unmodified copy of François Chollet's ARC-AGI repository evaluation task, downloaded on 2026-10-04 (Asia/Shanghai).

- [Official source JSON](https://raw.githubusercontent.com/fchollet/ARC-AGI/master/data/evaluation/03560426.json)
- [Upstream repository](https://github.com/fchollet/ARC-AGI)
- SHA256: `098e548544498a4db5e874fd8c8f87922c1b68ad62e7f2616edc69898c8298e1`
- Upstream copyright: Copyright 2019 Francois Chollet.
- Upstream license: Apache-2.0; full text preserved in `ARC-AGI-LICENSE`.

Three training pairs and one public test pair are present. Search receives only the training pairs; the test output is used solely after selecting a program. This is a regression/proof-of-concept experiment on a known task, not a blind ARC evaluation.
