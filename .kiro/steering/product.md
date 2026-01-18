# Product Overview

Script Toolbox - Koleksi script untuk administrasi server dan PC.

## Purpose
Hosting bash script dan PowerShell script yang bisa dieksekusi langsung via curl/wget (Linux) atau irm (Windows).

## Usage Pattern
```bash
# Linux/macOS
wget -qO- sh.pages.dev/<script> | bash
curl -fsSL sh.pages.dev/<script> | bash

# Windows PowerShell
irm sh.pages.dev/<script>.ps1 | iex
```

## Deployment
Hosted on Cloudflare Pages - scripts served as static files from `/public`.
