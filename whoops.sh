#!/bin/bash
echo "Sorry! Didn't install bootloader."
mount /dev/nvme0n1p2 /mnt
mount /dev/nvme0n1p1 /mnt/boot
echo "Run: 'grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB' inside the chroot."
arch-chroot /mnt
