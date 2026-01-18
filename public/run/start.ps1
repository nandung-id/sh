# ============================================================================
# Script Toolbox - Interactive Menu for Windows
# Browse and run available scripts
# 
# Usage: irm shbox.pages.dev/run/start.ps1 | iex
# ============================================================================

$Host.UI.RawUI.WindowTitle = "Script Toolbox"

$BaseUrl = "shbox.pages.dev"

# Script list - Add new scripts here
$Scripts = @(
    @{ Id = "spec"; Name = "System Spec Checker"; Desc = "Menampilkan informasi lengkap spesifikasi sistem"; Category = "System" }
)

function Write-Banner {
    Clear-Host
    Write-Host ""
    Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "║  " -ForegroundColor Cyan -NoNewline
    Write-Host "🛠️  Script Toolbox - Interactive Menu" -ForegroundColor White -NoNewline
    Write-Host "                  ║" -ForegroundColor Cyan
    Write-Host "║  " -ForegroundColor Cyan -NoNewline
    Write-Host "https://$BaseUrl" -ForegroundColor DarkGray -NoNewline
    Write-Host "                                       ║" -ForegroundColor Cyan
    Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host ""
}

function Write-Menu {
    Write-Host "Available Scripts:" -ForegroundColor Yellow
    Write-Host ""
    
    $currentCategory = ""
    for ($i = 0; $i -lt $Scripts.Count; $i++) {
        $script = $Scripts[$i]
        $num = $i + 1
        
        # Print category header if changed
        if ($script.Category -ne $currentCategory) {
            if ($currentCategory -ne "") { Write-Host "" }
            Write-Host "  [$($script.Category)]" -ForegroundColor Magenta
            $currentCategory = $script.Category
        }
        
        Write-Host "    [$num] " -ForegroundColor Green -NoNewline
        Write-Host $script.Name -ForegroundColor White
        Write-Host "        $($script.Desc)" -ForegroundColor DarkGray
    }
    
    Write-Host ""
    Write-Host "    [0] " -ForegroundColor Red -NoNewline
    Write-Host "Exit" -ForegroundColor White
    Write-Host ""
}

function Invoke-SelectedScript {
    param([string]$ScriptId, [string]$ScriptName)
    
    Write-Host ""
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Blue
    Write-Host "▶ Loading: " -ForegroundColor Green -NoNewline
    Write-Host $ScriptName -ForegroundColor White
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Blue
    Write-Host ""
    
    try {
        $scriptContent = Invoke-WebRequest -Uri "https://$BaseUrl/run/system/$ScriptId.ps1" -UseBasicParsing
        Invoke-Expression $scriptContent.Content
    } catch {
        Write-Host "Error: Failed to load script" -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor DarkGray
    }
}

function Main {
    Write-Banner
    Write-Menu
    
    $choice = Read-Host "Select [0-$($Scripts.Count)]"
    
    if ($choice -eq "0") {
        Write-Host ""
        Write-Host "Thanks for using Script Toolbox!" -ForegroundColor Yellow
        Write-Host "Visit: https://$BaseUrl" -ForegroundColor DarkGray
        Write-Host ""
        return
    }
    
    $index = [int]$choice - 1
    if ($index -ge 0 -and $index -lt $Scripts.Count) {
        Invoke-SelectedScript -ScriptId $Scripts[$index].Id -ScriptName $Scripts[$index].Name
    } else {
        Write-Host ""
        Write-Host "Invalid selection!" -ForegroundColor Red
        Write-Host ""
    }
}

Main
