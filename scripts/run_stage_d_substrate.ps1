param(
  [string]$Compiler = 'E:/ghcup/ghc/9.10.3/bin/ghc.exe',
  [switch]$SkipArc,
  [switch]$SkipRegression
)
# Reproduce the PARTIAL Stage D substrate, not an unimplemented FullD solver.
$ErrorActionPreference = 'Stop'
Set-Location (Split-Path -Parent $PSScriptRoot)
New-Item -ItemType Directory -Force build/stage-d-tmp, results/stage_d/validation | Out-Null
$env:TEMP = Join-Path $PWD 'build/stage-d-tmp'
$env:TMP = $env:TEMP
function Invoke-Logged {
  param([string]$Exe, [string[]]$Arguments, [string]$Log)
  & $Exe @Arguments *> $Log
  if ($LASTEXITCODE -ne 0) { throw "Failed: $Exe (see $Log)" }
}
$suites = @('StageD')
if (-not $SkipRegression) { $suites += @('StageC','StageB','StageA','CollectionV61','CollectionV6','Collection','Triggered','InducedR2','FeaturePipeline') }
foreach ($suite in $suites) {
  Invoke-Logged $Compiler @('-O1','-XGHC2021','-rtsopts','-isrc','-tmpdir','build/stage-d-tmp','-outputdir','build/stage-d-tests',"test/${suite}Main.hs",'-o',"build/stage-d-${suite}-tests.exe") "results/stage_d/validation/${suite}-build.txt"
  Invoke-Logged "./build/stage-d-${suite}-tests.exe" @() "results/stage_d/validation/${suite}-tests.txt"
  Write-Output "$suite passed"
}
if (-not $SkipArc) {
  if (Test-Path results/stage_d/baseline_c_replay) {
    throw 'Baseline replay already exists. Preserve that batch; use -SkipArc to recheck tests and audit, or run arc_stage_c.py with a new --out path.'
  }
  Invoke-Logged $Compiler @('-O2','-XGHC2021','-rtsopts','-fno-omit-yields','-isrc','-tmpdir','build/stage-d-tmp','-outputdir','build/stage-d-app','app/Main.hs','-o','build/latis-stage-d-substrate.exe') 'results/stage_d/validation/app-build.txt'
  Invoke-Logged 'python' @('-I','scripts/arc_stage_c.py','all','--out','results/stage_d/baseline_c_replay','--source','data/arc1-training','--workers','2','--feature-timeout-ms','60000','--binary','build/latis-stage-d-substrate.exe','--configs','ObjectShapeFull') 'results/stage_d/validation/arc-baseline.log'
}
Invoke-Logged 'python' @('-I','scripts/audit_stage_d_substrate.py') 'results/stage_d/validation/audit.txt'
Write-Output 'Partial Stage D substrate verified. FullD joint search/ablation remains unimplemented; see reports/stage_d/LATIS_STAGE_D_REPORT.md.'
