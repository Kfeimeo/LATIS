param(
  [string]$Out = ('results/stage_d_plus/dplus-' + (Get-Date -Format 'yyyyMMdd-HHmmss')),
  [string]$Compiler = 'E:/ghcup/ghc/9.10.3/bin/ghc.exe',
  [int]$Workers = 4,
  [switch]$Resume,
  [switch]$SkipTests
)
$ErrorActionPreference='Stop'
Set-Location (Split-Path -Parent $PSScriptRoot)
$root=$PWD.Path
if ((Test-Path "$Out/data_manifest.json") -and -not $Resume) { throw 'Existing immutable batch; use -Resume or a new -Out.' }
$env:TEMP=Join-Path $PWD 'build/stage-d-plus-tmp'; $env:TMP=$env:TEMP
New-Item -ItemType Directory -Force $env:TEMP,"$Out/validation/sandbox" | Out-Null
New-Item -ItemType Directory -Force "$Out/validation/sandbox/data" | Out-Null
if (-not (Test-Path "$Out/validation/sandbox/data/03560426.json")) { Copy-Item 'data/03560426.json' "$Out/validation/sandbox/data/03560426.json" }
function Logged([string]$exe,[string[]]$arguments,[string]$log) {
  $ErrorActionPreference='Continue'
  & $exe @arguments *> $log
  if ($LASTEXITCODE -ne 0) { throw "Failed $exe; see $log" }
}
$flags=@('-O2','-XGHC2021','-rtsopts','-eventlog','-fno-omit-yields','-isrc','-tmpdir','build/stage-d-plus-tmp','-outputdir','build/stage-d-plus-app')
if (-not $Resume) { Logged $Compiler ($flags+@('app/Main.hs','-o','build/latis-stage-d-plus.exe')) "$Out/validation/app-build.log" }
if (-not $SkipTests -and -not (Test-Path "$Out/validation/tests_passed.json")) {
  $suites=@('StageDPlus','StageD','StageDFull','StageDControl','StageC','StageB','StageA','CollectionV61','CollectionV6','Collection','Triggered','InducedR2','FeaturePipeline')
  foreach ($suite in $suites) {
    $exe=Join-Path $root "build/dplus-$suite-tests.exe"
    Logged $Compiler ($flags+@("test/${suite}Main.hs",'-o',$exe)) "$Out/validation/$suite-build.log"
    $log=Join-Path $root "$Out/validation/$suite-tests.log"
    Push-Location "$Out/validation/sandbox"
    $testArguments=@()
    if ($suite -eq 'StageDPlus') {
      $eventlog=Join-Path $root "$Out/validation/tests.eventlog"
      $env:LATIS_DPLUS_EVENTLOG=$eventlog
      $testArguments=@('+RTS','-T','-l-au',"-ol$eventlog",'-RTS')
    }
    try { Logged $exe $testArguments $log } finally { Pop-Location }
    Add-Content $log 'EXIT 0'
    Write-Output "$suite passed"
  }
  '{"suites":13,"passed":true}' | Set-Content "$Out/validation/tests_passed.json"
  Logged 'python' @('-I','test/StageDPlusDiagnostics.py') "$Out/validation/python-diagnostics-tests.log"
}
if (-not (Test-Path "$Out/data_manifest.json")) { Logged 'python' @('-I','scripts/run_stage_d_plus.py','prepare','--out',$Out,'--workers',"$Workers") "$Out/validation/prepare.log" }
Logged 'python' @('-I','scripts/check_stage_d_plus_protocol.py','--out',$Out) "$Out/validation/protocol-checks.log"
foreach ($phase in @('baseline','regression')) { Logged 'python' @('-I','scripts/run_stage_d_plus.py',$phase,'--out',$Out,'--workers',"$Workers") "$Out/validation/$phase.log" }
Logged 'python' @('-I','scripts/report_stage_d_plus.py','--out',$Out,'--gate') "$Out/validation/regression-gate.log"
foreach ($phase in @('pilot','formal','window')) { Logged 'python' @('-I','scripts/run_stage_d_plus.py',$phase,'--out',$Out,'--workers',"$Workers") "$Out/validation/$phase.log" }
Logged 'python' @('-I','scripts/report_stage_d_plus.py','--out',$Out) "$Out/validation/report.log"
Logged 'python' @('-I','scripts/audit_stage_d_plus.py','--out',$Out) "$Out/validation/audit.log"
Write-Output "Completed $Out"
