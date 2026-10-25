param(
    [string]$Compiler = 'ghc.exe',
    [string]$Out = 'results/stage_b',
    [string]$Source = 'data/arc1-training',
    [int]$Workers = 6,
    [int]$FeatureTimeoutMs = 60000,
    [int]$PerFamily = 3,
    [int]$SmokeLimit = 8,
    [switch]$SkipBuild,
    [switch]$SkipTests,
    [switch]$SkipMechanism,
    [switch]$SkipSmoke,
    [switch]$SkipArc
)
# One-click reproduction of LATIS Stage B:
#   build -> unit/property/regression tests -> synthetic mechanism matrix
#   -> real ARC-AGI-1 train-only smoke -> full 400-task ablation run -> report.
$ErrorActionPreference = 'Stop'
Set-Location (Split-Path -Parent $PSScriptRoot)
# Run a native executable, capturing stdout+stderr into a log file. In Windows
# PowerShell 5.1 a native command's stderr (e.g. GHC warnings) becomes a
# NativeCommandError under ErrorActionPreference=Stop, so the preference is
# relaxed for the call only; success is decided by the exit code.
function Invoke-Native {
    param([string]$Exe, [string[]]$Arguments, [string]$Log)
    $ErrorActionPreference = 'Continue'
    & $Exe @Arguments 2>&1 | ForEach-Object { if ($_ -is [System.Management.Automation.ErrorRecord]) { $_.Exception.Message } else { "$_" } } | Set-Content -Encoding utf8 $Log
    $code = $LASTEXITCODE
    Add-Content -Encoding utf8 $Log "EXIT $code"
    return $code
}
New-Item -ItemType Directory -Force build/stage-b-tmp, "$Out/validation" | Out-Null
$env:TEMP = Join-Path $PWD 'build/stage-b-tmp'
$env:TMP = $env:TEMP
& $Compiler --version | Set-Content "$Out/validation/compiler.txt"
git rev-parse HEAD | Set-Content "$Out/validation/git_head.txt"
git status --porcelain | Set-Content "$Out/validation/git_status.txt"
$flags = @('-O1','-Wall','-XGHC2021','-rtsopts','-isrc','-tmpdir','build/stage-b-tmp')
if (-not $SkipBuild) {
    $code = Invoke-Native $Compiler @('-O2','-Wall','-XGHC2021','-rtsopts','-fno-omit-yields','-isrc','-tmpdir','build/stage-b-tmp','-outputdir','build/stage-b-app','app/Main.hs','-o','build/latis-stage-b.exe') "$Out/validation/app-build.txt"
    if ($code -ne 0) { throw 'Application build failed (see validation/app-build.txt)' }
    Write-Output 'app build ok'
}
if (-not $SkipTests) {
    foreach ($suite in @('StageB','StageA','CollectionV61','CollectionV6','Collection','Triggered','InducedR2','FeaturePipeline')) {
        New-Item -ItemType Directory -Force "build/stage-b-$suite" | Out-Null
        $code = Invoke-Native $Compiler ($flags + @('-outputdir', "build/stage-b-$suite", "test/${suite}Main.hs", '-o', "build/stage-b-$suite-tests.exe")) "$Out/validation/$suite-build.txt"
        if ($code -ne 0) { throw "Build failed: $suite (see validation/$suite-build.txt)" }
        $code = Invoke-Native "./build/stage-b-$suite-tests.exe" @() "$Out/validation/$suite-tests.txt"
        if ($code -ne 0) { throw "Tests failed: $suite (see validation/$suite-tests.txt)" }
        Write-Output "$suite passed"
    }
}
if (-not $SkipMechanism) {
    New-Item -ItemType Directory -Force "$Out/mechanism" | Out-Null
    $code = Invoke-Native './build/latis-stage-b.exe' @('stage-b-mechanism','--out',"$Out/mechanism",'--per-family',"$PerFamily",'+RTS','-T','-RTS') "$Out/validation/mechanism.log"
    if ($code -ne 0) { throw 'Mechanism matrix failed (see validation/mechanism.log)' }
    Write-Output 'mechanism ok'
}
$common = @('--out', "$Out/arc", '--source', $Source, '--workers', $Workers, '--feature-timeout-ms', $FeatureTimeoutMs, '--binary', 'build/latis-stage-b.exe')
$ErrorActionPreference = 'Continue'   # python progress goes to stderr; exit codes are checked below
if (-not $SkipSmoke) {
    python -I scripts/arc_stage_b.py all --out "$Out/arc_smoke" --source $Source --workers $Workers --feature-timeout-ms $FeatureTimeoutMs --binary build/latis-stage-b.exe --limit $SmokeLimit
    if ($LASTEXITCODE -ne 0) { throw 'ARC smoke failed' }
    Write-Output 'smoke ok'
}
if (-not $SkipArc) {
    python -I scripts/arc_stage_b.py prepare @common
    if ($LASTEXITCODE -ne 0) { throw 'prepare failed' }
    python -I scripts/arc_stage_b.py run @common
    if ($LASTEXITCODE -ne 0) { throw 'run failed' }
    python -I scripts/arc_stage_b.py report @common
    if ($LASTEXITCODE -ne 0) { throw 'report failed' }
    Write-Output "done: $Out/arc/summary.md, $Out/metrics.csv, $Out/per_task.csv"
}
