import { defineMiddleware } from 'astro:middleware';

const LANG_COOKIE = 'preferred_lang';
const COOKIE_MAX_AGE = 60 * 60 * 24 * 365; // 1 year

export const onRequest = defineMiddleware(async (context, next) => {
  const { request, cookies, redirect } = context;
  const url = new URL(request.url);
  const pathname = url.pathname;

  // Skip for non-page requests (assets, scripts, api, etc.)
  if (
    pathname.startsWith('/_') ||
    pathname.includes('.') ||
    pathname.startsWith('/api')
  ) {
    return next();
  }

  // Check if user already has language preference
  const preferredLang = cookies.get(LANG_COOKIE)?.value;

  if (preferredLang) {
    // User has preference, don't redirect
    return next();
  }

  // Only redirect on root paths (/ or /en/)
  const isRootId = pathname === '/' || pathname === '';
  const isRootEn = pathname === '/en' || pathname === '/en/';

  if (!isRootId && !isRootEn) {
    // Not a root path, let them browse
    return next();
  }

  // Get country from Cloudflare header
  const country = request.headers.get('cf-ipcountry') || 'US';
  const isIndonesia = country === 'ID';

  // Set cookie to remember this detection
  const detectedLang = isIndonesia ? 'id' : 'en';
  cookies.set(LANG_COOKIE, detectedLang, {
    path: '/',
    maxAge: COOKIE_MAX_AGE,
    httpOnly: false,
    secure: true,
    sameSite: 'lax',
  });

  // Redirect if needed
  if (isIndonesia && isRootEn) {
    // Indonesian user on English page -> redirect to Indonesian
    return redirect('/', 302);
  } else if (!isIndonesia && isRootId) {
    // Non-Indonesian user on Indonesian page -> redirect to English
    return redirect('/en/', 302);
  }

  return next();
});
