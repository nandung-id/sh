# Tech Stack

## Framework
- Astro 5.x - Static site generator with SSR support
- TypeScript - Strict mode enabled

## Deployment Platform
- Cloudflare Pages with Workers runtime
- Wrangler CLI for local dev and deployment

## Key Dependencies
- `@astrojs/cloudflare` - Cloudflare adapter for SSR
- `wrangler` - Cloudflare development tooling

## Configuration Files
- `astro.config.mjs` - Astro configuration with Cloudflare adapter
- `wrangler.jsonc` - Cloudflare Workers/Pages configuration
- `tsconfig.json` - TypeScript config extending Astro's strict preset

## Common Commands

```bash
# Install dependencies
npm install

# Start development server (localhost:4321)
npm run dev

# Build for production
npm run build

# Preview production build locally with Wrangler
npm run preview

# Deploy to Cloudflare Pages
npm run deploy

# Generate Cloudflare Worker types
npm run cf-typegen
```

## Environment & Types
- `src/env.d.ts` - Astro environment type declarations
- `worker-configuration.d.ts` - Auto-generated Cloudflare runtime types (run `npm run cf-typegen` to update)

## Cloudflare Integration
- Platform proxy enabled for local development
- Cloudflare image service configured
- Node.js compatibility mode enabled
- Access Cloudflare bindings via `Astro.locals` in components
