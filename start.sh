#!/bin/bash
clear

# 🟢 Green Header Lines
header=(
"-----------------------------------------------"
"-   DYNAMIX NODES | MULTI PANEL INSTALLER     -"
"-----------------------------------------------"
)

# 🟠 Panel Installations:
menu=(
"i) Pterodactyl Multi Installer - Jishnu"
"ii) Idx 24/7 - Gamer_L"
"iii) 24/7 Panel Code - Jishnu"
"iv) Tailscale Install - Tailscale"
"v) One Cmd Panel - Jishnu"
"vi) sshx.io Setup - DynamindOP_"
"vii) Firewall Protection - DynamindOP_"
"viii) Exit - DynamindOP_"
)

# 🔹 Typewriter animation function
typewriter() {
  local text="$1"
  local delay=${2:-0.03}  # default 0.03s per character
  for ((i=0; i<${#text}; i++)); do
    echo -n "${text:$i:1}"
    sleep "$delay"
  done
  echo ""
}

# 🔹 Function to show UI with typewriter effect
show_ui() {
  clear
  # Print header in green
  for line in "${header[@]}"; do
    echo -ne "\e[38;5;46;1m"   # 46 = green, 1 = bold
    typewriter "$line" 0.005
    echo -ne "\e[0m"
  done
  echo ""

  # Print menu in orange
  for option in "${menu[@]}"; do
    echo -ne "\e[38;5;208m"
    typewriter "$option" 0.005
    echo -ne "\e[0m"
  done
  echo ""
}

# 🔹 Function to safely run commands
run_command() {
  "$@" || {
    echo -e "\e[35mAn Unexpected Error Occurred Because Of The VPS\e[0m"  # Purple error
  }
}

# 🔹 Function to setup firewall (only ports 19100 & 19200)
setup_firewall() {
  echo -e "\e[34mSetting up firewall...\e[0m"

  sudo ufw enable
  sudo ufw allow 22/tcp      # SSH
  sudo ufw allow 80/tcp      # HTTP
  sudo ufw allow 443/tcp     # HTTPS
  sudo ufw allow 8080/tcp    # Wings port, change if you need

  # Only allow 19100 and 19200
  sudo ufw allow 19100/tcp
  sudo ufw allow 19200/tcp

  sudo ufw logging on
  sudo ufw status verbose

  echo -e "\e[32mFirewall setup complete!\e[0m"
}

# 🔹 Main loop
while true; do
  show_ui
  read -rp "Enter your choice (i-viii): " choice

  case $choice in
    i|i\)) 
      run_command bash <(curl -s ptero.jishnu.fun)
      ;;
    ii|ii\)) 
      run_command bash <(curl -s https://gist.githubusercontent.com/fahmibinamin/e64a9fa40b12092103731b92eb362424/raw/866c53cbb7f963b5ccd49be7bcc1359665f8fc3b/gistfile1.txt)
      ;;
    iii|iii\)) 
      run_command python3 <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/24-7/refs/heads/main/24)
      ;;
    iv|iv\)) 
      run_command curl -fsSL https://tailscale.com/install.sh | sh
      ;;
    v|v\)) 
      run_command bash <(curl -s https://codes.jishnu.fun)
      ;;
    vi|vi\)) 
      run_command curl -sSf https://sshx.io/get | sh
      ;;
    vii|vii\)) 
      setup_firewall
      ;;
    viii|viii\)) 
      echo "Exiting panel..."; exit 0 
      ;;
    *) 
      echo -e "\e[35mInvalid option! Please type i), ii), iii), iv), v), vi), vii), or viii)\e[0m"  # Purple invalid error
      ;;
  esac

  read -rp "Press Enter to return to menu..." 
done
