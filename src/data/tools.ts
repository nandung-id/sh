import type { Lang } from '../i18n/translations';

export interface Tool {
  id: string;
  name: Record<Lang, string>;
  description: Record<Lang, string>;
  category: 'system' | 'network' | 'security' | 'utility';
  platforms: ('linux' | 'windows' | 'macos')[];
  usage: {
    linux?: string;
    windows?: string;
    macos?: string;
  };
  features?: Record<Lang, string[]>;
}

export const tools: Tool[] = [
  {
    id: 'spec',
    name: {
      id: 'Cek Spesifikasi Sistem',
      en: 'System Spec Checker',
    },
    description: {
      id: 'Menampilkan informasi lengkap spesifikasi sistem termasuk OS, CPU, RAM, Disk, dan Network.',
      en: 'Display complete system specification including OS, CPU, RAM, Disk, and Network.',
    },
    category: 'system',
    platforms: ['linux', 'windows'],
    usage: {
      linux: 'curl -fsSL sh.pages.dev/run/system/spec.sh | bash',
      windows: 'irm sh.pages.dev/run/system/spec.ps1 | iex',
    },
    features: {
      id: [
        'Informasi sistem operasi dan kernel',
        'Detail CPU (model, cores, threads)',
        'Penggunaan memori (total, used, free)',
        'Informasi disk dan partisi',
        'Alamat IP lokal dan publik',
        'Uptime sistem',
      ],
      en: [
        'Operating system and kernel information',
        'CPU details (model, cores, threads)',
        'Memory usage (total, used, free)',
        'Disk and partition information',
        'Local and public IP addresses',
        'System uptime',
      ],
    },
  },
];

export const categoryIcons = {
  system: '💻',
  network: '🌐',
  security: '🔒',
  utility: '🔧',
};
