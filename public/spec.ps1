# System Specification Checker for Windows
# Usage: irm sh.pages.dev/spec.ps1 | iex
#        Invoke-Expression (Invoke-WebRequest -Uri "sh.pages.dev/spec.ps1").Content

$Host.UI.RawUI.WindowTitle = "System Spec Checker"

function Write-Header {
    Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "║          " -ForegroundColor Cyan -NoNewline
    Write-Host "System Specification Checker" -ForegroundColor Green -NoNewline
    Write-Host "                      ║" -ForegroundColor Cyan
    Write-Host "║          " -ForegroundColor Cyan -NoNewline
    Write-Host "sh.pages.dev/spec.ps1" -ForegroundColor Yellow -NoNewline
    Write-Host "                             ║" -ForegroundColor Cyan
    Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host ""
}

function Write-Section($title) {
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Blue
    Write-Host "▶ $title" -ForegroundColor Green
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Blue
}

Write-Header

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
Write-Host "More tools at: sh.pages.dev" -ForegroundColor Yellow
