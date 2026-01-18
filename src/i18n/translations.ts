export const languages = {
  id: 'Bahasa Indonesia',
  en: 'English',
};

export const defaultLang = 'id';

export const translations = {
  id: {
    site: {
      title: 'Script Toolbox',
      description: 'Koleksi script untuk administrasi server dan PC',
      tagline: 'Koleksi script untuk administrasi server dan PC',
      toolsAvailable: 'tools tersedia',
    },
    nav: {
      home: 'Beranda',
      language: 'Bahasa',
      backToList: 'Kembali ke daftar',
    },
    quickStart: {
      title: 'Mulai Cepat',
      description: 'Jalankan menu interaktif untuk melihat semua script',
      showAll: 'Tampilkan semua',
    },
    tools: {
      usage: 'Penggunaan',
      features: 'Fitur',
      moreTools: 'Lebih banyak tools di',
      runInTerminal: 'Jalankan perintah ini di terminal:',
      runInPowershell: 'Jalankan perintah ini di PowerShell (sebagai Administrator):',
      orUseCurl: 'Atau gunakan curl:',
    },
    categories: {
      system: { name: 'Sistem', description: 'Tools untuk informasi dan manajemen sistem' },
      network: { name: 'Jaringan', description: 'Tools untuk jaringan dan konektivitas' },
      security: { name: 'Keamanan', description: 'Tools untuk keamanan dan audit' },
      utility: { name: 'Utilitas', description: 'Tools utilitas umum' },
    },
    footer: {
      hostedOn: 'Dihosting di Cloudflare Pages',
    },
  },
  en: {
    site: {
      title: 'Script Toolbox',
      description: 'Script collection for server and PC administration',
      tagline: 'Script collection for server and PC administration',
      toolsAvailable: 'tools available',
    },
    nav: {
      home: 'Home',
      language: 'Language',
      backToList: 'Back to list',
    },
    quickStart: {
      title: 'Quick Start',
      description: 'Run interactive menu to see all available scripts',
      showAll: 'Show all',
    },
    tools: {
      usage: 'Usage',
      features: 'Features',
      moreTools: 'More tools at',
      runInTerminal: 'Run this command in terminal:',
      runInPowershell: 'Run this command in PowerShell (as Administrator):',
      orUseCurl: 'Or use curl:',
    },
    categories: {
      system: { name: 'System', description: 'Tools for system information and management' },
      network: { name: 'Network', description: 'Tools for networking and connectivity' },
      security: { name: 'Security', description: 'Tools for security and auditing' },
      utility: { name: 'Utility', description: 'General utility tools' },
    },
    footer: {
      hostedOn: 'Hosted on Cloudflare Pages',
    },
  },
} as const;

export type Lang = keyof typeof translations;

export function t(lang: Lang, key: string): string {
  const keys = key.split('.');
  let value: any = translations[lang];
  for (const k of keys) {
    value = value?.[k];
  }
  return value || key;
}
