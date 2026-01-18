export const languages = {
  id: 'Bahasa Indonesia',
  en: 'English',
};

export const defaultLang = 'en';

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
      contribute: 'Kontribusi',
    },
    contribute: {
      title: 'Panduan Kontribusi',
      description: 'Pelajari cara berkontribusi ke Script Toolbox',
      intro: 'Terima kasih telah tertarik untuk berkontribusi!',
      waysToContribute: 'Cara Berkontribusi',
      ways: {
        addScript: 'Menambah script baru',
        addScriptDesc: 'Buat script yang berguna untuk administrasi server/PC',
        fixBug: 'Memperbaiki bug',
        fixBugDesc: 'Perbaiki masalah yang ada di script atau website',
        improveDocs: 'Meningkatkan dokumentasi',
        improveDocsDesc: 'Perbaiki atau tambah dokumentasi',
        translate: 'Menerjemahkan',
        translateDesc: 'Bantu terjemahkan ke bahasa lain',
        reportBug: 'Melaporkan bug',
        reportBugDesc: 'Buat issue untuk bug yang ditemukan',
      },
      addingScript: 'Menambah Script Baru',
      step1: 'Langkah 1: Buat File Script',
      step1Desc: 'Buat file di public/run/<category>/',
      step2: 'Langkah 2: Daftarkan di Registry',
      step2Desc: 'Edit src/data/tools.ts',
      step3: 'Langkah 3: Update Menu Interaktif',
      step3Desc: 'Tambahkan entry di start.sh dan start.ps1',
      projectStructure: 'Struktur Project',
      devSetup: 'Development Setup',
      prGuidelines: 'Panduan Pull Request',
      prSteps: {
        fork: 'Fork repository ini',
        branch: 'Buat branch untuk fitur/fix kamu',
        commit: 'Commit perubahan',
        push: 'Push ke branch',
        pr: 'Buat Pull Request',
      },
      commitFormat: 'Format Commit Message',
      commitTypes: {
        feat: 'Fitur baru',
        fix: 'Bug fix',
        docs: 'Dokumentasi',
        style: 'Formatting',
        refactor: 'Refactoring',
        test: 'Testing',
        chore: 'Maintenance',
      },
      prChecklist: 'Checklist PR',
      checklistItems: {
        noError: 'Script berjalan tanpa error',
        followTemplate: 'Mengikuti template standar',
        registered: 'Terdaftar di tools.ts',
        addedToMenu: 'Ditambahkan ke menu interaktif',
        bilingual: 'Deskripsi tersedia dalam 2 bahasa (ID/EN)',
      },
      codeOfConduct: 'Kode Etik',
      conductItems: {
        respectful: 'Bersikap sopan dan menghargai kontributor lain',
        quality: 'Fokus pada kualitas dan kegunaan script',
        noMalicious: 'Jangan submit script yang berbahaya atau malicious',
        document: 'Dokumentasikan script dengan jelas',
      },
      thanks: 'Terima kasih telah berkontribusi!',
      viewOnGithub: 'Lihat di GitHub',
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
      contribute: 'Contribute',
    },
    contribute: {
      title: 'Contribution Guide',
      description: 'Learn how to contribute to Script Toolbox',
      intro: 'Thank you for your interest in contributing!',
      waysToContribute: 'Ways to Contribute',
      ways: {
        addScript: 'Add new scripts',
        addScriptDesc: 'Create useful scripts for server/PC administration',
        fixBug: 'Fix bugs',
        fixBugDesc: 'Fix issues in scripts or website',
        improveDocs: 'Improve documentation',
        improveDocsDesc: 'Fix or add documentation',
        translate: 'Translate',
        translateDesc: 'Help translate to other languages',
        reportBug: 'Report bugs',
        reportBugDesc: 'Create issues for bugs found',
      },
      addingScript: 'Adding New Scripts',
      step1: 'Step 1: Create Script File',
      step1Desc: 'Create file in public/run/<category>/',
      step2: 'Step 2: Register in Registry',
      step2Desc: 'Edit src/data/tools.ts',
      step3: 'Step 3: Update Interactive Menu',
      step3Desc: 'Add entry in start.sh and start.ps1',
      projectStructure: 'Project Structure',
      devSetup: 'Development Setup',
      prGuidelines: 'Pull Request Guidelines',
      prSteps: {
        fork: 'Fork this repository',
        branch: 'Create a branch for your feature/fix',
        commit: 'Commit your changes',
        push: 'Push to branch',
        pr: 'Create Pull Request',
      },
      commitFormat: 'Commit Message Format',
      commitTypes: {
        feat: 'New feature',
        fix: 'Bug fix',
        docs: 'Documentation',
        style: 'Formatting',
        refactor: 'Refactoring',
        test: 'Testing',
        chore: 'Maintenance',
      },
      prChecklist: 'PR Checklist',
      checklistItems: {
        noError: 'Script runs without errors',
        followTemplate: 'Follows standard template',
        registered: 'Registered in tools.ts',
        addedToMenu: 'Added to interactive menu',
        bilingual: 'Description available in 2 languages (ID/EN)',
      },
      codeOfConduct: 'Code of Conduct',
      conductItems: {
        respectful: 'Be respectful to other contributors',
        quality: 'Focus on quality and usefulness of scripts',
        noMalicious: 'Do not submit harmful or malicious scripts',
        document: 'Document scripts clearly',
      },
      thanks: 'Thank you for contributing!',
      viewOnGithub: 'View on GitHub',
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
