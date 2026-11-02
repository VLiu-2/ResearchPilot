$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
python -m venv .venv
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
& .\.venv\Scripts\python.exe -m pip install -r backend/requirements.txt
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
foreach ($part in @('backend', 'frontend')) {
    $destination = Join-Path $PSScriptRoot "$part/.env"
    if (!(Test-Path -LiteralPath $destination)) { Copy-Item -LiteralPath (Join-Path $PSScriptRoot "$part/.env.example") -Destination $destination }
}
Set-Location (Join-Path $PSScriptRoot 'frontend')
npm.cmd ci
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
