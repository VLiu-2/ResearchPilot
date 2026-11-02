param([ValidateSet('backend','frontend')][string]$Part = 'backend')
$ErrorActionPreference = 'Stop'
if ($Part -eq 'frontend') {
    Set-Location (Join-Path $PSScriptRoot 'frontend')
    & npm.cmd run dev -- --host 127.0.0.1 --port 5174 --strictPort
} else {
    Set-Location (Join-Path $PSScriptRoot 'backend')
    & (Join-Path $PSScriptRoot '.venv\Scripts\python.exe') -X utf8 -m uvicorn main:app --app-dir src --env-file .env --host 127.0.0.1 --port 8001
}
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
