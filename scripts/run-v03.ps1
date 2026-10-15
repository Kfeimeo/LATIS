param([switch]$NoAudit)
$ErrorActionPreference = 'Stop'
Set-Location -LiteralPath (Split-Path -Parent $PSScriptRoot)
$v03Arguments = @('scripts/run_v03.py')
if ($NoAudit) { $v03Arguments += '--no-audit' }
& python @v03Arguments
if ($LASTEXITCODE -ne 0) { throw 'v0.3 validation/audit failed; inspect results/v03 logs' }
