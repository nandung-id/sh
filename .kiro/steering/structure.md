# Project Structure

```
/
├── public/              # Script files (served as-is)
│   ├── spec            # Linux bash script (no extension)
│   └── spec.ps1        # Windows PowerShell script
├── src/
│   ├── components/      # Astro components
│   │   └── ToolCard.astro
│   ├── data/            # Data definitions
│   │   └── tools.ts     # Tool registry (add new tools here)
│   ├── layouts/
│   │   └── Layout.astro
│   └── pages/
│       └── index.astro  # Homepage with tool listing
└── .kiro/steering/      # Project documentation
```

## Adding New Scripts

1. Create script files in `public/`:
   - Linux: `public/<name>` (no extension, with shebang)
   - Windows: `public/<name>.ps1`

2. Register in `src/data/tools.ts`:
```ts
{
  id: 'name',
  name: 'Display Name',
  description: 'What it does',
  category: 'system', // system | network | security | utility
  platforms: ['linux', 'windows'],
  usage: {
    linux: 'wget -qO- sh.pages.dev/name | bash',
    windows: 'irm sh.pages.dev/name.ps1 | iex',
  },
  path: '/name',
}
```

## Script Conventions

### Linux Scripts
- Start with `#!/bin/bash`
- Use `set -e` for error handling
- Include colored output for readability
- Add usage comment at top

### Windows Scripts
- Use PowerShell syntax
- Include colored output with Write-Host
- Handle errors gracefully
