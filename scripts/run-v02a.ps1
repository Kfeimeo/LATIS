param([int]$Repeats = 5)
$ErrorActionPreference = 'Stop'
Set-Location -LiteralPath (Split-Path -Parent $PSScriptRoot)
& cabal --config-file=scripts/cabal.config build all --offline
if ($LASTEXITCODE -ne 0) { throw 'Build failed' }
New-Item -ItemType Directory -Force -Path results/v02a | Out-Null
try {
    Get-CimInstance Win32_Processor -ErrorAction Stop | Select-Object Name,NumberOfCores,NumberOfLogicalProcessors |
        ConvertTo-Json | Set-Content -Encoding utf8 results/v02a/hardware.json
} catch {
    @{ Identifier = $env:PROCESSOR_IDENTIFIER; ModelQuery = 'unavailable' } |
        ConvertTo-Json | Set-Content -Encoding utf8 results/v02a/hardware.json
}
& cabal --config-file=scripts/cabal.config test --offline --test-show-details=direct | Tee-Object -FilePath results/v02a/tests.log
if ($LASTEXITCODE -ne 0) { throw 'Tests failed' }
$latisExecutable = & cabal --config-file=scripts/cabal.config list-bin exe:latis
if ($LASTEXITCODE -ne 0) { throw 'Cannot locate executable' }
& $latisExecutable joint-benchmark --out results/03560426 --repeats $Repeats
if ($LASTEXITCODE -ne 0) { throw 'Core benchmark failed' }
& $latisExecutable joint-suite --out results/v02a/synthetic
if ($LASTEXITCODE -ne 0) { throw 'Regression suite failed' }
& $latisExecutable joint-stress --out results/v02a/stress
if ($LASTEXITCODE -ne 0) { throw 'Stress suite failed' }
& $latisExecutable joint-stress-benchmark --out results/v02a/stress --repeats $Repeats
if ($LASTEXITCODE -ne 0) { throw 'Stress ablation failed' }
if ($Repeats -eq 5) {
    & python scripts/make_v02a_report.py
    if ($LASTEXITCODE -ne 0) { throw 'Report validation failed' }
} else { Write-Output 'Raw results written; report requires the five-repeat protocol.' }
