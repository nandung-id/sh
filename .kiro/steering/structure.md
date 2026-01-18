# Project Structure

```
/
├── public/              # Static assets (served as-is)
│   └── favicon.svg
├── src/
│   ├── assets/          # Processed assets (images, etc.)
│   ├── components/      # Reusable Astro components
│   ├── layouts/         # Page layout templates
│   ├── pages/           # File-based routing (each file = route)
│   └── env.d.ts         # TypeScript environment declarations
├── astro.config.mjs     # Astro configuration
├── wrangler.jsonc       # Cloudflare configuration
└── tsconfig.json        # TypeScript configuration
```

## Conventions

### Pages
- Files in `src/pages/` automatically become routes
- `index.astro` → `/`
- `about.astro` → `/about`

### Components
- Place reusable `.astro` components in `src/components/`
- Use PascalCase for component filenames

### Layouts
- Base page templates go in `src/layouts/`
- Wrap page content with `<Layout>` component
- Use `<slot />` for content injection

### Assets
- `public/` - Files served directly without processing
- `src/assets/` - Files that get processed/optimized by Astro

### Styling
- Scoped styles via `<style>` tags in Astro components
- Styles are automatically scoped to the component
