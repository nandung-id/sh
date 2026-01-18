# Project Structure

```
/
├── public/
│   └── run/                    # Script files
│       ├── lib/                # Shared libraries
│       │   ├── common.sh       # Bash helper functions
│       │   └── common.ps1      # PowerShell helper functions
│       ├── system/             # System category scripts
│       │   ├── spec.sh         # Linux spec checker
│       │   └── spec.ps1        # Windows spec checker
│       ├── start.sh            # Interactive menu (Linux)
│       └── start.ps1           # Interactive menu (Windows)
├── src/
│   ├── components/             # UI components
│   │   ├── ToolCard.astro      # Script card for homepage
│   │   ├── CodeBlock.astro     # Code display with copy
│   │   ├── CopyButton.tsx      # Copy button (React island)
│   │   ├── QuickStart.tsx      # Quick start box (React island)
│   │   └── LanguageSwitcher.tsx # Language toggle (React island)
│   ├── data/
│   │   └── tools.ts            # Script registry
│   ├── i18n/
│   │   └── translations.ts     # Multi-language strings
│   ├── layouts/
│   │   └── Layout.astro        # Base layout
│   ├── pages/
│   │   ├── index.astro         # Homepage (English - default)
│   │   ├── tools/[slug].astro  # Script detail (English)
│   │   ├── contribute.astro    # Contribute page (English)
│   │   └── id/                 # Indonesian pages
│   │       ├── index.astro
│   │       ├── tools/[slug].astro
│   │       └── contribute.astro
│   └── middleware.ts           # Request middleware
└── .kiro/steering/             # Project documentation
```

## Adding New Scripts

### 1. Create script files in `public/run/<category>/`:

**Linux (`.sh`):**
```bash
#!/bin/bash
# Script metadata
SCRIPT_NAME="My Script"
SCRIPT_DESC="What it does"
SCRIPT_VERSION="1.0.0"

# Include standard functions (copy from lib/common.sh or inline)
# ... helper functions ...

main() {
  print_info
  confirm_run
  print_banner
  
  # Your script logic here
  
  print_credits
}

main
```

**Windows (`.ps1`):**
```powershell
# Script metadata
$ScriptName = "My Script"
$ScriptDesc = "What it does"
$ScriptVersion = "1.0.0"

# Include standard functions
# ... helper functions ...

function Main {
  Write-ScriptInfo
  Confirm-Run
  Write-Banner
  
  # Your script logic here
  
  Write-Credits
}

Main
```

### 2. Register in `src/data/tools.ts`:

```ts
{
  id: 'myscript',
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
    linux: 'curl -fsSL shbox.pages.dev/run/<category>/myscript.sh | bash',
    windows: 'irm shbox.pages.dev/run/<category>/myscript.ps1 | iex',
  },
  features: {
    id: ['Fitur 1', 'Fitur 2'],
    en: ['Feature 1', 'Feature 2'],
  },
}
```

### 3. Update menu scripts:

Add entry to `public/run/start.sh` and `public/run/start.ps1` SCRIPTS array.

## Script Conventions

### Standard Template Features
- Script info display before execution
- User confirmation prompt
- Clear screen after confirmation
- Branded banner
- Colored section headers
- Credits footer

### Categories
- `system/` - System info and management
- `network/` - Network tools
- `security/` - Security and audit
- `utility/` - General utilities

### URL Pattern
```
shbox.pages.dev/run/<category>/<script>.sh   # Linux
shbox.pages.dev/run/<category>/<script>.ps1  # Windows
shbox.pages.dev/run/start.sh                 # Menu (Linux)
shbox.pages.dev/run/start.ps1                # Menu (Windows)
```
