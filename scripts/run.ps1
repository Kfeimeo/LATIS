param(
    [string]$Task = 'data/03560426.json',
    [string]$Out = 'results/03560426',
    [int]$Repeats = 3
)
$ErrorActionPreference = 'Stop'
Set-Location -LiteralPath (Split-Path -Parent $PSScriptRoot)
& cabal --config-file=scripts/cabal.config build all --offline
if ($LASTEXITCODE -ne 0) { throw 'Build failed' }
& cabal --config-file=scripts/cabal.config test --offline --test-show-details=direct
if ($LASTEXITCODE -ne 0) { throw 'Tests failed' }
$latisExecutable = & cabal --config-file=scripts/cabal.config list-bin exe:latis
if ($LASTEXITCODE -ne 0) { throw 'Cannot locate executable' }
& $latisExecutable benchmark --task $Task --out $Out --repeats $Repeats
if ($LASTEXITCODE -ne 0) { throw 'Benchmark failed' }
& $latisExecutable suite --out results/synthetic
if ($LASTEXITCODE -ne 0) { throw 'Suite failed' }
& python scripts/make_report.py
if ($LASTEXITCODE -ne 0) { throw 'Report generation failed' }
