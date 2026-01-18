import { useState, useEffect } from 'react';

interface Props {
  currentLang: 'id' | 'en';
}

const languages = {
  id: 'ID',
  en: 'EN',
};

export default function LanguageSwitcher({ currentLang }: Props) {
  const [lang, setLang] = useState(currentLang);

  function getLocalizedPath(targetLang: 'id' | 'en'): string {
    return targetLang === 'id' ? '/' : `/${targetLang}/`;
  }

  function handleSwitch(targetLang: 'id' | 'en') {
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
