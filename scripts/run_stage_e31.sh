#!/usr/bin/env bash
# Stage E3.1 end-to-end runner (Linux/macOS twin of run_stage_e31.ps1): build the FINAL
# binary -> test suites -> region mechanism matrix -> prepare (frozen binary / manifest /
# snapshot) -> ARC 400 x all configs -> single-worker replays -> report -> independent
# verification -> traces -> viewer self-tests (not_run without Chrome). Append-only.
#
#   scripts/run_stage_e31.sh [-o OUT] [-w WORKERS] [-g GHC] [-c CONFIGS] [--skip-tests] [--skip-arc] [--run-stage-b] [--resume]
#
# Requires GHC 9.10.3 (ghcup) and Python 3 (standard library only).
set -euo pipefail
cd "$(dirname "$0")/.."
ROOT=$PWD
OUT="results/stage_e31/e31-$(date +%Y%m%d-%H%M%S)"
WORKERS=4
GHC=${LATIS_GHC:-ghc}
CONFIGS='FrozenE01,E31_PatchedBaseline,E31_PrecheckOnly,E31_LazyMDLOnly,E31_Full,E31_FullNoMDL,E31_FullNoSafePrune,E31_FullSelectorPriority,E31_FullCostOrder'
SINGLE_TASKS='484b58aa'
SINGLE_CONFIGS='E31_PatchedBaseline,E31_Full,E31_FullNoMDL'
SKIP_TESTS=0; SKIP_ARC=0; RUN_B=0; RESUME=0
while [ $# -gt 0 ]; do
  case "$1" in
    -o|--out) OUT=$2; shift 2;;
    -w|--workers) WORKERS=$2; shift 2;;
    -g|--ghc) GHC=$2; shift 2;;
    -c|--configs) CONFIGS=$2; shift 2;;
    --skip-tests) SKIP_TESTS=1; shift;;
    --skip-arc) SKIP_ARC=1; shift;;
    --run-stage-b) RUN_B=1; shift;;
    --resume) RESUME=1; shift;;
    *) echo "unknown option $1" >&2; exit 2;;
  esac
done
if [ -f "$OUT/data_manifest.json" ] && [ $RESUME -eq 0 ]; then echo "Existing immutable batch; use --resume or a new --out" >&2; exit 1; fi
export TMPDIR=$ROOT/build/e31-tmp TEMP=$ROOT/build/e31-tmp TMP=$ROOT/build/e31-tmp LATIS_GHC=$GHC
mkdir -p "$TMPDIR" "$OUT/validation" build/e31-app
step=0; steps=24
Step() { step=$((step+1)); echo "[$step/$steps] $(date +%H:%M:%S)  $1"; }
FLAGS=(-O2 -XGHC2021 -rtsopts -eventlog -fno-omit-yields -isrc -tmpdir build/e31-tmp -outputdir build/e31-app)
Step 'build solver'
if [ $RESUME -eq 0 ]; then "$GHC" "${FLAGS[@]}" app/Main.hs -o build/latis-stage-e31 > "$OUT/validation/app-build.log" 2>&1; fi
SUITES=(Region Geometry ContentFirst StageD StageDFull StageDControl StageDPlus StageC StageA)
if [ $RUN_B -eq 1 ]; then SUITES+=(StageB); fi
if [ $SKIP_TESTS -eq 0 ] && [ ! -f "$OUT/validation/tests_passed.json" ]; then
  for suite in "${SUITES[@]}"; do
    Step "test suite $suite (build + run)"
    mkdir -p "build/e31-tests-$suite"
    "$GHC" -O1 -XGHC2021 -rtsopts -isrc -tmpdir build/e31-tmp -outputdir "build/e31-tests-$suite" "test/${suite}Main.hs" -o "build/e31-$suite-tests" > "$OUT/validation/$suite-build.log" 2>&1
    log="$OUT/validation/$suite-tests.log"
    if [ "$suite" = StageDPlus ]; then
      export LATIS_DPLUS_EVENTLOG=$ROOT/$OUT/validation/tests.eventlog
      "./build/e31-$suite-tests" +RTS -T -l-au "-ol$LATIS_DPLUS_EVENTLOG" -RTS > "$log" 2>&1
    else
      "./build/e31-$suite-tests" +RTS -M3g -RTS > "$log" 2>&1
    fi
    [ -f dplus_negative_controls.json ] && mv -f dplus_negative_controls.json "$OUT/validation/dplus_negative_controls.json"
    echo 'EXIT 0' >> "$log"; echo "$suite passed"
  done
  if [ $RUN_B -eq 1 ]; then sb=run; else sb='not_run (30 min suite; run with --run-stage-b)'; fi
  echo "{\"suites\":${#SUITES[@]},\"passed\":true,\"stage_b_long_suite\":\"$sb\"}" > "$OUT/validation/tests_passed.json"
else
  step=$((step+${#SUITES[@]}))
fi
Step 'prepare (manifest, frozen binary, source snapshot)'
[ -f "$OUT/data_manifest.json" ] || python3 -I scripts/run_stage_e31.py prepare --out "$OUT" --binary build/latis-stage-e31 --workers "$WORKERS" --ghc "$GHC" > "$OUT/validation/prepare.log" 2>&1
Step 'region mechanism matrix (15 families x 3 seeds x configs)'
[ -f "$OUT/mechanism/matrix.json" ] || "$OUT/solver.exe" region-mechanism-e31 --out "$OUT/mechanism" --config "$CONFIGS" > "$OUT/validation/mechanism.log" 2>&1
if [ $SKIP_ARC -eq 0 ]; then
  Step "ARC 400 x configs ($CONFIGS; $WORKERS workers)"
  python3 -I scripts/run_stage_e31.py run --out "$OUT" --workers "$WORKERS" --configs "$CONFIGS" --phase formal 2>&1 | tee "$OUT/validation/formal.log"
  Step "single-worker replays ($SINGLE_TASKS x $SINGLE_CONFIGS)"
  python3 -I scripts/run_stage_e31.py run --out "$OUT" --workers 1 --configs "$SINGLE_CONFIGS" --tasks "$SINGLE_TASKS" --phase single_worker --subdir tasks_w1 2>&1 | tee "$OUT/validation/single_worker.log"
  Step 'report'
  python3 -I scripts/run_stage_e31.py report --out "$OUT" 2>&1 | tee "$OUT/validation/report.log"
  Step 'independent verification'
  python3 -I scripts/verify_stage_e31.py --out "$OUT" 2>&1 | tee "$OUT/validation/verify.log"
fi
for task in 2dc579da 1c786137 e50d258f; do
  for cfg in E31_PatchedBaseline E31_Full E31_FullNoMDL; do
    dest="$OUT/traces/$task/$cfg"
    Step "trace $task $cfg"
    [ -f "$dest/index.html" ] || python3 -I scripts/trace_io.py run --task "$OUT/train_only/$task.json" --pair-index 0 --mode inspect-pair --config "$cfg" --out "$dest" --trace-level full --binary "$OUT/solver.exe" > "$OUT/validation/trace-$task-$cfg.log" 2>&1
  done
done
Step 'viewer self-tests + report digest'
python3 -I scripts/stage_e31_trace_selftests.py --out "$OUT" > "$OUT/validation/trace_selftests.log" 2>&1 || echo "viewer self-tests failed or not_run; see $OUT/validation/trace_selftests.log"
python3 -I scripts/report_stage_e31.py --out "$OUT" 2>&1 | tee "$OUT/validation/report_tables.log"
echo "Completed $OUT"
