param(
  [string]$Out = ('results/stage_e4/e4-' + (Get-Date -Format 'yyyyMMdd-HHmmss')),
  [string]$Compiler = 'E:/ghcup/ghc/9.10.3/bin/ghc.exe',
  [int]$Workers = 4,
  [string]$Quick40Configs = 'E4_Off,E4_OutputSkeletonOnly,E4_NoCrossOutput',
  [string]$MechanismConfigs = 'E4_Off,E4_OutputSkeletonOnly,E4_NoCrossOutput,E4_PairwiseOnly,E4_NoMDLScore,E4_SingleExplanation,E4_NoStructuralSharing',
  [int]$Quick40TimeoutMs = 60000,
  [switch]$Quick40Also300s,
  [switch]$Full400,
  [switch]$SkipTests,
  [switch]$Resume
)
# Stage E4 runner. DEFAULT = unit tests (Output + Region) -> mechanism matrix (14 families x 3 seeds x configs)
# -> prepare -> Quick40 (60 s, 3 configs) -> regression26 (E4_Off vs sidecar) -> report -> verify -> traces.
# Full400 runs ONLY with -Full400 (milestone switch). Append-only; -Resume skips finished steps.
$ErrorActionPreference='Stop'
Set-Location (Split-Path -Parent $PSScriptRoot)
$root=$PWD.Path
if ((Test-Path "$Out/data_manifest.json") -and -not $Resume) { throw 'Existing immutable batch; use -Resume or a new -Out.' }
$env:TEMP=Join-Path $PWD 'build/e31-tmp'; $env:TMP=$env:TEMP
New-Item -ItemType Directory -Force $env:TEMP,"$Out/validation",'build/e4-app' | Out-Null
$script:step=0
function Step([string]$name) { $script:step++; Write-Host ("[{0}] {1}  {2}" -f $script:step,(Get-Date -Format 'HH:mm:ss'),$name) -ForegroundColor Cyan }
function Logged([string]$exe,[string[]]$arguments,[string]$log) {
  $err="$log.stderr"
  $p=Start-Process -FilePath $exe -ArgumentList $arguments -RedirectStandardOutput $log -RedirectStandardError $err -NoNewWindow -Wait -PassThru
  if ((Test-Path $err) -and (Get-Item $err).Length -gt 0) { Add-Content $log "--- stderr ---"; Get-Content $err | Add-Content $log }
  if (Test-Path $err) { Remove-Item $err -ErrorAction SilentlyContinue }
  if ($p.ExitCode -ne 0) { throw "Failed $exe (exit $($p.ExitCode)); see $log" }
}
function Shown([string]$exe,[string[]]$arguments,[string]$log) { Logged $exe $arguments $log; Get-Content $log -Tail 12 | Write-Host }
$flags=@('-O2','-XGHC2021','-rtsopts','-eventlog','-fno-omit-yields','-isrc','-tmpdir','build/e31-tmp','-outputdir','build/e4-app')
Step 'build solver'
if (-not $Resume) { Logged $Compiler ($flags+@('app/Main.hs','-o','build/latis-stage-e4.exe')) "$Out/validation/app-build.log" }
Step 'Quick40 manifest check (frozen hash)'
Logged 'python' @('-I','scripts/make_e4_quick40.py','--check') "$Out/validation/quick40-check.log"
if (-not $SkipTests -and -not (Test-Path "$Out/validation/tests_passed.json")) {
  foreach ($suite in @('Output','Region')) {
    Step "test suite $suite (build + run)"
    $exe=Join-Path $root "build/e4-$suite-tests.exe"
    Logged $Compiler (@('-O1','-XGHC2021','-rtsopts','-isrc','-tmpdir','build/e31-tmp','-outputdir',"build/e4-tests-$suite")+@("test/${suite}Main.hs",'-o',$exe)) "$Out/validation/$suite-build.log"
    Logged $exe @('+RTS','-M3g','-RTS') (Join-Path $root "$Out/validation/$suite-tests.log")
    Write-Output "$suite passed"
  }
  '{"suites":["Output","Region"],"passed":true,"stage_b_long_suite":"not_run (Referent.hs untouched by E4)","other_suites":"not_run in this stage (unchanged modules; last run in results/stage_e31/e31-20261028-main/validation)"}' | Set-Content "$Out/validation/tests_passed.json"
}
Step 'prepare (manifest, frozen binary, source snapshot, Quick40 copy)'
if (-not (Test-Path "$Out/data_manifest.json")) { Logged 'python' @('-I','scripts/run_stage_e4.py','prepare','--out',$Out,'--binary','build/latis-stage-e4.exe','--workers',"$Workers") "$Out/validation/prepare.log" }
Step "output mechanism matrix (14 families x 3 seeds x $MechanismConfigs)"
if (-not (Test-Path "$Out/mechanism/matrix.json")) { Shown "$Out/solver.exe" @('output-mechanism','--out',"$Out/mechanism",'--config',$MechanismConfigs) "$Out/validation/mechanism.log" }
Step "Quick40 x $Quick40Configs ($Quick40TimeoutMs ms, $Workers workers)"
Shown 'python' @('-I','scripts/run_stage_e4.py','run','--out',$Out,'--mode','quick40','--configs',$Quick40Configs,'--timeout-ms',"$Quick40TimeoutMs",'--workers',"$Workers") "$Out/validation/quick40.log"
if ($Quick40Also300s) {
  Step 'Quick40 x E4_Off,E4_OutputSkeletonOnly (300000 ms)'
  Shown 'python' @('-I','scripts/run_stage_e4.py','run','--out',$Out,'--mode','quick40','--configs','E4_Off,E4_OutputSkeletonOnly','--timeout-ms','300000','--workers',"$Workers") "$Out/validation/quick40-300.log"
}
Step 'regression26 x E4_Off,E4_OutputSkeletonOnly (300000 ms)'
Shown 'python' @('-I','scripts/run_stage_e4.py','run','--out',$Out,'--mode','regression26','--timeout-ms','300000','--workers',"$Workers") "$Out/validation/regression26.log"
if ($Full400) {
  Step 'FULL400 milestone (explicit) x E4_Off,E4_OutputSkeletonOnly'
  Shown 'python' @('-I','scripts/run_stage_e4.py','run','--out',$Out,'--mode','full400','--full400','--timeout-ms','300000','--workers',"$Workers") "$Out/validation/full400.log"
}
Step 'report + verify'
Shown 'python' @('-I','scripts/run_stage_e4.py','report','--out',$Out) "$Out/validation/report.log"
Shown 'python' @('-I','scripts/verify_stage_e4.py','--out',$Out) "$Out/validation/verify.log"
foreach ($task in @('543a7ed5','e50d258f','2dc579da')) {
  $dest="$Out/traces/$task/E4_OutputSkeletonOnly"
  Step "trace $task E4_OutputSkeletonOnly"
  if (-not (Test-Path "$dest/index.html")) { Logged 'python' @('-I','scripts/trace_io.py','run','--task',"$Out/train_only/$task.json",'--pair-index','0','--mode','inspect-pair','--config','E4_OutputSkeletonOnly','--out',$dest,'--trace-level','full','--binary',"$Out/solver.exe") "$Out/validation/trace-$task.log" }
}
Step 'viewer self-tests + tables'
Logged 'python' @('-I','scripts/stage_e31_trace_selftests.py','--out',$Out) "$Out/validation/trace_selftests.log"
Shown 'python' @('-I','scripts/report_stage_e4.py','--out',$Out) "$Out/validation/report_tables.log"
Write-Output "Completed $Out"
