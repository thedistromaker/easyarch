#!/bin/bash
echo "Stage 2. Continuing..."
systemctl enable sddm iwd dhcpcd
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
read -p "Base system configured. Enter username:" usernamesel
useradd $usernamesel
usermod -aG wheel $usernamesel
echo ""
echo "System set up. Exiting..."
exit 0
