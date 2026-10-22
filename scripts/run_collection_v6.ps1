param(
    [string]$Compiler = 'E:/ghcup/ghc/9.10.3/bin/ghc.exe',
    [int]$MechanismBudget = 25000
)
$ErrorActionPreference = 'Stop'
Set-Location (Split-Path -Parent $PSScriptRoot)
New-Item -ItemType Directory -Force build/collection-v6-tmp,results/v06/validation | Out-Null
$env:TEMP = Join-Path $PWD 'build/collection-v6-tmp'
$env:TMP = $env:TEMP
$flags = @('-O1','-Wall','-XGHC2021','-threaded','-rtsopts','-isrc','-tmpdir','build/collection-v6-tmp')
& $Compiler --version | Set-Content results/v06/validation/compiler.txt
# Each Main gets its own outputdir; never compile two Mains into one outputdir.
foreach ($suite in @('CollectionV6','Collection','Triggered','InducedR2','FeaturePipeline')) {
    & $Compiler @flags '-outputdir' "build/collection-v6-$suite" "test/${suite}Main.hs" -o "build/collection-v6-$suite-tests.exe" *> "results/v06/validation/$suite-build.txt"
    if ($LASTEXITCODE -ne 0) { throw "Build failed: $suite" }
    & "./build/collection-v6-$suite-tests.exe" *> "results/v06/validation/$suite-tests.txt"
    if ($LASTEXITCODE -ne 0) { throw "Tests failed: $suite" }
    Write-Output "$suite passed"
}
& $Compiler @flags '-outputdir' 'build/collection-v6' app/Main.hs -o build/latis-collection-v6.exe *> results/v06/validation/app-build.txt
if ($LASTEXITCODE -ne 0) { throw 'Application build failed' }
& ./build/latis-collection-v6.exe collection-v6-experiment --out results/v06 --mechanism-budget $MechanismBudget
if ($LASTEXITCODE -ne 0) { throw 'Experiment failed' }
python scripts/report_collection_v6.py
if ($LASTEXITCODE -ne 0) { throw 'Audit failed' }
