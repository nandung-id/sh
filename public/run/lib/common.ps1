# ============================================================================
# Script Toolbox - Common Library for PowerShell Scripts
# https://shbox.pages.dev
# ============================================================================

# Script Info
$script:TOOLBOX_URL = "shbox.pages.dev"
$script:TOOLBOX_AUTHOR = "Script Toolbox"
$script:TOOLBOX_CONTACT = "https://github.com/user/repo"

function Write-Banner {
    param(
        [string]$ScriptName,
        [string]$ScriptDesc
    )
    
    Write-Host ""
    Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "║  " -ForegroundColor Cyan -NoNewline
    Write-Host "🛠️  Script Toolbox" -ForegroundColor White -NoNewline
    Write-Host "                                        ║" -ForegroundColor Cyan
    Write-Host "╠════════════════════════════════════════════════════════════╣" -ForegroundColor Cyan
    Write-Host "║  " -ForegroundColor Cyan -NoNewline
    Write-Host "$ScriptName" -ForegroundColor Green
    Write-Host "║  " -ForegroundColor Cyan -NoNewline
    Write-Host "$ScriptDesc" -ForegroundColor DarkGray
    Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host ""
}

function Write-ScriptInfo {
    param(
        [string]$ScriptName,
        [string]$ScriptDesc,
        [string]$ScriptVersion
    )
    
    Write-Host ""
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Yellow
    Write-Host "Script Information" -ForegroundColor White
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Yellow
    Write-Host "  Name        : " -ForegroundColor Cyan -NoNewline
    Write-Host "$ScriptName" -ForegroundColor White
    Write-Host "  Description : " -ForegroundColor Cyan -NoNewline
    Write-Host "$ScriptDesc" -ForegroundColor Gray
    Write-Host "  Version     : " -ForegroundColor Cyan -NoNewline
    Write-Host "$ScriptVersion" -ForegroundColor Gray
    Write-Host "  Source      : " -ForegroundColor Cyan -NoNewline
    Write-Host "https://$script:TOOLBOX_URL" -ForegroundColor Gray
    Write-Host "  Author      : " -ForegroundColor Cyan -NoNewline
    Write-Host "$script:TOOLBOX_AUTHOR" -ForegroundColor Gray
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Yellow
    Write-Host ""
}

function Confirm-Run {
    Write-Host "⚠️  This script will be executed on your system." -ForegroundColor Yellow
    Write-Host "   Always review scripts before running them." -ForegroundColor DarkGray
    Write-Host ""
    
    $response = Read-Host "Continue? [y/N]"
    
    if ($response -match "^[yY]") {
        Clear-Host
        return $true
    } else {
        Write-Host ""
        Write-Host "Cancelled." -ForegroundColor Red
        exit 0
    }
}

function Write-Section {
    param([string]$Title)
    
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Blue
    Write-Host "▶ $Title" -ForegroundColor Green
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Blue
}

function Write-Success {
    param([string]$Message)
    Write-Host "✓ $Message" -ForegroundColor Green
}

function Write-Error {
    param([string]$Message)
    Write-Host "✗ $Message" -ForegroundColor Red
}

function Write-Warning {
    param([string]$Message)
    Write-Host "⚠ $Message" -ForegroundColor Yellow
}

function Write-Credits {
    Write-Host ""
    Write-Host "────────────────────────────────────────────────────────────" -ForegroundColor DarkGray
    Write-Host "  Powered by Script Toolbox | https://$script:TOOLBOX_URL" -ForegroundColor DarkGray
    Write-Host "  More scripts: https://$script:TOOLBOX_URL" -ForegroundColor DarkGray
    Write-Host "────────────────────────────────────────────────────────────" -ForegroundColor DarkGray
    Write-Host ""
}
