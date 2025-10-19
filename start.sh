#!/bin/bash
clear

# 🔷 Blue Header Lines
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

# 🔹 Function to show UI
show_ui() {
  clear
  # Print header in blue
  for line in "${header[@]}"; do
    echo -e "\e[38;5;27;1m$line\e[0m"  # 27 = blue, 1 = bold
  done
  echo ""

  # Print menu in orange
  for option in "${menu[@]}"; do
    echo -e "\e[38;5;208m$option\e[0m"  # 208 = orange
  done
  echo ""
}

# 🔹 Function to safely run commands
run_command() {
  "$@" || echo -e "\e[35mAn Unexpected Error Occurred Because Of The VPS\e[0m"  # Purple error
}

# 🔹 Function to setup firewall (only ports 19100 & 19200)
setup_firewall() {
  echo -e "\e[34mSetting up firewall...\e[0m"

  sudo ufw enable
  sudo ufw allow 22/tcp      # SSH
  sudo ufw allow 80/tcp      # HTTP
  sudo ufw allow 443/tcp     # HTTPS
  sudo ufw allow 8080/tcp    # Wings port (replace if needed)

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

  read -rp "Press Enter to return to menu..."  # Always wait before showing menu again
done
