param(
  [string]$Out = ('results/stage_e31/e31-' + (Get-Date -Format 'yyyyMMdd-HHmmss')),
  [string]$Compiler = 'E:/ghcup/ghc/9.10.3/bin/ghc.exe',
  [int]$Workers = 4,
  [string]$Configs = 'FrozenE01,E31_PatchedBaseline,E31_PrecheckOnly,E31_LazyMDLOnly,E31_Full,E31_FullNoMDL,E31_FullNoSafePrune,E31_FullSelectorPriority,E31_FullCostOrder',
  [string]$SingleWorkerTasks = '484b58aa',
  [string]$SingleWorkerConfigs = 'E31_PatchedBaseline,E31_Full,E31_FullNoMDL',
  [switch]$Resume,
  [switch]$SkipTests,
  [switch]$SkipArc,
  [switch]$RunStageB
)
# Stage E3.1 end-to-end runner: build the FINAL binary -> test suites -> region mechanism
# matrix (15 families x 3 seeds x 9 configs) -> prepare (frozen binary / manifest / snapshot)
# -> ARC 400 x all configs (one binary, $Workers workers) -> single-worker replays
# -> report -> independent verification -> traces of the audited tasks -> viewer self-tests.
# Append-only; -Resume skips finished steps and never overwrites records.
$ErrorActionPreference='Stop'
Set-Location (Split-Path -Parent $PSScriptRoot)
$root=$PWD.Path
if ((Test-Path "$Out/data_manifest.json") -and -not $Resume) { throw 'Existing immutable batch; use -Resume or a new -Out.' }
$env:TEMP=Join-Path $PWD 'build/e31-tmp'; $env:TMP=$env:TEMP
New-Item -ItemType Directory -Force $env:TEMP,"$Out/validation" | Out-Null
$script:step=0; $script:steps=24
function Step([string]$name) { $script:step++; Write-Host ("[{0}/{1}] {2}  {3}" -f $script:step,$script:steps,(Get-Date -Format 'HH:mm:ss'),$name) -ForegroundColor Cyan }
# Native processes write straight to files (Start-Process redirection): PowerShell's own
# `*>` redirection stalled a long-running test suite once its output exceeded a few hundred KB.
function Logged([string]$exe,[string[]]$arguments,[string]$log) {
  $err="$log.stderr"
  $p=Start-Process -FilePath $exe -ArgumentList $arguments -RedirectStandardOutput $log -RedirectStandardError $err -NoNewWindow -Wait -PassThru
  if ((Test-Path $err) -and (Get-Item $err).Length -gt 0) { Add-Content $log "--- stderr ---"; Get-Content $err | Add-Content $log }
  if (Test-Path $err) { Remove-Item $err -ErrorAction SilentlyContinue }
  if ($p.ExitCode -ne 0) { throw "Failed $exe (exit $($p.ExitCode)); see $log" }
}
function Shown([string]$exe,[string[]]$arguments,[string]$log) {
  Logged $exe $arguments $log
  Get-Content $log -Tail 12 | Write-Host
}
$flags=@('-O2','-XGHC2021','-rtsopts','-eventlog','-fno-omit-yields','-isrc','-tmpdir','build/e31-tmp','-outputdir','build/e31-app')
Step 'build solver (skipped with -Resume)'
if (-not $Resume) { Logged $Compiler ($flags+@('app/Main.hs','-o','build/latis-stage-e31.exe')) "$Out/validation/app-build.log" }
$suites=@('Region','Geometry','ContentFirst','StageD','StageDFull','StageDControl','StageDPlus','StageC','StageA')
if ($RunStageB) { $suites+='StageB' }
if (-not $SkipTests -and -not (Test-Path "$Out/validation/tests_passed.json")) {
  foreach ($suite in $suites) {
    Step "test suite $suite (build + run)"
    $exe=Join-Path $root "build/e31-$suite-tests.exe"
    Logged $Compiler (@('-O1','-XGHC2021','-rtsopts','-isrc','-tmpdir','build/e31-tmp','-outputdir',"build/e31-tests-$suite")+@("test/${suite}Main.hs",'-o',$exe)) "$Out/validation/$suite-build.log"
    $log=Join-Path $root "$Out/validation/$suite-tests.log"
    $testArguments=@('+RTS','-M3g','-RTS')
    if ($suite -eq 'StageDPlus') { $env:LATIS_DPLUS_EVENTLOG=Join-Path $root "$Out/validation/tests.eventlog"; $testArguments=@('+RTS','-T','-l-au',"-ol$($env:LATIS_DPLUS_EVENTLOG)",'-RTS') }
    Logged $exe $testArguments $log
    if (Test-Path 'dplus_negative_controls.json') { Move-Item -Force 'dplus_negative_controls.json' "$Out/validation/dplus_negative_controls.json" }
    Add-Content $log 'EXIT 0'
    Write-Output "$suite passed"
  }
  $stageB=if ($RunStageB) { 'run' } else { 'not_run (30 min suite; run with -RunStageB)' }
  ('{"suites":'+$suites.Count+',"passed":true,"stage_b_long_suite":"'+$stageB+'"}') | Set-Content "$Out/validation/tests_passed.json"
} else { $script:step+=$suites.Count }
Step 'prepare (manifest, frozen binary, source snapshot)'
if (-not (Test-Path "$Out/data_manifest.json")) { Logged 'python' @('-I','scripts/run_stage_e31.py','prepare','--out',$Out,'--binary','build/latis-stage-e31.exe','--workers',"$Workers") "$Out/validation/prepare.log" }
Step 'region mechanism matrix (15 families x 3 seeds x configs)'
if (-not (Test-Path "$Out/mechanism/matrix.json")) {
  Shown "$Out/solver.exe" @('region-mechanism-e31','--out',"$Out/mechanism",'--config',$Configs) "$Out/validation/mechanism.log"
}
if (-not $SkipArc) {
  Step "ARC 400 x configs ($Configs; $Workers workers)"
  Shown 'python' @('-I','scripts/run_stage_e31.py','run','--out',$Out,'--workers',"$Workers",'--configs',$Configs,'--phase','formal') "$Out/validation/formal.log"
  Step "single-worker replays ($SingleWorkerTasks x $SingleWorkerConfigs)"
  Shown 'python' @('-I','scripts/run_stage_e31.py','run','--out',$Out,'--workers','1','--configs',$SingleWorkerConfigs,'--tasks',$SingleWorkerTasks,'--phase','single_worker','--subdir','tasks_w1') "$Out/validation/single_worker.log"
  Step 'report'
  Shown 'python' @('-I','scripts/run_stage_e31.py','report','--out',$Out) "$Out/validation/report.log"
  Step 'independent verification'
  Shown 'python' @('-I','scripts/verify_stage_e31.py','--out',$Out) "$Out/validation/verify.log"
}
foreach ($task in @('2dc579da','1c786137','e50d258f')) {
  foreach ($cfg in @('E31_PatchedBaseline','E31_Full','E31_FullNoMDL')) {
    $dest="$Out/traces/$task/$cfg"
    Step "trace $task $cfg"
    if (-not (Test-Path "$dest/index.html")) {
      Logged 'python' @('-I','scripts/trace_io.py','run','--task',"$Out/train_only/$task.json",'--pair-index','0','--mode','inspect-pair','--config',$cfg,'--out',$dest,'--trace-level','full','--binary',"$Out/solver.exe") "$Out/validation/trace-$task-$cfg.log"
    }
  }
}
Step 'viewer self-tests + report digest'
Logged 'python' @('-I','scripts/stage_e31_trace_selftests.py','--out',$Out) "$Out/validation/trace_selftests.log"
Shown 'python' @('-I','scripts/report_stage_e31.py','--out',$Out) "$Out/validation/report_tables.log"
Write-Output "Completed $Out"
