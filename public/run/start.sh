#!/bin/bash
# ============================================================================
# Script Toolbox - Interactive Menu
# Browse and run available scripts
# 
# Usage: curl -fsSL shbox.pages.dev/run/start.sh | bash
#        wget -qO- shbox.pages.dev/run/start.sh | bash
# ============================================================================

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
BOLD='\033[1m'
DIM='\033[2m'
NC='\033[0m'

BASE_URL="shbox.pages.dev"

# Script list - format: "id|name|description|category"
# Add new scripts here
SCRIPTS=(
  "spec|System Spec Checker|Menampilkan informasi lengkap spesifikasi sistem|System"
)

print_banner() {
  printf "\033c"
  echo ""
  echo -e "${CYAN}╔════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${CYAN}║${NC}  ${BOLD}🛠️  Script Toolbox - Interactive Menu${NC}                  ${CYAN}║${NC}"
  echo -e "${CYAN}║${NC}  ${DIM}https://$BASE_URL${NC}                                       ${CYAN}║${NC}"
  echo -e "${CYAN}╚════════════════════════════════════════════════════════════╝${NC}"
  echo ""
}

print_menu() {
  echo -e "${YELLOW}${BOLD}Available Scripts:${NC}"
  echo ""
  
  local current_category=""
  local i=1
  
  for script in "${SCRIPTS[@]}"; do
    IFS='|' read -r id name desc category <<< "$script"
    
    # Print category header if changed
    if [[ "$category" != "$current_category" ]]; then
      [[ -n "$current_category" ]] && echo ""
      echo -e "  ${MAGENTA}[$category]${NC}"
      current_category="$category"
    fi
    
    echo -e "    ${GREEN}${BOLD}[$i]${NC} ${BOLD}$name${NC}"
    echo -e "        ${DIM}$desc${NC}"
    ((i++))
  done
  
  echo ""
  echo -e "    ${RED}${BOLD}[0]${NC} ${BOLD}Exit${NC}"
  echo ""
}

run_script() {
  local script_id=$1
  local script_name=$2
  
  echo ""
  echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${GREEN}▶ Loading: ${BOLD}$script_name${NC}"
  echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo ""
  
  if command -v curl &> /dev/null; then
    curl -fsSL "$BASE_URL/run/system/$script_id.sh" | bash
  elif command -v wget &> /dev/null; then
    wget -qO- "$BASE_URL/run/system/$script_id.sh" | bash
  else
    echo -e "${RED}Error: curl or wget not found${NC}"
    exit 1
  fi
}

main() {
  print_banner
  print_menu
  
  # Read from /dev/tty to get input when running via pipe
  echo -ne "${CYAN}${BOLD}Select [0-${#SCRIPTS[@]}]: ${NC}"
  read -r choice < /dev/tty
  
  if [[ "$choice" == "0" ]]; then
    echo ""
    echo -e "${YELLOW}Thanks for using Script Toolbox!${NC}"
    echo -e "${DIM}Visit: https://$BASE_URL${NC}"
    echo ""
    exit 0
  fi
  
  if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le "${#SCRIPTS[@]}" ]; then
    local index=$((choice - 1))
    IFS='|' read -r id name desc category <<< "${SCRIPTS[$index]}"
    run_script "$id" "$name"
  else
    echo ""
    echo -e "${RED}Invalid selection!${NC}"
    echo ""
    exit 1
  fi
}

main
