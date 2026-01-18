import { useState } from 'react';

interface Props {
  currentLang: 'id' | 'en';
}

const languages = {
  id: 'ID',
  en: 'EN',
};

const LANG_COOKIE = 'preferred_lang';
const COOKIE_MAX_AGE = 60 * 60 * 24 * 365; // 1 year in seconds

function setCookie(name: string, value: string, maxAge: number) {
  document.cookie = `${name}=${value}; path=/; max-age=${maxAge}; secure; samesite=lax`;
}

export default function LanguageSwitcher({ currentLang }: Props) {
  const [lang, setLang] = useState(currentLang);

  function getLocalizedPath(targetLang: 'id' | 'en'): string {
    const currentPath = window.location.pathname;
    
    if (targetLang === 'id') {
      // Remove /en/ prefix if exists
      if (currentPath.startsWith('/en/')) {
        return currentPath.replace('/en/', '/') || '/';
      } else if (currentPath === '/en') {
        return '/';
      }
      return currentPath;
    } else {
      // Add /en/ prefix
      if (currentPath.startsWith('/en/') || currentPath === '/en') {
        return currentPath;
      }
      if (currentPath === '/') {
        return '/en/';
      }
      return `/en${currentPath}`;
    }
  }

  function handleSwitch(targetLang: 'id' | 'en') {
    // Set cookie to remember preference
    setCookie(LANG_COOKIE, targetLang, COOKIE_MAX_AGE);
    
    setLang(targetLang);
    window.location.href = getLocalizedPath(targetLang);
  }

  return (
    <div className="lang-switcher">
      {Object.entries(languages).map(([code, label]) => (
        <button
          key={code}
          onClick={() => handleSwitch(code as 'id' | 'en')}
          className={`lang-btn ${code === lang ? 'active' : ''}`}
        >
          {label}
        </button>
      ))}
    </div>
  );
}
