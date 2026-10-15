# ARC-AGI sample provenance

`arc1-frozen/` contains 30 unmodified official **training** task JSON files, uniformly sampled from the sorted 400 filenames with seed `20261004` before implementing v0.3. No grids were inspected in selection. Source commit, selection procedure, task IDs and per-file SHA256 are in `results/v03/frozen_arc1_tasks.json`; existing selection is verified, never replaced. The same upstream Apache-2.0 license below applies. This is a frozen subset of public ARC-1 training data, not the official private evaluation benchmark.

`03560426.json` is an unmodified copy of François Chollet's ARC-AGI repository evaluation task, downloaded on 2026-10-04 (Asia/Shanghai).

- [Official source JSON](https://raw.githubusercontent.com/fchollet/ARC-AGI/master/data/evaluation/03560426.json)
- [Upstream repository](https://github.com/fchollet/ARC-AGI)
- SHA256: `098e548544498a4db5e874fd8c8f87922c1b68ad62e7f2616edc69898c8298e1`
- Upstream copyright: Copyright 2019 Francois Chollet.
- Upstream license: Apache-2.0; full text preserved in `ARC-AGI-LICENSE`.

Three training pairs and one public test pair are present. Search receives only the training pairs; the test output is used solely after selecting a program. This is a regression/proof-of-concept experiment on a known task, not a blind ARC evaluation.
