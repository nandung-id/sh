#!/bin/bash
# ============================================================================
# System Specification Checker
# Displays complete system information including OS, CPU, RAM, Disk, Network
# 
# Usage: curl -fsSL sh.pages.dev/run/system/spec.sh | bash
#        wget -qO- sh.pages.dev/run/system/spec.sh | bash
# ============================================================================

set -e

# Script metadata
SCRIPT_NAME="System Spec Checker"
SCRIPT_DESC="Menampilkan informasi lengkap spesifikasi sistem"
SCRIPT_VERSION="1.0.0"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
DIM='\033[2m'
NC='\033[0m'

TOOLBOX_URL="sh.pages.dev"

# ============================================================================
# Helper Functions
# ============================================================================

print_info() {
  echo ""
  echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${BOLD}Script Information${NC}"
  echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "  ${CYAN}Name${NC}        : ${BOLD}$SCRIPT_NAME${NC}"
  echo -e "  ${CYAN}Description${NC} : $SCRIPT_DESC"
  echo -e "  ${CYAN}Version${NC}     : $SCRIPT_VERSION"
  echo -e "  ${CYAN}Source${NC}      : https://$TOOLBOX_URL"
  echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo ""
}

confirm_run() {
  echo -e "${YELLOW}${BOLD}⚠️  This script will be executed on your system.${NC}"
  echo -e "${DIM}   Always review scripts before running them.${NC}"
  echo ""
  echo -ne "${CYAN}${BOLD}Continue? [y/N]: ${NC}"
  read -r response
  
  case "$response" in
    [yY][eE][sS]|[yY])
      clear
      return 0
      ;;
    *)
      echo ""
      echo -e "${RED}Cancelled.${NC}"
      exit 0
      ;;
  esac
}

print_banner() {
  echo ""
  echo -e "${CYAN}╔════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${CYAN}║${NC}  ${BOLD}🛠️  Script Toolbox${NC}                                        ${CYAN}║${NC}"
  echo -e "${CYAN}╠════════════════════════════════════════════════════════════╣${NC}"
  echo -e "${CYAN}║${NC}  ${GREEN}${BOLD}$SCRIPT_NAME${NC}"
  echo -e "${CYAN}║${NC}  ${DIM}$SCRIPT_DESC${NC}"
  echo -e "${CYAN}╚════════════════════════════════════════════════════════════╝${NC}"
  echo ""
}

print_section() {
  echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${GREEN}▶ $1${NC}"
  echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

print_credits() {
  echo ""
  echo -e "${DIM}────────────────────────────────────────────────────────────${NC}"
  echo -e "${DIM}  Powered by Script Toolbox | https://$TOOLBOX_URL${NC}"
  echo -e "${DIM}────────────────────────────────────────────────────────────${NC}"
  echo ""
}

# ============================================================================
# Main Script
# ============================================================================

main() {
  # Show info and confirm
  print_info
  confirm_run
  
  # Show banner after confirmation
  print_banner

  # OS Information
  print_section "Operating System"
  if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo "  Distribution : $NAME"
    echo "  Version      : $VERSION"
  else
    echo "  OS           : $(uname -s)"
  fi
  echo "  Kernel       : $(uname -r)"
  echo "  Architecture : $(uname -m)"
  echo "  Hostname     : $(hostname)"

  # CPU Information
  print_section "CPU"
  if [ -f /proc/cpuinfo ]; then
    CPU_MODEL=$(grep -m1 "model name" /proc/cpuinfo | cut -d: -f2 | xargs)
    CPU_CORES=$(grep -c "processor" /proc/cpuinfo)
    echo "  Model        : $CPU_MODEL"
    echo "  Cores        : $CPU_CORES"
  fi

  # Memory Information
  print_section "Memory"
  if command -v free &> /dev/null; then
    TOTAL_MEM=$(free -h | awk '/^Mem:/ {print $2}')
    USED_MEM=$(free -h | awk '/^Mem:/ {print $3}')
    FREE_MEM=$(free -h | awk '/^Mem:/ {print $4}')
    echo "  Total        : $TOTAL_MEM"
    echo "  Used         : $USED_MEM"
    echo "  Free         : $FREE_MEM"
  fi

  # Disk Information
  print_section "Disk"
  df -h --total 2>/dev/null | grep -E "^/|total" | awk '{printf "  %-12s : %s total, %s used, %s free (%s)\n", $1, $2, $3, $4, $5}' || df -h | head -10

  # Network Information
  print_section "Network"
  if command -v ip &> /dev/null; then
    ip -4 addr show | grep inet | grep -v "127.0.0.1" | awk '{print "  " $NF ": " $2}'
  elif command -v ifconfig &> /dev/null; then
    ifconfig | grep "inet " | grep -v "127.0.0.1" | awk '{print "  IP: " $2}'
  fi

  # Public IP
  if command -v curl &> /dev/null; then
    PUBLIC_IP=$(curl -s --max-time 5 ifconfig.me 2>/dev/null || echo "N/A")
    echo "  Public IP    : $PUBLIC_IP"
  fi

  # Uptime
  print_section "Uptime"
  echo "  $(uptime -p 2>/dev/null || uptime)"

  echo ""
  echo -e "${GREEN}✓ Scan completed${NC}"
  
  print_credits
}

main
