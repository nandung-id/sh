# Contributing to Script Toolbox

Thank you for your interest in contributing! 🎉

## 📋 Table of Contents

- [Ways to Contribute](#ways-to-contribute)
- [Adding New Scripts](#adding-new-scripts)
- [Project Structure](#project-structure)
- [Development Setup](#development-setup)
- [Pull Request Guidelines](#pull-request-guidelines)
- [Code of Conduct](#code-of-conduct)

## Ways to Contribute

1. **Add new scripts** - Create useful scripts for server/PC administration
2. **Fix bugs** - Fix issues in scripts or website
3. **Improve documentation** - Fix or add documentation
4. **Translate** - Help translate to other languages
5. **Report bugs** - Create issues for bugs found

## Adding New Scripts

### Step 1: Create Script Files

Create files in `public/run/<category>/`:

**For Linux/macOS (`.sh`):**
```bash
#!/bin/bash
# ============================================================================
# Script Name
# Brief description of what this script does
# 
# Usage: curl -fsSL shbox.pages.dev/run/<category>/name.sh | bash
# ============================================================================

set -e

# Script metadata
SCRIPT_NAME="Script Name"
SCRIPT_DESC="Script description"
SCRIPT_VERSION="1.0.0"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
DIM='\033[2m'
NC='\033[0m'

TOOLBOX_URL="shbox.pages.dev"

# ============================================================================
# Helper Functions (copy from template)
# ============================================================================

print_info() {
  echo ""
  echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${BOLD}Script Information${NC}"
  echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "  ${CYAN}Name${NC}        : ${BOLD}$SCRIPT_NAME${NC}"
  echo -e "  ${CYAN}Description${NC} : $SCRIPT_DESC"
  echo -e "  ${CYAN}Version${NC}     : $SCRIPT_VERSION"
  echo -e "  ${CYAN}Source${NC}      : https://$TOOLBOX_URL"
  echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo ""
}

confirm_run() {
  echo -e "${YELLOW}${BOLD}⚠️  This script will be executed on your system.${NC}"
  echo -e "${DIM}   Always review scripts before running them.${NC}"
  echo ""
  echo -ne "${CYAN}${BOLD}Continue? [y/N]: ${NC}"
  read -r response
  
  case "$response" in
    [yY][eE][sS]|[yY]) clear; return 0 ;;
    *) echo -e "\n${RED}Cancelled.${NC}"; exit 0 ;;
  esac
}

print_banner() {
  echo ""
  echo -e "${CYAN}╔════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${CYAN}║${NC}  ${BOLD}🛠️  Script Toolbox${NC}                                        ${CYAN}║${NC}"
  echo -e "${CYAN}╠════════════════════════════════════════════════════════════╣${NC}"
  echo -e "${CYAN}║${NC}  ${GREEN}${BOLD}$SCRIPT_NAME${NC}"
  echo -e "${CYAN}║${NC}  ${DIM}$SCRIPT_DESC${NC}"
  echo -e "${CYAN}╚════════════════════════════════════════════════════════════╝${NC}"
  echo ""
}

print_section() {
  echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${GREEN}▶ $1${NC}"
  echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

print_credits() {
  echo ""
  echo -e "${DIM}────────────────────────────────────────────────────────────${NC}"
  echo -e "${DIM}  Powered by Script Toolbox | https://$TOOLBOX_URL${NC}"
  echo -e "${DIM}────────────────────────────────────────────────────────────${NC}"
  echo ""
}

# ============================================================================
# Main Script
# ============================================================================

main() {
  print_info
  confirm_run
  print_banner

  # === YOUR SCRIPT LOGIC HERE ===
  
  print_section "Example Section"
  echo "  Hello World!"

  # === END LOGIC ===

  echo ""
  echo -e "${GREEN}✓ Done${NC}"
  print_credits
}

main
```

**For Windows (`.ps1`):**
```powershell
# ============================================================================
# Script Name
# Brief description of what this script does
# 
# Usage: irm shbox.pages.dev/run/<category>/name.ps1 | iex
# ============================================================================

$ScriptName = "Script Name"
$ScriptDesc = "Script description"
$ScriptVersion = "1.0.0"
$ToolboxUrl = "shbox.pages.dev"

# ============================================================================
# Helper Functions (copy from template)
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
        Write-Host "`nCancelled." -ForegroundColor Red
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
    Write-ScriptInfo
    Confirm-Run
    Write-Banner

    # === YOUR SCRIPT LOGIC HERE ===
    
    Write-Section "Example Section"
    Write-Host "  Hello World!"

    # === END LOGIC ===

    Write-Host ""
    Write-Host "✓ Done" -ForegroundColor Green
    Write-Credits
}

Main
```

### Step 2: Register in Registry

Edit `src/data/tools.ts`:

```typescript
{
  id: 'script-name',
  name: {
    id: 'Nama Script',
    en: 'Script Name',
  },
  description: {
    id: 'Deskripsi dalam Bahasa Indonesia',
    en: 'Description in English',
  },
  category: 'system', // system | network | security | utility
  platforms: ['linux', 'windows'],
  usage: {
    linux: 'curl -fsSL shbox.pages.dev/run/<category>/script-name.sh | bash',
    windows: 'irm shbox.pages.dev/run/<category>/script-name.ps1 | iex',
  },
  features: {
    id: ['Fitur 1', 'Fitur 2'],
    en: ['Feature 1', 'Feature 2'],
  },
}
```

### Step 3: Update Interactive Menu

Add entry to `public/run/start.sh`:
```bash
SCRIPTS=(
  # ... existing scripts ...
  "script-name|Script Name|Description|Category"
)
```

And `public/run/start.ps1`:
```powershell
$Scripts = @(
    # ... existing scripts ...
    @{ Id = "script-name"; Name = "Script Name"; Desc = "Description"; Category = "Category" }
)
```

## Project Structure

```
public/run/
├── lib/           # Shared libraries
├── system/        # System scripts
├── network/       # Network scripts
├── security/      # Security scripts
├── utility/       # Utility scripts
├── start.sh       # Menu (Linux)
└── start.ps1      # Menu (Windows)

src/
├── components/    # UI components
├── data/          # Script registry
├── i18n/          # Translations
├── layouts/       # Page layouts
└── pages/         # Web pages
```

## Development Setup

```bash
# Clone repository
git clone https://github.com/user/script-toolbox.git
cd script-toolbox

# Install dependencies
npm install

# Start development server
npm run dev

# Build for production
npm run build
```

## Pull Request Guidelines

1. **Fork** this repository
2. **Create branch** for your feature/fix: `git checkout -b feat/feature-name`
3. **Commit** changes: `git commit -m "feat: add xyz script"`
4. **Push** to branch: `git push origin feat/feature-name`
5. **Create Pull Request**

### Commit Message Format

```
<type>: <description>

Types:
- feat: New feature
- fix: Bug fix
- docs: Documentation
- style: Formatting
- refactor: Refactoring
- test: Testing
- chore: Maintenance
```

### PR Checklist

- [ ] Script runs without errors
- [ ] Follows standard template
- [ ] Registered in `tools.ts`
- [ ] Added to interactive menu
- [ ] Description available in 2 languages (ID/EN)

## Code of Conduct

- Be respectful to other contributors
- Focus on quality and usefulness of scripts
- Do not submit harmful or malicious scripts
- Document scripts clearly

---

Thank you for contributing! 🙏
