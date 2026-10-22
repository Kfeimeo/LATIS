param(
    [string]$Compiler = 'E:/ghcup/ghc/9.10.3/bin/ghc.exe',
    [int]$MechanismBudget = 25000
)
$ErrorActionPreference = 'Stop'
Set-Location (Split-Path -Parent $PSScriptRoot)
New-Item -ItemType Directory -Force build/collection-tmp,results/v05/validation | Out-Null
$env:TEMP = Join-Path $PWD 'build/collection-tmp'
$env:TMP = $env:TEMP
$collectionFlags = @('-O1','-Wall','-XGHC2021','-threaded','-rtsopts','-isrc','-tmpdir','build/collection-tmp','-outputdir','build/collection')
& $Compiler --version | Set-Content results/v05/validation/compiler.txt
foreach ($suite in @('Collection','Triggered','InducedR2','FeaturePipeline')) {
    & $Compiler @collectionFlags "test/${suite}Main.hs" -o "build/collection-$suite-tests.exe" *> "results/v05/validation/$suite-build.txt"
    if ($LASTEXITCODE -ne 0) { throw "Build failed: $suite" }
    & "./build/collection-$suite-tests.exe" *> "results/v05/validation/$suite-tests.txt"
    if ($LASTEXITCODE -ne 0) { throw "Tests failed: $suite" }
    Write-Output "$suite passed"
}
& $Compiler @collectionFlags app/Main.hs -o build/latis-collection.exe *> results/v05/validation/app-build.txt
if ($LASTEXITCODE -ne 0) { throw 'Application build failed' }
& ./build/latis-collection.exe collection-experiment --out results/v05 --mechanism-budget $MechanismBudget
if ($LASTEXITCODE -ne 0) { throw 'Experiment failed' }
python scripts/report_collection.py
if ($LASTEXITCODE -ne 0) { throw 'Audit failed' }
