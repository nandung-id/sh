import { useState, useEffect } from 'react';

interface Props {
  title: string;
  description: string;
  showAllLabel: string;
}

type Platform = 'windows' | 'linux' | 'macos';

const commands = {
  linux: 'wget -qO- sh.pages.dev/start | bash',
  windows: 'irm sh.pages.dev/start.ps1 | iex',
};

export default function QuickStart({ title, description, showAllLabel }: Props) {
  const [platform, setPlatform] = useState<Platform>('linux');
  const [showAll, setShowAll] = useState(false);
  const [copiedCmd, setCopiedCmd] = useState<string | null>(null);

  useEffect(() => {
    const ua = navigator.userAgent.toLowerCase();
    if (ua.includes('win')) {
      setPlatform('windows');
    } else if (ua.includes('mac')) {
      setPlatform('macos');
    } else {
      setPlatform('linux');
    }
  }, []);

  const handleCopy = async (cmd: string) => {
    try {
      await navigator.clipboard.writeText(cmd);
      setCopiedCmd(cmd);
      setTimeout(() => setCopiedCmd(null), 2000);
    } catch (err) {
      console.error('Failed to copy:', err);
    }
  };

  const isWindows = platform === 'windows';
  const showLinux = showAll || !isWindows;
  const showWindows = showAll || isWindows;

  const styles = {
    box: {
      display: 'inline-block',
      textAlign: 'left' as const,
      padding: '1.5rem 2rem',
      background: 'linear-gradient(145deg, rgba(30, 30, 46, 0.9) 0%, rgba(24, 24, 37, 0.9) 100%)',
      backdropFilter: 'blur(10px)',
      border: '1px solid #313244',
      borderRadius: '16px',
      maxWidth: '520px',
      width: '100%',
    },
    header: {
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'space-between',
      marginBottom: '0.5rem',
      flexWrap: 'wrap' as const,
      gap: '0.5rem',
    },
    headerLeft: {
      display: 'flex',
      alignItems: 'center',
      gap: '0.5rem',
    },
    terminalIcon: {
      fontSize: '1.25rem',
    },
    label: {
      color: '#f9e2af',
      fontSize: '0.875rem',
      fontWeight: 600,
      textTransform: 'uppercase' as const,
      letterSpacing: '0.05em',
    },
    toggleBtn: {
      display: 'flex',
      alignItems: 'center',
      gap: '0.375rem',
      padding: '0.375rem 0.75rem',
      background: showAll ? 'rgba(137, 180, 250, 0.15)' : 'rgba(255, 255, 255, 0.05)',
      border: `1px solid ${showAll ? '#89b4fa' : '#313244'}`,
      borderRadius: '8px',
      color: showAll ? '#89b4fa' : '#6c7086',
      fontSize: '0.75rem',
      fontWeight: 500,
      cursor: 'pointer',
      transition: 'all 0.2s ease',
    },
    desc: {
      color: '#6c7086',
      fontSize: '0.875rem',
      margin: '0 0 1rem 0',
    },
    commands: {
      display: 'flex',
      flexDirection: 'column' as const,
      gap: '0.875rem',
    },
    cmdRow: {
      display: 'flex',
      flexDirection: 'column' as const,
      gap: '0.375rem',
    },
    platformLabel: {
      color: '#a6adc8',
      fontSize: '0.8125rem',
      fontWeight: 500,
    },
    codeWrapper: {
      display: 'flex',
      alignItems: 'center',
      background: '#11111b',
      borderRadius: '10px',
      overflow: 'hidden',
      border: '1px solid #1e1e2e',
    },
    code: {
      flex: 1,
      color: '#a6e3a1',
      fontFamily: "'JetBrains Mono', monospace",
      fontSize: '0.8125rem',
      padding: '0.75rem 1rem',
      margin: 0,
      overflow: 'auto',
    },
    copyBtn: (isCopied: boolean) => ({
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'center',
      gap: '0.375rem',
      padding: '0.75rem 1rem',
      background: isCopied ? 'rgba(166, 227, 161, 0.15)' : 'rgba(137, 180, 250, 0.1)',
      border: 'none',
      borderLeft: '1px solid #1e1e2e',
      color: isCopied ? '#a6e3a1' : '#89b4fa',
      fontSize: '0.75rem',
      fontWeight: 500,
      cursor: 'pointer',
      transition: 'all 0.2s ease',
      minWidth: '80px',
    }),
  };

  const CopyIcon = () => (
    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
      <rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect>
      <path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path>
    </svg>
  );

  const CheckIcon = () => (
    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
      <polyline points="20 6 9 17 4 12"></polyline>
    </svg>
  );

  return (
    <div style={styles.box}>
      <div style={styles.header}>
        <div style={styles.headerLeft}>
          <span style={styles.terminalIcon}>⚡</span>
          <span style={styles.label}>{title}</span>
        </div>
        <button 
          style={styles.toggleBtn}
          onClick={() => setShowAll(!showAll)}
          onMouseEnter={(e) => {
            if (!showAll) {
              e.currentTarget.style.borderColor = '#89b4fa';
              e.currentTarget.style.color = '#cdd6f4';
            }
          }}
          onMouseLeave={(e) => {
            if (!showAll) {
              e.currentTarget.style.borderColor = '#313244';
              e.currentTarget.style.color = '#6c7086';
            }
          }}
        >
          {showAll ? '✓' : '○'} {showAllLabel}
        </button>
      </div>
      
      <p style={styles.desc}>{description}</p>
      
      <div style={styles.commands}>
        {showLinux && (
          <div style={styles.cmdRow}>
            <span style={styles.platformLabel}>🐧 Linux / macOS</span>
            <div style={styles.codeWrapper}>
              <code style={styles.code}>{commands.linux}</code>
              <button 
                style={styles.copyBtn(copiedCmd === commands.linux)}
                onClick={() => handleCopy(commands.linux)}
                onMouseEnter={(e) => {
                  if (copiedCmd !== commands.linux) {
                    e.currentTarget.style.background = 'rgba(137, 180, 250, 0.2)';
                  }
                }}
                onMouseLeave={(e) => {
                  if (copiedCmd !== commands.linux) {
                    e.currentTarget.style.background = 'rgba(137, 180, 250, 0.1)';
                  }
                }}
              >
                {copiedCmd === commands.linux ? <CheckIcon /> : <CopyIcon />}
                {copiedCmd === commands.linux ? 'Copied!' : 'Copy'}
              </button>
            </div>
          </div>
        )}
        
        {showWindows && (
          <div style={styles.cmdRow}>
            <span style={styles.platformLabel}>🪟 Windows PowerShell</span>
            <div style={styles.codeWrapper}>
              <code style={styles.code}>{commands.windows}</code>
              <button 
                style={styles.copyBtn(copiedCmd === commands.windows)}
                onClick={() => handleCopy(commands.windows)}
                onMouseEnter={(e) => {
                  if (copiedCmd !== commands.windows) {
                    e.currentTarget.style.background = 'rgba(137, 180, 250, 0.2)';
                  }
                }}
                onMouseLeave={(e) => {
                  if (copiedCmd !== commands.windows) {
                    e.currentTarget.style.background = 'rgba(137, 180, 250, 0.1)';
                  }
                }}
              >
                {copiedCmd === commands.windows ? <CheckIcon /> : <CopyIcon />}
                {copiedCmd === commands.windows ? 'Copied!' : 'Copy'}
              </button>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
