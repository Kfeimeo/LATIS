# Commands for an external host (OOM-affected and memory-heavy jobs)

Build first (GHC 9.14.1): `cd experiments/place-demand && ghc -O2 -isrc -iapp -outputdir build -tmpdir build/tmp -o latis-place-demand-r2 app/Main.hs`.
Run from the repository root. Each job is one process; record peak RSS (e.g. `/usr/bin/time -v`). The runner records the same commands in `execution.json`.

## Rows that were OOM-killed under the 3-worker protocol on the 16 GB cgroup host

- round2 `regression/scan-BL-TL/B1L` (binary sha256 73d3c1c7a47466ea…): solo rerun train/heldout = 1/1
  ```
  experiments/place-demand/latis-place-demand-r2 solve-v03r2 --task results/v03/regression/scan-BL-TL/task.json --out results/place-demand-round2/regression/scan-BL-TL/B1L --mode Full --budget 250000 --cost 96 --saturation-budget 25000 --witness bidirectional-local --demand off --demand-budget 25000 --demand-operands 24 --demand-rounds 3
  ```
- round2 `regression/scan-BL-TL/B1QX` (binary sha256 73d3c1c7a47466ea…): solo rerun train/heldout = 1/1
  ```
  experiments/place-demand/latis-place-demand-r2 solve-v03r2 --task results/v03/regression/scan-BL-TL/task.json --out results/place-demand-round2/regression/scan-BL-TL/B1QX --mode Full --budget 250000 --cost 96 --saturation-budget 25000 --witness bidirectional --demand off --schedule defer-nonlocal --deferred-budget 62500 --cover lazy --demand-budget 25000 --demand-operands 24 --demand-rounds 3
  ```
- round2 `regression/scan-BR-TL/B1QX` (binary sha256 73d3c1c7a47466ea…): solo rerun train/heldout = 1/1
  ```
  experiments/place-demand/latis-place-demand-r2 solve-v03r2 --task results/v03/regression/scan-BR-TL/task.json --out results/place-demand-round2/regression/scan-BR-TL/B1QX --mode Full --budget 250000 --cost 96 --saturation-budget 25000 --witness bidirectional --demand off --schedule defer-nonlocal --deferred-budget 62500 --cover lazy --demand-budget 25000 --demand-operands 24 --demand-rounds 3
  ```
- round2 `regression/wrong-early-skeleton/B1Q` (binary sha256 73d3c1c7a47466ea…): solo rerun train/heldout = 1/1
  ```
  experiments/place-demand/latis-place-demand-r2 solve-v03r2 --task results/v03/regression/wrong-early-skeleton/task.json --out results/place-demand-round2/regression/wrong-early-skeleton/B1Q --mode Full --budget 250000 --cost 96 --saturation-budget 25000 --witness bidirectional --demand off --schedule defer-nonlocal --deferred-budget 62500 --demand-budget 25000 --demand-operands 24 --demand-rounds 3
  ```
- round1 `regression/scan-TR-TL/B0` (binary sha256 df19678d96ca0b5c…): solo rerun train/heldout = 1/1
  ```
  experiments/place-demand/latis-place-demand solve-v03r2 --task results/v03/regression/scan-TR-TL/task.json --out results/place-demand/regression/scan-TR-TL/B0 --mode Full --budget 250000 --cost 96 --saturation-budget 25000 --witness unidirectional --demand off --demand-budget 25000 --demand-operands 24 --demand-rounds 3
  ```

## Memory-heavy family to re-measure under concurrency (scan-* regressions, all round-2 variants)

Template (replace TASK and VARIANT flags; budgets are the protocol values):
```
experiments/place-demand/latis-place-demand-r2 solve-v03r2 --task results/v03/regression/TASK/task.json --out OUT --mode Full --budget 250000 --cost 96 --saturation-budget 25000 VARIANT_FLAGS --demand-budget 25000 --demand-operands 24 --demand-rounds 3
```
VARIANT_FLAGS: B0 `--witness unidirectional --demand off`; B1 `--witness bidirectional --demand off`; B1L `--witness bidirectional-local --demand off`; B1Q `--witness bidirectional --demand off --schedule defer-nonlocal --deferred-budget 62500`; B1X `--witness bidirectional --demand off --cover lazy`; B1QX = B1Q flags + `--cover lazy`.
TASK in: scan-BL-TL, scan-BR-TL, scan-TR-TL, wrong-early-skeleton, map-scan-ambiguity, map-translate.

Or run the whole matrix with the runner (fixed concurrency recorded in protocol.json): `python scripts/run_place_demand_round2.py --workers 3 --timeout 300` then the audit phase with `--groups generated-audit --generated-manifest data/place-demand-generated-round2/manifest.json`.

## What to send back

- `results/place-demand-round2/<group>/<task>/<variant>/solution.json` and `execution.json` (train/heldout exact, failure, statistics, elapsed) and the peak RSS per job.
- The runner log (lines `group/task/variant: train=… held=… failure=… elapsed=…`).
- If a job is still killed on the other host: the kernel OOM line, so that the failure rate under the concurrent protocol can be reported for that host too.

## B1QX rows that hit the external 300 s deadline under 3-way concurrency (B1Q finished at 220–277 s on the same tasks)

Run with NO external deadline (or a 900 s cap) and record wall-clock; the question is whether the larger lazy-cover candidate set (≈1500 verifications) only costs time or changes the outcome.

- `generated-dev/dev-relative-1/B1QX`
  ```
  experiments/place-demand/latis-place-demand-r2 solve-v03r2 --task data/place-demand-generated/dev-relative-1/task.json --out results/place-demand-round2/out-of-protocol/dev-relative-1-B1QX-nodeadline --mode Full --budget 250000 --cost 96 --saturation-budget 25000 --witness bidirectional --demand off --schedule defer-nonlocal --deferred-budget 62500 --cover lazy --demand-budget 25000 --demand-operands 24 --demand-rounds 3
  ```
- `generated-audit/audit2-newstruct-mirror-1/B1QX`
  ```
  experiments/place-demand/latis-place-demand-r2 solve-v03r2 --task data/place-demand-generated-round2/audit2-newstruct-mirror-1/task.json --out results/place-demand-round2/out-of-protocol/audit2-newstruct-mirror-1-B1QX-nodeadline --mode Full --budget 250000 --cost 96 --saturation-budget 25000 --witness bidirectional --demand off --schedule defer-nonlocal --deferred-budget 62500 --cover lazy --demand-budget 25000 --demand-operands 24 --demand-rounds 3
  ```
- `generated-audit/audit2-nonlocal-seedshift-y-0/B1QX`
  ```
  experiments/place-demand/latis-place-demand-r2 solve-v03r2 --task data/place-demand-generated-round2/audit2-nonlocal-seedshift-y-0/task.json --out results/place-demand-round2/out-of-protocol/audit2-nonlocal-seedshift-y-0-B1QX-nodeadline --mode Full --budget 250000 --cost 96 --saturation-budget 25000 --witness bidirectional --demand off --schedule defer-nonlocal --deferred-budget 62500 --cover lazy --demand-budget 25000 --demand-operands 24 --demand-rounds 3
  ```

Send back `solution.json` (train/heldout, statistics.wall_clock_seconds, exact_verifier_calls, cover_lazy_candidates) for each.
