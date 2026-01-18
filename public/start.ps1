# Script Toolbox - Interactive Menu for Windows
# Usage: irm sh.pages.dev/start.ps1 | iex

$Host.UI.RawUI.WindowTitle = "Script Toolbox"

$BaseUrl = "sh.pages.dev"

# Script list
$Scripts = @(
    @{ Id = "spec"; Name = "System Spec Checker"; Desc = "Menampilkan informasi lengkap spesifikasi sistem" }
)

function Write-Header {
    Clear-Host
    Write-Host ""
    Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "║              " -ForegroundColor Cyan -NoNewline
    Write-Host "🛠️  Script Toolbox" -ForegroundColor White -NoNewline
    Write-Host "                            ║" -ForegroundColor Cyan
    Write-Host "║              " -ForegroundColor Cyan -NoNewline
    Write-Host "sh.pages.dev/start.ps1" -ForegroundColor DarkGray -NoNewline
    Write-Host "                         ║" -ForegroundColor Cyan
    Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host ""
}

function Write-Menu {
    Write-Host "Pilih script yang ingin dijalankan:" -ForegroundColor Yellow
    Write-Host ""
    
    for ($i = 0; $i -lt $Scripts.Count; $i++) {
        $num = $i + 1
        Write-Host "  [$num] " -ForegroundColor Green -NoNewline
        Write-Host $Scripts[$i].Name -ForegroundColor White
        Write-Host "      $($Scripts[$i].Desc)" -ForegroundColor DarkGray
        Write-Host ""
    }
    
    Write-Host "  [0] " -ForegroundColor Red -NoNewline
    Write-Host "Keluar" -ForegroundColor White
    Write-Host ""
}

function Invoke-Script {
    param([string]$ScriptId, [string]$ScriptName)
    
    Write-Host ""
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Blue
    Write-Host "▶ Menjalankan: " -ForegroundColor Green -NoNewline
    Write-Host $ScriptName -ForegroundColor White
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Blue
    Write-Host ""
    
    try {
        $scriptContent = Invoke-WebRequest -Uri "https://$BaseUrl/$ScriptId.ps1" -UseBasicParsing
        Invoke-Expression $scriptContent.Content
    } catch {
        Write-Host "Error: Gagal menjalankan script" -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor DarkGray
    }
}

function Main {
    Write-Header
    Write-Menu
    
    $choice = Read-Host "Masukkan pilihan [0-$($Scripts.Count)]"
    
    if ($choice -eq "0") {
        Write-Host ""
        Write-Host "Terima kasih telah menggunakan Script Toolbox!" -ForegroundColor Yellow
        Write-Host "Kunjungi: https://$BaseUrl" -ForegroundColor DarkGray
        Write-Host ""
        return
    }
    
    $index = [int]$choice - 1
    if ($index -ge 0 -and $index -lt $Scripts.Count) {
        Invoke-Script -ScriptId $Scripts[$index].Id -ScriptName $Scripts[$index].Name
    } else {
        Write-Host ""
        Write-Host "Pilihan tidak valid!" -ForegroundColor Red
        Write-Host ""
    }
}

Main
