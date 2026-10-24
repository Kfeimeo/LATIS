param(
    [string]$Compiler = 'E:/ghcup/ghc/9.10.3/bin/ghc.exe',
    [string]$Out = 'results/stage_a',
    [string]$Source = 'data/arc1-training',
    [int]$Workers = 6,
    [int]$FeatureTimeoutMs = 60000,
    [int]$PerFamily = 3,
    [int]$SmokeLimit = 8,
    [switch]$SkipBuild,
    [switch]$SkipTests,
    [switch]$SkipMechanism,
    [switch]$SkipSmoke,
    [switch]$SkipArc
)
# One-click reproduction of LATIS Stage A:
#   build -> unit/property/regression tests -> synthetic mechanism matrix
#   -> real ARC-AGI-1 train-only smoke -> full 400-task ablation run -> report.
# Environment, code and data hashes are recorded by scripts/arc_stage_a.py
# (code_version.json, data_manifest.json) and by the validation logs.
$ErrorActionPreference = 'Stop'
Set-Location (Split-Path -Parent $PSScriptRoot)
New-Item -ItemType Directory -Force build/stage-a-tmp, "$Out/validation" | Out-Null
$env:TEMP = Join-Path $PWD 'build/stage-a-tmp'
$env:TMP = $env:TEMP
& $Compiler --version | Set-Content "$Out/validation/compiler.txt"
git rev-parse HEAD | Set-Content "$Out/validation/git_head.txt"
git status --porcelain | Set-Content "$Out/validation/git_status.txt"
$flags = @('-O1','-Wall','-XGHC2021','-rtsopts','-isrc','-tmpdir','build/stage-a-tmp')
if (-not $SkipBuild) {
    # -fno-omit-yields keeps every loop interruptible by the in-process timeout of the ARC stage runner.
    & $Compiler -O2 -Wall -XGHC2021 -rtsopts -fno-omit-yields -isrc -tmpdir build/stage-a-tmp -outputdir build/stage-a-app app/Main.hs -o build/latis-stage-a.exe *> "$Out/validation/app-build.txt"
    if ($LASTEXITCODE -ne 0) { throw 'Application build failed (see validation/app-build.txt)' }
    Write-Output 'app build ok'
}
if (-not $SkipTests) {
    # Each Main gets its own outputdir; never compile two Mains into one outputdir.
    foreach ($suite in @('StageA','CollectionV61','CollectionV6','Collection','Triggered','InducedR2','FeaturePipeline')) {
        & $Compiler @flags '-outputdir' "build/stage-a-$suite" "test/${suite}Main.hs" -o "build/stage-a-$suite-tests.exe" *> "$Out/validation/$suite-build.txt"
        if ($LASTEXITCODE -ne 0) { throw "Build failed: $suite" }
        & "./build/stage-a-$suite-tests.exe" *> "$Out/validation/$suite-tests.txt"
        if ($LASTEXITCODE -ne 0) { throw "Tests failed: $suite" }
        Write-Output "$suite passed"
    }
}
if (-not $SkipMechanism) {
    & ./build/latis-stage-a.exe stage-a-mechanism --out "$Out/mechanism" --per-family $PerFamily +RTS -T -RTS *> "$Out/validation/mechanism.log"
    if ($LASTEXITCODE -ne 0) { throw 'Mechanism matrix failed' }
    Write-Output 'mechanism ok'
}
$common = @('--out', "$Out/arc", '--source', $Source, '--workers', $Workers, '--feature-timeout-ms', $FeatureTimeoutMs, '--binary', 'build/latis-stage-a.exe')
if (-not $SkipSmoke) {
    python -I scripts/arc_stage_a.py all --out "$Out/arc_smoke" --source $Source --workers $Workers --feature-timeout-ms $FeatureTimeoutMs --binary build/latis-stage-a.exe --limit $SmokeLimit
    if ($LASTEXITCODE -ne 0) { throw 'ARC smoke failed' }
    Write-Output 'smoke ok'
}
if (-not $SkipArc) {
    python -I scripts/arc_stage_a.py prepare @common
    if ($LASTEXITCODE -ne 0) { throw 'prepare failed' }
    python -I scripts/arc_stage_a.py run @common
    if ($LASTEXITCODE -ne 0) { throw 'run failed' }
    python -I scripts/arc_stage_a.py report @common
    if ($LASTEXITCODE -ne 0) { throw 'report failed' }
    Write-Output "done: $Out/arc/summary.md, $Out/metrics.csv, $Out/per_task.csv"
}
