#!/usr/bin/env pwsh
# Build a .vsix package for the Image Gallery extension.
# Usage: .\package.ps1

$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Test-Path 'node_modules')) {
    Write-Host '==> Installing npm dependencies' -ForegroundColor Cyan
    npm install
    if ($LASTEXITCODE -ne 0) { throw 'npm install failed' }
}

Write-Host '==> Packaging extension (vsce package)' -ForegroundColor Cyan
npx vsce package
if ($LASTEXITCODE -ne 0) { throw 'vsce package failed' }

$vsix = Get-ChildItem -Path $PSScriptRoot -Filter '*.vsix' |
    Sort-Object LastWriteTime -Descending |
    Select-Object -First 1

if (-not $vsix) { throw 'No .vsix file produced.' }

Write-Host ''
Write-Host "Built: $($vsix.Name)" -ForegroundColor Green
Write-Host "Path : $($vsix.FullName)"
