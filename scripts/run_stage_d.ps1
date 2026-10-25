param(
  [string]$Compiler = 'E:/ghcup/ghc/9.10.3/bin/ghc.exe',
  [string]$Out = 'results/stage_d/full_p0',
  [int]$Workers = 4,
  [int]$FeatureTimeoutMs = 60000,
  [switch]$SkipBuild,
  [switch]$SkipTests,
  [switch]$SkipRegression,
  [switch]$SkipMechanism,
  [switch]$SkipArc
)
$ErrorActionPreference = 'Stop'
Set-Location (Split-Path -Parent $PSScriptRoot)
if (-not $SkipArc -and (Test-Path "$Out/arc/data_manifest.json")) { throw 'ARC batch exists; resume via arc_stage_d.py run/report, or choose a new -Out. No binary was rebuilt.' }
if (-not $SkipMechanism -and (Test-Path "$Out/mechanism/matrix.json")) { throw 'Mechanism batch exists; use -SkipMechanism or a new -Out. No binary was rebuilt.' }
New-Item -ItemType Directory -Force build/stage-d-tmp, "$Out/validation" | Out-Null
$env:TEMP = Join-Path $PWD 'build/stage-d-tmp'
$env:TMP = $env:TEMP
function Invoke-Logged {
  param([string]$Exe, [string[]]$Arguments, [string]$Log)
  $ErrorActionPreference = 'Continue'
  & $Exe @Arguments *> $Log
  if ($LASTEXITCODE -ne 0) { throw "Failed: $Exe (see $Log)" }
}
$flags = @('-O2','-XGHC2021','-rtsopts','-fno-omit-yields','-isrc','-tmpdir','build/stage-d-tmp','-outputdir','build/stage-d-app')
if (-not $SkipBuild) {
  Invoke-Logged $Compiler ($flags + @('app/Main.hs','-o','build/latis-stage-d-full.exe')) "$Out/validation/app-build.txt"
}
if (-not $SkipTests) {
  $suites = @('StageD','StageDFull','StageDControl')
  if (-not $SkipRegression) { $suites += @('StageC','StageB','StageA','CollectionV61','CollectionV6','Collection','Triggered','InducedR2','FeaturePipeline') }
  foreach ($suite in $suites) {
    Invoke-Logged $Compiler ($flags + @("test/${suite}Main.hs",'-o',"build/stage-d-${suite}-final-tests.exe")) "$Out/validation/${suite}-build.txt"
    Invoke-Logged "./build/stage-d-${suite}-final-tests.exe" @() "$Out/validation/${suite}-tests.txt"
    Add-Content "$Out/validation/${suite}-tests.txt" 'EXIT 0'
    Write-Output "$suite passed"
  }
  Invoke-Logged $Compiler @('-O2','-XGHC2021','-rtsopts','-isrc','-tmpdir','build/stage-d-tmp','-outputdir','build/stage-d-memory','test/StageDMemoryMain.hs','-o','build/stage-d-memory.exe') "$Out/validation/memory-build.txt"
  foreach ($mode in @('SharedParamVSA','NoParamVSA')) {
    foreach ($repeat in 1..3) {
      Invoke-Logged './build/stage-d-memory.exe' @($mode,'+RTS','-T','-RTS') "$Out/validation/memory-$mode-$repeat.json"
    }
  }
}
if (-not $SkipMechanism) {
  if (Test-Path "$Out/mechanism/matrix.json") { throw 'Mechanism batch exists; preserve it and use -SkipMechanism or a new output directory.' }
  Invoke-Logged './build/latis-stage-d-full.exe' @('stage-d-mechanism','--out',"$Out/mechanism",'+RTS','-T','-M4g','-RTS') "$Out/validation/mechanism.log"
  Write-Output 'Mechanism matrix completed'
}
if (-not $SkipArc) {
  if (Test-Path "$Out/arc/data_manifest.json") { throw 'ARC batch exists; preserve it and use arc_stage_d.py run/report to resume, or a new output directory.' }
  Invoke-Logged 'python' @('-I','scripts/arc_stage_d.py','all','--out',"$Out/arc",'--source','data/arc1-training','--binary','build/latis-stage-d-full.exe','--workers',"$Workers",'--feature-timeout-ms',"$FeatureTimeoutMs") "$Out/validation/arc.log"
  Write-Output 'ARC 400 x 8 completed and audited'
}
Write-Output "Results: $Out (source and binary hashes in arc/code_version.json)."
if ((Test-Path "$Out/arc/metrics.json") -and (Test-Path "$Out/mechanism/matrix.json")) {
  Invoke-Logged 'python' @('-I','scripts/report_stage_d.py','--out',"$Out") "$Out/validation/final-audit.log"
  Write-Output 'Final Chinese design/report and top-level metrics generated.'
}
