# Out-of-protocol diagnostics (NOT part of the controlled matrix)

- `A-placeonly`: frozen `experiments/place-only` binary rebuilt on this host (GHC 9.14.1), stress A, Full protocol budgets.
- `A-B0`: place-demand binary with `--witness unidirectional --demand off` (B0), same budgets. Metrics identical to `A-placeonly` (work 1161, witness_calls 725): B0 reproduces the frozen behaviour.
- `A-B1`: B1 with protocol budgets (pre-matrix run of the same binary).
- `A-B1-diag-sat100k`: B1 with `--saturation-budget 100000` (4x protocol). Purpose: test whether A's failure under B1 is candidate extraction rather than deduction. Result: still no complete AST (C reached 23, extraction work 112500). This run is evidence only; it is not counted in any table.

The first, un-pruned bidirectional version (residual children emitted even at credit 0) exhausted the 250000 work budget on A with 11251 recursive tasks (not kept as files; numbers quoted in REPORT.md from the development log).
