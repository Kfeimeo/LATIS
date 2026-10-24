param(
    [string]$Compiler = 'E:/ghcup/ghc/9.10.3/bin/ghc.exe',
    [int]$MechanismBudget = 25000,
    [int]$Repeats = 5,
    [int]$SeedBase = 2000,
    [int]$PerFamily = 20
)
$ErrorActionPreference = 'Stop'
Set-Location (Split-Path -Parent $PSScriptRoot)
New-Item -ItemType Directory -Force build/collection-v6-tmp,results/v061/validation | Out-Null
$env:TEMP = Join-Path $PWD 'build/collection-v6-tmp'
$env:TMP = $env:TEMP
$flags = @('-O1','-Wall','-XGHC2021','-threaded','-rtsopts','-isrc','-tmpdir','build/collection-v6-tmp')
& $Compiler --version | Set-Content results/v061/validation/compiler.txt
# Each Main gets its own outputdir; never compile two Mains into one outputdir.
foreach ($suite in @('CollectionV61','CollectionV6','Collection','Triggered','InducedR2','FeaturePipeline')) {
    & $Compiler @flags '-outputdir' "build/collection-v61-$suite" "test/${suite}Main.hs" -o "build/collection-v61-$suite-tests.exe" *> "results/v061/validation/$suite-build.txt"
    if ($LASTEXITCODE -ne 0) { throw "Build failed: $suite" }
    & "./build/collection-v61-$suite-tests.exe" *> "results/v061/validation/$suite-tests.txt"
    if ($LASTEXITCODE -ne 0) { throw "Tests failed: $suite" }
    Write-Output "$suite passed"
}
& $Compiler @flags '-outputdir' 'build/collection-v6' app/Main.hs -o build/latis-collection-v61.exe *> results/v061/validation/app-build.txt
if ($LASTEXITCODE -ne 0) { throw 'Application build failed' }
# +RTS -T enables the RTS statistics used for the peak-memory field.
& ./build/latis-collection-v61.exe collection-v61-experiment --out results/v061 --mechanism-budget $MechanismBudget --repeats $Repeats +RTS -T -RTS
if ($LASTEXITCODE -ne 0) { throw 'Experiment failed' }
& ./build/latis-collection-v61.exe collection-v61-battery --out results/v061/battery --seed-base $SeedBase --per-family $PerFamily
if ($LASTEXITCODE -ne 0) { throw 'Battery failed' }
python scripts/report_collection_v61.py
if ($LASTEXITCODE -ne 0) { throw 'Audit failed' }
