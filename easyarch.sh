#!/bin/bash

read -p "WARNING: This wipes all data on target disk. Continue? y/N" drvwipe
case $drvwipe in
[Yy])
wipefs -af /dev/nvme0n1
parted -s /dev/nvme0n1 mklabel gpt
parted -s /dev/nvme0n1 mkpart ESP fat32 1MiB 1025MiB
parted -s /dev/nvme0n1 mkpart primary ext4 1025MiB 100%
mkfs.fat -F 32 "/dev/nvme0n1p1"
mkfs.ext4 "/dev/nvme0n1p2"
echo "Disk config done."
;;
[Nn])
exit 1
;;
*)
echo "ERR: Wrong input"
exit
;;
esac
mount /dev/nvme0n1p2 /mnt
mkdir /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot
echo "Installing base system."
pacstrap -K /mnt base base-devel linux linux-firmware xorg-xinit xorg-server xorg xdg-utils firefox iwd sddm plasma-meta grub efibootmgr dhcpcd nano vim wget curl git sudo
echo "%wheel	ALL=(ALL:ALL) ALL" >> /mnt/etc/sudoers
echo "Chrooting into system. Run: 'git clone https://github.com/thedistromaker/easyarch.git' again and run ./easyarch2.sh to continue"
arch-chroot /mnt
exit 0
