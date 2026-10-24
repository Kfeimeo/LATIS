param(
    [string]$Compiler = 'E:/ghcup/ghc/9.10.3/bin/ghc.exe',
    [string]$Out = 'results/arc_agi1_train_only_fallback',
    [string]$Source = 'data/arc1-training',
    [int]$Workers = 6,
    [int]$FeatureTimeoutMs = 60000,
    [int]$V04TimeoutMs = 60000,
    [int]$R2TimeoutMs = 300000,
    [int]$SmokeLimit = 8,
    [switch]$SkipBuild,
    [switch]$SkipSmoke
)
# One-click reproduction of the LATIS v0.6.1 real ARC-AGI-1 train-only
# fallback experiment: build -> smoke (prepare+tests+few tasks) -> full run.
$ErrorActionPreference = 'Stop'
Set-Location (Split-Path -Parent $PSScriptRoot)
New-Item -ItemType Directory -Force build/arc-train-only,build/collection-v6-tmp,$Out | Out-Null
$env:TEMP = Join-Path $PWD 'build/collection-v6-tmp'
$env:TMP = $env:TEMP
if (-not $SkipBuild) {
    # -fno-omit-yields keeps every loop interruptible by the in-process timeout.
    & $Compiler -O2 -Wall -XGHC2021 -rtsopts -fno-omit-yields -isrc -tmpdir build/collection-v6-tmp -outputdir build/arc-train-only app/Main.hs -o build/latis-arc-train-only.exe *> "$Out/build.log"
    if ($LASTEXITCODE -ne 0) { throw 'Build failed (see build.log)' }
    Write-Output 'build ok'
}
$common = @('--out', $Out, '--source', $Source, '--workers', $Workers, '--feature-timeout-ms', $FeatureTimeoutMs, '--v04-timeout-ms', $V04TimeoutMs, '--r2-timeout-ms', $R2TimeoutMs)
if (-not $SkipSmoke) {
    $smoke = @('--out', "$Out/smoke", '--source', $Source, '--workers', $Workers, '--feature-timeout-ms', $FeatureTimeoutMs, '--v04-timeout-ms', $V04TimeoutMs, '--r2-timeout-ms', $R2TimeoutMs, '--limit', $SmokeLimit)
    python -I scripts/arc_train_only.py all @smoke
    if ($LASTEXITCODE -ne 0) { throw 'Smoke test failed' }
    Write-Output 'smoke ok'
}
python -I scripts/arc_train_only.py prepare @common
if ($LASTEXITCODE -ne 0) { throw 'prepare failed' }
python -I scripts/arc_train_only.py test @common
if ($LASTEXITCODE -ne 0) { throw 'tests failed' }
python -I scripts/arc_train_only.py run @common
if ($LASTEXITCODE -ne 0) { throw 'run failed' }
python -I scripts/arc_train_only.py report @common
if ($LASTEXITCODE -ne 0) { throw 'report failed' }
Write-Output "done: $Out/summary.md"
