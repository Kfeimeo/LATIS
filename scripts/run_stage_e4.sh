#!/usr/bin/env bash
# Stage E4 runner (Linux twin of run_stage_e4.ps1). Default: tests -> mechanism -> prepare -> Quick40 (60 s)
# -> regression26 -> report/verify -> traces. Full400 only with --full400.
#   scripts/run_stage_e4.sh [-o OUT] [-w WORKERS] [-g GHC] [--full400] [--skip-tests] [--resume]
set -euo pipefail
cd "$(dirname "$0")/.."
ROOT=$PWD
OUT="results/stage_e4/e4-$(date +%Y%m%d-%H%M%S)"; WORKERS=4; GHC=${LATIS_GHC:-ghc}; FULL=0; SKIP=0; RESUME=0
Q40='E4_Off,E4_OutputSkeletonOnly,E4_NoCrossOutput'
MECH='E4_Off,E4_OutputSkeletonOnly,E4_NoCrossOutput,E4_PairwiseOnly,E4_NoMDLScore,E4_SingleExplanation,E4_NoStructuralSharing'
while [ $# -gt 0 ]; do case "$1" in -o|--out) OUT=$2; shift 2;; -w|--workers) WORKERS=$2; shift 2;; -g|--ghc) GHC=$2; shift 2;; --full400) FULL=1; shift;; --skip-tests) SKIP=1; shift;; --resume) RESUME=1; shift;; *) echo "unknown $1" >&2; exit 2;; esac; done
export TMPDIR=$ROOT/build/e31-tmp TEMP=$ROOT/build/e31-tmp TMP=$ROOT/build/e31-tmp LATIS_GHC=$GHC
mkdir -p "$TMPDIR" "$OUT/validation" build/e4-app
Step() { echo "[$(date +%H:%M:%S)] $1"; }
Step 'build solver'; [ $RESUME -eq 1 ] || "$GHC" -O2 -XGHC2021 -rtsopts -eventlog -fno-omit-yields -isrc -tmpdir build/e31-tmp -outputdir build/e4-app app/Main.hs -o build/latis-stage-e4 > "$OUT/validation/app-build.log" 2>&1
Step 'Quick40 manifest check'; python3 -I scripts/make_e4_quick40.py --check > "$OUT/validation/quick40-check.log"
if [ $SKIP -eq 0 ] && [ ! -f "$OUT/validation/tests_passed.json" ]; then
  for suite in Output Region; do
    Step "test suite $suite"; mkdir -p "build/e4-tests-$suite"
    "$GHC" -O1 -XGHC2021 -rtsopts -isrc -tmpdir build/e31-tmp -outputdir "build/e4-tests-$suite" "test/${suite}Main.hs" -o "build/e4-$suite-tests" > "$OUT/validation/$suite-build.log" 2>&1
    "./build/e4-$suite-tests" +RTS -M3g -RTS > "$OUT/validation/$suite-tests.log" 2>&1; echo "$suite passed"
  done
  echo '{"suites":["Output","Region"],"passed":true,"stage_b_long_suite":"not_run (Referent.hs untouched by E4)"}' > "$OUT/validation/tests_passed.json"
fi
Step 'prepare'; [ -f "$OUT/data_manifest.json" ] || python3 -I scripts/run_stage_e4.py prepare --out "$OUT" --binary build/latis-stage-e4 --workers "$WORKERS" --ghc "$GHC" > "$OUT/validation/prepare.log" 2>&1
Step 'output mechanism matrix'; [ -f "$OUT/mechanism/matrix.json" ] || "$OUT/solver.exe" output-mechanism --out "$OUT/mechanism" --config "$MECH" > "$OUT/validation/mechanism.log" 2>&1
Step 'Quick40 (60 s)'; python3 -I scripts/run_stage_e4.py run --out "$OUT" --mode quick40 --configs "$Q40" --timeout-ms 60000 --workers "$WORKERS" 2>&1 | tee "$OUT/validation/quick40.log"
Step 'regression26 (300 s)'; python3 -I scripts/run_stage_e4.py run --out "$OUT" --mode regression26 --timeout-ms 300000 --workers "$WORKERS" 2>&1 | tee "$OUT/validation/regression26.log"
if [ $FULL -eq 1 ]; then Step 'FULL400 (explicit)'; python3 -I scripts/run_stage_e4.py run --out "$OUT" --mode full400 --full400 --timeout-ms 300000 --workers "$WORKERS" 2>&1 | tee "$OUT/validation/full400.log"; fi
Step 'report + verify'; python3 -I scripts/run_stage_e4.py report --out "$OUT" 2>&1 | tee "$OUT/validation/report.log"; python3 -I scripts/verify_stage_e4.py --out "$OUT" 2>&1 | tee "$OUT/validation/verify.log"
for task in 543a7ed5 e50d258f 2dc579da; do dest="$OUT/traces/$task/E4_OutputSkeletonOnly"; Step "trace $task"; [ -f "$dest/index.html" ] || python3 -I scripts/trace_io.py run --task "$OUT/train_only/$task.json" --pair-index 0 --mode inspect-pair --config E4_OutputSkeletonOnly --out "$dest" --trace-level full --binary "$OUT/solver.exe" > "$OUT/validation/trace-$task.log" 2>&1; done
python3 -I scripts/stage_e31_trace_selftests.py --out "$OUT" > "$OUT/validation/trace_selftests.log" 2>&1 || true
python3 -I scripts/report_stage_e4.py --out "$OUT" 2>&1 | tee "$OUT/validation/report_tables.log"
echo "Completed $OUT"
