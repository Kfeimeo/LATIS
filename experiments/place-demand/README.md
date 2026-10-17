# place-demand experiment (B0 / B1 / B2)

Isolated snapshot of `experiments/place-only` (same Base: `place(ObjectT, CoordT)`,
no `Translate`, no `poseOf`; same encoder, renderer, Grid exact verifier, ranking,
literal prior, structural diversity and abstraction discovery). The frozen
`place-only` sources and `results/place-only` are untouched; this directory adds
two switchable mechanisms and new output directories under `results/place-demand`.

Switches (`solve-v03r2`):

| variant | flags | meaning |
|---|---|---|
| B0 | `--witness unidirectional --demand off` | frozen place-only Full behaviour (verified identical metrics on stress A) |
| B1 | `--witness bidirectional --demand off` | phase A: left- AND right-conditioned single-operator inverses for `coordAdd`, `coordDelta`, `vecAdd` |
| B2 | `--witness bidirectional --demand on` | phase B: B1 + demand-driven, budget-bounded typed observation-domain growth (`--demand-budget 25000 --demand-operands 24 --demand-rounds 3`) |

Changed files relative to `place-only`: `src/Synthesis/InducedR2/Witness.hs`
(policy, `leftResidual`, credit-aware residual pruning, `missingOperands`),
`src/Synthesis/InducedR2/Learn.hs` (config switches, demand registry, pool
epochs, memo invalidation, `resolveDemands`, `learnWithDemands`),
`src/Synthesis/InducedR2/Observers.hs` (`observeTerm`), `src/ARC/InducedR2Evaluate.hs`
(configuration/variant fields, `demands.json`), `app/Main.hs` (flags).
`diff -r ../place-only/src src` lists every change.

Build and test (GHC 9.14.1, as the frozen binaries were built with 9.14):

```bash
ghc -O2 -isrc -iapp -outputdir build -tmpdir build/tmp -o latis-place-demand app/Main.hs
ghc -O1 -isrc -itest -outputdir build-test -o place-demand-tests test/PlaceDemandMain.hs
./place-demand-tests            # phase A/B semantic tests; --quick skips the end-to-end run
runghc -isrc CheckPlace.hs      # place registry / semantics check (Base unchanged)
```

From the repository root:

```bash
python scripts/generate_place_demand_samples.py                 # frozen generated samples + manifest (already committed)
python scripts/run_place_demand_experiment.py --workers 3       # B0/B1/B2 matrix, fixed concurrency, fingerprints
runghc -iexperiments/place-demand/src experiments/place-demand/GeneratedAudit.hs   # post-hoc certificates, never solver input
python scripts/report_place_demand_experiment.py
python scripts/classify_old_tests_for_place.py
```

Old test suites that reference the removed `Translate`/`poseOf` are classified in
`results/place-demand/old_test_classification.json`; they are not claimed to pass.
