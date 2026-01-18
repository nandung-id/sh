# Product Overview

Script Toolbox - Koleksi script untuk administrasi server dan PC.

## Purpose
Hosting bash script dan PowerShell script yang bisa dieksekusi langsung via curl/wget (Linux) atau irm (Windows).

## Usage Pattern

### Interactive Menu
```bash
# Linux/macOS
curl -fsSL sh.pages.dev/run/start.sh | bash

# Windows PowerShell
irm sh.pages.dev/run/start.ps1 | iex
```

### Direct Script Execution
```bash
# Linux/macOS
curl -fsSL sh.pages.dev/run/<category>/<script>.sh | bash

# Windows PowerShell
irm sh.pages.dev/run/<category>/<script>.ps1 | iex
```

## Features
- Multi-language support (ID/EN) with auto-detection
- OS detection for relevant commands
- Interactive menu for script discovery
- Confirmation before script execution
- Consistent branding and UX

## Deployment
Hosted on Cloudflare Pages with SSR via Workers runtime.
