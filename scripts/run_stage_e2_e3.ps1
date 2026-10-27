param(
  [string]$Out = ('results/stage_e2_e3/e23-' + (Get-Date -Format 'yyyyMMdd-HHmmss')),
  [string]$Compiler = 'E:/ghcup/ghc/9.10.3/bin/ghc.exe',
  [int]$Workers = 4,
  [string]$FullConfigs = 'FrozenE01,E2Only,RegionBreadth,FullE3',
  [string]$PilotConfigs = 'RegionPriority,BreadthScheduler,FullE3_NoMDL,FullE3_NoSafePrune',
  [switch]$PilotFull400,
  [switch]$Resume,
  [switch]$SkipTests,
  [switch]$SkipArc
)
# Stage E2/E3 end-to-end runner: build -> test suites -> region mechanism
# matrix -> prepare (frozen binary/manifest/snapshot) -> ARC 400 (full
# configs) -> ARC pilot subset (other configs; -PilotFull400 runs them on all
# 400) -> report -> traces of the audited tasks. Append-only; -Resume skips
# finished steps and never overwrites records.
$ErrorActionPreference='Stop'
Set-Location (Split-Path -Parent $PSScriptRoot)
$root=$PWD.Path
if ((Test-Path "$Out/data_manifest.json") -and -not $Resume) { throw 'Existing immutable batch; use -Resume or a new -Out.' }
$env:TEMP=Join-Path $PWD 'build/cf-tmp'; $env:TMP=$env:TEMP
New-Item -ItemType Directory -Force $env:TEMP,"$Out/validation" | Out-Null
$script:step=0; $script:steps=17
function Step([string]$name) { $script:step++; Write-Host ("[{0}/{1}] {2}  {3}" -f $script:step,$script:steps,(Get-Date -Format 'HH:mm:ss'),$name) -ForegroundColor Cyan }
function Logged([string]$exe,[string[]]$arguments,[string]$log) {
  $ErrorActionPreference='Continue'
  & $exe @arguments *> $log
  if ($LASTEXITCODE -ne 0) { throw "Failed $exe; see $log" }
}
function Shown([string]$exe,[string[]]$arguments,[string]$log) {
  $ErrorActionPreference='Continue'
  & $exe @arguments 2>&1 | Tee-Object -FilePath $log
  if ($LASTEXITCODE -ne 0) { throw "Failed $exe; see $log" }
}
$flags=@('-O2','-XGHC2021','-rtsopts','-eventlog','-fno-omit-yields','-isrc','-tmpdir','build/cf-tmp','-outputdir','build/e23-app')
Step 'build solver (skipped with -Resume)'
if (-not $Resume) { Logged $Compiler ($flags+@('app/Main.hs','-o','build/latis-stage-e23.exe')) "$Out/validation/app-build.log" }
if (-not $SkipTests -and -not (Test-Path "$Out/validation/tests_passed.json")) {
  $suites=@('Region','Geometry','ContentFirst','StageD','StageDFull','StageDControl','StageDPlus','StageC','StageA')
  foreach ($suite in $suites) {
    Step "test suite $suite (build + run)"
    $exe=Join-Path $root "build/e23-$suite-tests.exe"
    Logged $Compiler (@('-O1','-XGHC2021','-rtsopts','-isrc','-tmpdir','build/cf-tmp','-outputdir',"build/e23-tests-$suite")+@("test/${suite}Main.hs",'-o',$exe)) "$Out/validation/$suite-build.log"
    $log=Join-Path $root "$Out/validation/$suite-tests.log"
    $testArguments=@('+RTS','-M3g','-RTS')
    if ($suite -eq 'StageDPlus') { $env:LATIS_DPLUS_EVENTLOG=Join-Path $root "$Out/validation/tests.eventlog"; $testArguments=@('+RTS','-T','-l-au',"-ol$($env:LATIS_DPLUS_EVENTLOG)",'-RTS') }
    Logged $exe $testArguments $log
    if (Test-Path 'dplus_negative_controls.json') { Move-Item -Force 'dplus_negative_controls.json' "$Out/validation/dplus_negative_controls.json" }
    Add-Content $log 'EXIT 0'
    Write-Output "$suite passed"
  }
  ('{"suites":'+$suites.Count+',"passed":true}') | Set-Content "$Out/validation/tests_passed.json"
} else { $script:step+=9 }
Step 'prepare (manifest, frozen binary, source snapshot)'
if (-not (Test-Path "$Out/data_manifest.json")) { Logged 'python' @('-I','scripts/run_stage_e2_e3.py','prepare','--out',$Out,'--binary','build/latis-stage-e23.exe','--workers',"$Workers") "$Out/validation/prepare.log" }
Step 'region mechanism matrix (30 instances x 8 configs)'
if (-not (Test-Path "$Out/mechanism/matrix.json")) {
  Shown "$Out/solver.exe" @('region-mechanism','--out',"$Out/mechanism") "$Out/validation/mechanism.log"
}
if (-not $SkipArc) {
  Step "ARC 400 x full configs ($FullConfigs; $Workers workers)"
  Shown 'python' @('-I','scripts/run_stage_e2_e3.py','run','--out',$Out,'--workers',"$Workers",'--configs',$FullConfigs,'--phase','formal') "$Out/validation/formal.log"
  if ($PilotFull400) {
    Step "ARC 400 x pilot configs ($PilotConfigs)"
    Shown 'python' @('-I','scripts/run_stage_e2_e3.py','run','--out',$Out,'--workers',"$Workers",'--configs',$PilotConfigs,'--phase','pilot_full') "$Out/validation/pilot.log"
  } else {
    Step "ARC pilot subset x pilot configs ($PilotConfigs; subset = tasks whose region search opened a k>=2 split in FullE3 plus the 22 old solutions)"
    Logged 'python' @('-I','scripts/stage_e2_e3_pilot_targets.py','--out',$Out) "$Out/validation/pilot-targets.log"
    Shown 'python' @('-I','scripts/run_stage_e2_e3.py','run','--out',$Out,'--workers',"$Workers",'--configs',$PilotConfigs,'--tasks',"$Out/pilot_targets.txt",'--phase','pilot') "$Out/validation/pilot.log"
  }
  Step 'report'
  Shown 'python' @('-I','scripts/run_stage_e2_e3.py','report','--out',$Out) "$Out/validation/report.log"
}
foreach ($task in @('2dc579da','e50d258f','543a7ed5','c909285e','0b148d64')) {
  foreach ($cfg in @('FrozenE01','FullE3')) {
    $dest="$Out/traces/$task/$cfg"
    Step "trace $task $cfg"
    if (-not (Test-Path "$dest/index.html")) {
      Logged 'python' @('-I','scripts/trace_io.py','run','--task',"$Out/train_only/$task.json",'--pair-index','0','--mode','inspect-pair','--config',$cfg,'--out',$dest,'--trace-level','full','--binary',"$Out/solver.exe") "$Out/validation/trace-$task-$cfg.log"
    }
  }
}
Write-Output "Completed $Out"
