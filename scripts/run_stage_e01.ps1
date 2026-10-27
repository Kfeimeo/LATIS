param(
  [string]$Out = ('results/stage_e01/e01-' + (Get-Date -Format 'yyyyMMdd-HHmmss')),
  [string]$Compiler = 'E:/ghcup/ghc/9.10.3/bin/ghc.exe',
  [int]$Workers = 4,
  [switch]$Resume,
  [switch]$SkipTests,
  [switch]$SkipArc
)
# Stage E0/E1: build -> tests -> geometry mechanism matrix -> 400-task
# train-only ablation (FrozenCF, BackgroundViewsOnly, GeometryFeaturesOnly,
# FullE01) -> traces of the three audited tasks -> report. Append-only.
$ErrorActionPreference='Stop'
Set-Location (Split-Path -Parent $PSScriptRoot)
$root=$PWD.Path
if ((Test-Path "$Out/data_manifest.json") -and -not $Resume) { throw 'Existing immutable batch; use -Resume or a new -Out.' }
$env:TEMP=Join-Path $PWD 'build/cf-tmp'; $env:TMP=$env:TEMP
New-Item -ItemType Directory -Force $env:TEMP,"$Out/validation" | Out-Null
$script:step=0
$script:steps=14
function Step([string]$name) { $script:step++; Write-Host ("[{0}/{1}] {2}  {3}" -f $script:step,$script:steps,(Get-Date -Format 'HH:mm:ss'),$name) -ForegroundColor Cyan }
function Logged([string]$exe,[string[]]$arguments,[string]$log) {
  $ErrorActionPreference='Continue'
  & $exe @arguments *> $log
  if ($LASTEXITCODE -ne 0) { throw "Failed $exe; see $log" }
}
# Long phases: console shows the progress lines, the log keeps them too.
function Shown([string]$exe,[string[]]$arguments,[string]$log) {
  $ErrorActionPreference='Continue'
  & $exe @arguments 2>&1 | Tee-Object -FilePath $log
  if ($LASTEXITCODE -ne 0) { throw "Failed $exe; see $log" }
}
$flags=@('-O2','-XGHC2021','-rtsopts','-eventlog','-fno-omit-yields','-isrc','-tmpdir','build/cf-tmp','-outputdir','build/e01-app')
Step 'build solver (skipped with -Resume)'
if (-not $Resume) { Logged $Compiler ($flags+@('app/Main.hs','-o','build/latis-stage-e01.exe')) "$Out/validation/app-build.log" }
if (-not $SkipTests -and -not (Test-Path "$Out/validation/tests_passed.json")) {
  $suites=@('Geometry','ContentFirst','StageD','StageDFull','StageDControl','StageDPlus','StageC','StageA')
  foreach ($suite in $suites) {
    Step "test suite $suite (build + run)"
    $exe=Join-Path $root "build/e01-$suite-tests.exe"
    Logged $Compiler (@('-O1','-XGHC2021','-rtsopts','-isrc','-tmpdir','build/cf-tmp','-outputdir',"build/e01-tests-$suite")+@("test/${suite}Main.hs",'-o',$exe)) "$Out/validation/$suite-build.log"
    $log=Join-Path $root "$Out/validation/$suite-tests.log"
    $testArguments=@('+RTS','-M3g','-RTS')
    if ($suite -eq 'StageDPlus') { $env:LATIS_DPLUS_EVENTLOG=Join-Path $root "$Out/validation/tests.eventlog"; $testArguments=@('+RTS','-T','-l-au',"-ol$($env:LATIS_DPLUS_EVENTLOG)",'-RTS') }
    # Suites read data/03560426.json and write under results/<stage>/unit_tests relative to the repo root.
    Logged $exe $testArguments $log
    if (Test-Path 'dplus_negative_controls.json') { Move-Item -Force 'dplus_negative_controls.json' "$Out/validation/dplus_negative_controls.json" }
    Add-Content $log 'EXIT 0'
    Write-Output "$suite passed"
  }
  ('{"suites":'+$suites.Count+',"passed":true}') | Set-Content "$Out/validation/tests_passed.json"
}
Step 'prepare (manifest, frozen binary, source snapshot)'
if (-not (Test-Path "$Out/data_manifest.json")) { Logged 'python' @('-I','scripts/run_stage_e01.py','prepare','--out',$Out,'--binary','build/latis-stage-e01.exe','--workers',"$Workers") "$Out/validation/prepare.log" }
Step 'geometry mechanism matrix (15 instances x 4 configs)'
if (-not (Test-Path "$Out/mechanism/matrix.json")) {
  Shown "$Out/solver.exe" @('geometry-mechanism','--out',"$Out/mechanism",'--config','FrozenCF,BackgroundViewsOnly,GeometryFeaturesOnly,FullE01') "$Out/validation/mechanism.log"
}
if (-not $SkipArc) {
  Step "ARC 400 x 4 configs ($Workers workers; progress bar below; finished runs are skipped on -Resume)"
  Shown 'python' @('-I','scripts/run_stage_e01.py','run','--out',$Out,'--workers',"$Workers",'--phase','formal') "$Out/validation/formal.log"
  Step 'report (per_task.csv, metrics, independent verification)'
  Shown 'python' @('-I','scripts/run_stage_e01.py','report','--out',$Out) "$Out/validation/report.log"
}
foreach ($task in @('e50d258f','2dc579da','543a7ed5')) {
  foreach ($cfg in @('FrozenCF','FullE01')) {
    $dest="$Out/traces/$task/$cfg"
    Step "trace $task $cfg"
    if (-not (Test-Path "$dest/index.html")) {
      Logged 'python' @('-I','scripts/trace_io.py','run','--task',"$Out/train_only/$task.json",'--pair-index','0','--mode','inspect-pair','--config',$cfg,'--out',$dest,'--trace-level','full','--binary',"$Out/solver.exe") "$Out/validation/trace-$task-$cfg.log"
    }
  }
}
Write-Output "Completed $Out"
