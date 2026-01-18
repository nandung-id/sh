#!/bin/bash
# ============================================================================
# Script Toolbox - Common Library for Bash Scripts
# https://shbox.pages.dev
# ============================================================================

# Colors
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[1;33m'
export BLUE='\033[0;34m'
export CYAN='\033[0;36m'
export MAGENTA='\033[0;35m'
export BOLD='\033[1m'
export DIM='\033[2m'
export NC='\033[0m'

# Script Info
export TOOLBOX_URL="shbox.pages.dev"
export TOOLBOX_AUTHOR="Script Toolbox"
export TOOLBOX_CONTACT="https://github.com/user/repo"

# Print colored header
print_banner() {
  local script_name="$1"
  local script_desc="$2"
  
  echo ""
  echo -e "${CYAN}╔════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${CYAN}║${NC}  ${BOLD}🛠️  Script Toolbox${NC}                                        ${CYAN}║${NC}"
  echo -e "${CYAN}╠════════════════════════════════════════════════════════════╣${NC}"
  echo -e "${CYAN}║${NC}  ${GREEN}${BOLD}$script_name${NC}"
  echo -e "${CYAN}║${NC}  ${DIM}$script_desc${NC}"
  echo -e "${CYAN}╚════════════════════════════════════════════════════════════╝${NC}"
  echo ""
}

# Print script info before execution
print_info() {
  local script_name="$1"
  local script_desc="$2"
  local script_version="$3"
  
  echo ""
  echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${BOLD}Script Information${NC}"
  echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "  ${CYAN}Name${NC}        : ${BOLD}$script_name${NC}"
  echo -e "  ${CYAN}Description${NC} : $script_desc"
  echo -e "  ${CYAN}Version${NC}     : $script_version"
  echo -e "  ${CYAN}Source${NC}      : https://$TOOLBOX_URL"
  echo -e "  ${CYAN}Author${NC}      : $TOOLBOX_AUTHOR"
  echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo ""
}

# Ask for confirmation before running
confirm_run() {
  echo -e "${YELLOW}${BOLD}⚠️  This script will be executed on your system.${NC}"
  echo -e "${DIM}   Always review scripts before running them.${NC}"
  echo ""
  echo -ne "${CYAN}${BOLD}Continue? [y/N]: ${NC}"
  read -r response < /dev/tty
  
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

# Print section header
print_section() {
  echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${GREEN}▶ $1${NC}"
  echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

# Print success message
print_success() {
  echo -e "${GREEN}✓ $1${NC}"
}

# Print error message
print_error() {
  echo -e "${RED}✗ $1${NC}"
}

# Print warning message
print_warning() {
  echo -e "${YELLOW}⚠ $1${NC}"
}

# Print credits at the end
print_credits() {
  echo ""
  echo -e "${DIM}────────────────────────────────────────────────────────────${NC}"
  echo -e "${DIM}  Powered by Script Toolbox | https://$TOOLBOX_URL${NC}"
  echo -e "${DIM}  More scripts: https://$TOOLBOX_URL${NC}"
  echo -e "${DIM}────────────────────────────────────────────────────────────${NC}"
  echo ""
}
