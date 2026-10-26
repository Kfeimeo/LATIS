param(
  [string]$Compiler = 'E:/ghcup/ghc/9.10.3/bin/ghc.exe',
  [switch]$BuildOnly,
  [switch]$SkipBuild,
  [switch]$SkipValidation
)
# Build the trace-io binary, regenerate the example traces, run validation.
$ErrorActionPreference='Stop'
Set-Location (Split-Path -Parent $PSScriptRoot)
$env:TEMP=Join-Path $PWD 'build/trace-io-tmp'; $env:TMP=$env:TEMP
New-Item -ItemType Directory -Force $env:TEMP,'results/trace_io/validation' | Out-Null
function Logged([string]$exe,[string[]]$arguments,[string]$log) {
  $ErrorActionPreference='Continue'
  & $exe @arguments *> $log
  if ($LASTEXITCODE -ne 0) { throw "Failed $exe; see $log" }
}
if (-not $SkipBuild) {
  $flags=@('-O2','-XGHC2021','-rtsopts','-eventlog','-fno-omit-yields','-isrc','-tmpdir','build/trace-io-tmp','-outputdir','build/trace-io-app')
  Logged $Compiler ($flags+@('app/Main.hs','-o','build/latis-trace-io.exe')) 'results/trace_io/validation/app-build.log'
}
if ($BuildOnly) { Write-Output 'Built build/latis-trace-io.exe'; return }
foreach ($task in @('5168d44c','ac0a08a4','ed36ccf7')) {
  foreach ($mode in @(@('inspect-pair','inspect'),@('solve-single-pair','single'))) {
    Logged 'python' @('-I','scripts/trace_io.py','run','--task',"results/stage_d_plus/dplus-20261026-v2/train_only/$task.json",'--pair-index','0','--mode',$mode[0],'--config','FullD','--out',"results/trace_io/examples/$task/$($mode[1])",'--force') "results/trace_io/validation/example-$task-$($mode[1]).log"
  }
}
if (-not $SkipValidation) { Logged 'python' @('-I','test/TraceIOValidation.py') 'results/trace_io/validation/validation_run.log' }
Write-Output 'Completed results/trace_io'
