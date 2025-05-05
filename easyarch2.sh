#!/bin/bash
echo "Stage 2. Continuing..."
systemctl enable sddm iwd dhcpcd
read -p "Base system configured. Enter username:" usernamesel
useradd $usernamesel
usermod -aG wheel $usernamesel
echo ""
echo "System set up. Exiting..."
exit 0
