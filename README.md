# 🛠️ Script Toolbox

A collection of scripts for server and PC administration. Execute scripts directly via `curl` (Linux/macOS) or `irm` (Windows).

## ⚡ Quick Start

**Interactive Menu:**
```bash
# Linux/macOS
curl -fsSL shbox.pages.dev/run/start.sh | bash

# Windows PowerShell
irm shbox.pages.dev/run/start.ps1 | iex
```

**Direct Script Execution:**
```bash
# Linux/macOS
curl -fsSL shbox.pages.dev/run/<category>/<script>.sh | bash

# Windows PowerShell
irm shbox.pages.dev/run/<category>/<script>.ps1 | iex
```

## ✨ Features

- 🌐 Multi-language support (Indonesian/English) with auto-detection
- 💻 OS detection for relevant commands
- 📋 Interactive menu for script discovery
- ✅ Confirmation before script execution
- 🎨 Consistent branding and UX

## 📁 Project Structure

```
/
├── public/
│   └── run/                    # Script files
│       ├── lib/                # Shared libraries
│       ├── system/             # System scripts
│       ├── start.sh            # Interactive menu (Linux)
│       └── start.ps1           # Interactive menu (Windows)
├── src/
│   ├── components/             # UI components
│   ├── data/                   # Script registry
│   ├── i18n/                   # Translations
│   ├── layouts/                # Page layouts
│   ├── pages/                  # Web pages
│   └── middleware.ts           # Language detection
└── package.json
```

## 🧞 Commands

| Command           | Action                                      |
| :---------------- | :------------------------------------------ |
| `npm install`     | Install dependencies                        |
| `npm run dev`     | Start dev server at `localhost:4321`        |
| `npm run build`   | Build production site                       |
| `npm run preview` | Preview build locally with Wrangler         |
| `npm run deploy`  | Deploy to Cloudflare Pages                  |

## 🛠️ Tech Stack

- [Astro](https://astro.build) - Static site generator with SSR
- [Cloudflare Pages](https://pages.cloudflare.com) - Hosting platform
- [TypeScript](https://www.typescriptlang.org) - Type safety

## 🤝 Contributing

Want to add a new script? Check out [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## 📄 License

MIT
