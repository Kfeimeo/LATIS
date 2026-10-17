# Out-of-protocol diagnostics (NOT part of the controlled matrix)

- `A-placeonly`: frozen `experiments/place-only` binary rebuilt on this host (GHC 9.14.1), stress A, Full protocol budgets.
- `A-B0`: place-demand binary with `--witness unidirectional --demand off` (B0), same budgets. Metrics identical to `A-placeonly` (work 1161, witness_calls 725): B0 reproduces the frozen behaviour.
- `A-B1`: B1 with protocol budgets (pre-matrix run of the same binary).
- `A-B1-diag-sat100k`: B1 with `--saturation-budget 100000` (4x protocol). Purpose: test whether A's failure under B1 is candidate extraction rather than deduction. Result: still no complete AST (C reached 23, extraction work 112500). This run is evidence only; it is not counted in any table.

The first, un-pruned bidirectional version (residual children emitted even at credit 0) exhausted the 250000 work budget on A with 11251 recursive tasks (not kept as files; numbers quoted in REPORT.md from the development log).

## Deadline attribution (added after the matrix)

- `map-scan-ambiguity-B1-nodeadline`, `map-translate-B2-nodeadline`: the two regression jobs that hit the external 300 s deadline under B1/B2, rerun with the SAME matrix binary and budgets but no deadline (cap 900 s). Both terminate on their own at ~290 s with `total_expanded_work` ≈ 250000 spent entirely in deduction (first_solution_states 0, join_nodes 1682 / 2163, extraction_milliseconds ≈ 0). The matrix timeouts are therefore search-budget failures of the bidirectional residual fan-out, not wall-clock artefacts of this host.
- `scan-TR-TL` B0 in the matrix was killed by the memory cgroup (OOM, ~5.8 GB RSS while three solver processes ran). It was rerun alone (`--workers 1`, protocol kept in `results/place-demand/protocol-rerun-scan-TR-TL-B0.json`) and reproduces the frozen place-only result (train/heldout exact). The matrix row uses the solo rerun; the OOM is an execution failure of the host, not a solver result.
