param(
  [string]$Out = ('results/content_first/cf-' + (Get-Date -Format 'yyyyMMdd-HHmmss')),
  [string]$Compiler = 'E:/ghcup/ghc/9.10.3/bin/ghc.exe',
  [int]$Workers = 4,
  [switch]$Resume,
  [switch]$SkipTests,
  [switch]$SkipArc
)
# Content-first OutputSpec: build -> tests -> mechanism matrix -> 400-task
# train-only matrix (FrozenD, ContentFirstOnly) -> targeted explore phase ->
# single-IO traces of the two audited tasks -> report. Append-only: an
# existing batch is only resumed, never overwritten.
$ErrorActionPreference='Stop'
Set-Location (Split-Path -Parent $PSScriptRoot)
$root=$PWD.Path
if ((Test-Path "$Out/data_manifest.json") -and -not $Resume) { throw 'Existing immutable batch; use -Resume or a new -Out.' }
$env:TEMP=Join-Path $PWD 'build/cf-tmp'; $env:TMP=$env:TEMP
New-Item -ItemType Directory -Force $env:TEMP,"$Out/validation" | Out-Null
function Logged([string]$exe,[string[]]$arguments,[string]$log) {
  $ErrorActionPreference='Continue'
  & $exe @arguments *> $log
  if ($LASTEXITCODE -ne 0) { throw "Failed $exe; see $log" }
}
$flags=@('-O2','-XGHC2021','-rtsopts','-eventlog','-fno-omit-yields','-isrc','-tmpdir','build/cf-tmp','-outputdir','build/cf-app')
if (-not $Resume) { Logged $Compiler ($flags+@('app/Main.hs','-o','build/latis-content-first.exe')) "$Out/validation/app-build.log" }
if (-not $SkipTests -and -not (Test-Path "$Out/validation/tests_passed.json")) {
  $suites=@('ContentFirst','StageD','StageDFull','StageDControl','StageDPlus','StageC','StageA')
  foreach ($suite in $suites) {
    $exe=Join-Path $root "build/cf-$suite-tests.exe"
    Logged $Compiler (@('-O1','-XGHC2021','-rtsopts','-isrc','-tmpdir','build/cf-tmp','-outputdir',"build/cf-tests-$suite")+@("test/${suite}Main.hs",'-o',$exe)) "$Out/validation/$suite-build.log"
    $log=Join-Path $root "$Out/validation/$suite-tests.log"
    $testArguments=@('+RTS','-M3g','-RTS')
    if ($suite -eq 'StageDPlus') { $env:LATIS_DPLUS_EVENTLOG=Join-Path $root "$Out/validation/tests.eventlog"; $testArguments=@('+RTS','-T','-l-au',"-ol$($env:LATIS_DPLUS_EVENTLOG)",'-RTS') }
    Logged $exe $testArguments $log
    Add-Content $log 'EXIT 0'
    Write-Output "$suite passed"
  }
  ('{"suites":'+$suites.Count+',"passed":true}') | Set-Content "$Out/validation/tests_passed.json"
}
if (-not (Test-Path "$Out/data_manifest.json")) { Logged 'python' @('-I','scripts/run_content_first.py','prepare','--out',$Out,'--binary','build/latis-content-first.exe','--workers',"$Workers") "$Out/validation/prepare.log" }
# Mechanism matrix + leakage + old-solution regression (train pairs only).
if (-not (Test-Path "$Out/mechanism/matrix.json")) {
  Logged "$Out/solver.exe" @('content-first-mechanism','--out',"$Out/mechanism",'--config','FrozenD,ContentFirstOnly,ContentFirstExploreAlternatives','--regression-ids','scripts/stage_d_solved_ids.txt','--arc-dir','data/arc1-training') "$Out/validation/mechanism.log"
}
if (-not $SkipArc) {
  Logged 'python' @('-I','scripts/run_content_first.py','run','--out',$Out,'--workers',"$Workers",'--configs','FrozenD,ContentFirstOnly','--phase','formal') "$Out/validation/formal.log"
  # Targeted ExploreAlternatives: every task FrozenD or ContentFirstOnly solved (alternatives of the same training signature).
  Logged 'python' @('-I','scripts/content_first_targets.py','--out',$Out) "$Out/validation/targets.log"
  Logged 'python' @('-I','scripts/run_content_first.py','run','--out',$Out,'--workers',"$Workers",'--configs','ContentFirstExploreAlternatives','--tasks',"$Out/explore_targets.txt",'--phase','explore') "$Out/validation/explore.log"
  Logged 'python' @('-I','scripts/run_content_first.py','report','--out',$Out) "$Out/validation/report.log"
}
# Single-IO traces of the two audited tasks (offline HTML).
foreach ($task in @('2dc579da','e50d258f')) {
  foreach ($cfg in @('FrozenD','ContentFirstOnly')) {
    $dest="$Out/traces/$task/$cfg"
    if (-not (Test-Path "$dest/index.html")) {
      Logged 'python' @('-I','scripts/trace_io.py','run','--task',"$Out/train_only/$task.json",'--pair-index','0','--mode','inspect-pair','--config',$cfg,'--out',$dest,'--trace-level','full','--binary',"$Out/solver.exe") "$Out/validation/trace-$task-$cfg.log"
    }
  }
}
Write-Output "Completed $Out"
