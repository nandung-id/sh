# ============================================================================
# System Specification Checker for Windows
# Displays complete system information including OS, CPU, RAM, Disk, Network
# 
# Usage: irm sh.pages.dev/run/system/spec.ps1 | iex
# ============================================================================

# Script metadata
$ScriptName = "System Spec Checker"
$ScriptDesc = "Menampilkan informasi lengkap spesifikasi sistem"
$ScriptVersion = "1.0.0"
$ToolboxUrl = "sh.pages.dev"

# ============================================================================
# Helper Functions
# ============================================================================

function Write-ScriptInfo {
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
    Write-Host "https://$ToolboxUrl" -ForegroundColor Gray
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

function Write-Banner {
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

function Write-Section {
    param([string]$Title)
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Blue
    Write-Host "▶ $Title" -ForegroundColor Green
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Blue
}

function Write-Credits {
    Write-Host ""
    Write-Host "────────────────────────────────────────────────────────────" -ForegroundColor DarkGray
    Write-Host "  Powered by Script Toolbox | https://$ToolboxUrl" -ForegroundColor DarkGray
    Write-Host "────────────────────────────────────────────────────────────" -ForegroundColor DarkGray
    Write-Host ""
}

# ============================================================================
# Main Script
# ============================================================================

function Main {
    # Show info and confirm
    Write-ScriptInfo
    Confirm-Run
    
    # Show banner after confirmation
    Write-Banner

    # OS Information
    Write-Section "Operating System"
    $os = Get-CimInstance Win32_OperatingSystem
    Write-Host "  Name         : $($os.Caption)"
    Write-Host "  Version      : $($os.Version)"
    Write-Host "  Build        : $($os.BuildNumber)"
    Write-Host "  Architecture : $($os.OSArchitecture)"
    Write-Host "  Hostname     : $env:COMPUTERNAME"

    # CPU Information
    Write-Section "CPU"
    $cpu = Get-CimInstance Win32_Processor
    Write-Host "  Model        : $($cpu.Name)"
    Write-Host "  Cores        : $($cpu.NumberOfCores)"
    Write-Host "  Threads      : $($cpu.NumberOfLogicalProcessors)"
    Write-Host "  Speed        : $($cpu.MaxClockSpeed) MHz"

    # Memory Information
    Write-Section "Memory"
    $mem = Get-CimInstance Win32_ComputerSystem
    $totalMem = [math]::Round($mem.TotalPhysicalMemory / 1GB, 2)
    $freeMem = [math]::Round((Get-CimInstance Win32_OperatingSystem).FreePhysicalMemory / 1MB, 2)
    $usedMem = [math]::Round($totalMem - $freeMem, 2)
    Write-Host "  Total        : $totalMem GB"
    Write-Host "  Used         : $usedMem GB"
    Write-Host "  Free         : $freeMem GB"

    # Disk Information
    Write-Section "Disk"
    Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | ForEach-Object {
        $total = [math]::Round($_.Size / 1GB, 2)
        $free = [math]::Round($_.FreeSpace / 1GB, 2)
        $used = [math]::Round($total - $free, 2)
        $percent = [math]::Round(($used / $total) * 100, 1)
        Write-Host "  $($_.DeviceID)           : $total GB total, $used GB used, $free GB free ($percent%)"
    }

    # Network Information
    Write-Section "Network"
    Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.IPAddress -notlike "127.*" } | ForEach-Object {
        Write-Host "  $($_.InterfaceAlias): $($_.IPAddress)"
    }

    # Public IP
    try {
        $publicIP = (Invoke-WebRequest -Uri "https://ifconfig.me" -UseBasicParsing -TimeoutSec 5).Content.Trim()
        Write-Host "  Public IP    : $publicIP"
    } catch {
        Write-Host "  Public IP    : N/A"
    }

    # Uptime
    Write-Section "Uptime"
    $uptime = (Get-Date) - (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
    Write-Host "  $($uptime.Days) days, $($uptime.Hours) hours, $($uptime.Minutes) minutes"

    Write-Host ""
    Write-Host "✓ Scan completed" -ForegroundColor Green
    
    Write-Credits
}

Main
