#!/bin/bash
echo "Stage 2. Continuing..."
systemctl enable sddm iwd dhcpcd
grub-install
grub-mkconfig -o /boot/grub/grub.cfg
read -p "Base system configured. Enter username:" usernamesel
useradd $usernamesel
usermod -aG wheel $usernamesel
echo "Set your user's password"
passwd $usernamesel
mkdir -p /home/$usernamesel
chown -R $usernamesel:$usernamesel /home/$usernamesel
echo ""
echo "System set up. Exiting..."
exit 0
