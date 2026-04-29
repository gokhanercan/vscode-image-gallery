#!/usr/bin/env pwsh
# Install the most recent .vsix in this folder into VS Code.
# Usage:
#   .\install.ps1                 # installs newest *.vsix into 'code'
#   .\install.ps1 -Insiders       # installs into VS Code Insiders
#   .\install.ps1 -Path foo.vsix  # installs a specific file

param(
    [string]$Path,
    [switch]$Insiders
)

$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

$cli = if ($Insiders) { 'code-insiders' } else { 'code' }
if (-not (Get-Command $cli -ErrorAction SilentlyContinue)) {
    throw "'$cli' CLI not found on PATH. Open VS Code and run 'Shell Command: Install code command in PATH'."
}

if (-not $Path) {
    $vsix = Get-ChildItem -Path $PSScriptRoot -Filter '*.vsix' |
        Sort-Object LastWriteTime -Descending |
        Select-Object -First 1
    if (-not $vsix) { throw "No .vsix found in $PSScriptRoot. Run .\package.ps1 first." }
    $Path = $vsix.FullName
}
elseif (-not (Test-Path $Path)) {
    throw "File not found: $Path"
}

Write-Host "==> Installing $Path into $cli" -ForegroundColor Cyan
& $cli --install-extension $Path --force
if ($LASTEXITCODE -ne 0) { throw 'Install failed.' }

Write-Host 'Done. Reload VS Code to activate the extension.' -ForegroundColor Green
