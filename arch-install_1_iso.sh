#0-preinstall.sh
ln /sys/firmware/efi/efivars
sleep 1
ping -c 3 archlinux.org
iplink
#wifi?
#wifi-menu
timedatectl set-ntp true
lsblk

sleep 1

# which device? 
INSTALLDRIVE=
cfdisk $INSTALLDRIVE

# EFI Partition?
USEREFI= input
mkfs.fat -F32 $USEREFI

# Root?
USERROOT = input
mkfs.ext4 $USERROOT

# Home?
USERHOME = input
mkfs.ext4 $USERHOME

mount $USERROOT /mnt
mkdir /mnt/home
mount $USERHOME /mnt/home
lsblk
echo look good? Y/N

pacstrap -i /mnt base linux linux-firmware sudo nano

genfstab -U -p /mnt >> /mnt/etc/fstab
arch-chroot /mnt /bin/bash
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc --utc
date
sleep 2
USERHOSTNAME=archvm
echo $USERHOSTNAME > /etc/hostname
echo "127.0.1.1 localhost.localdomain $USERHOSTNAME" >> /etc/hosts
pacman -S networkmanager grub efiboomgr
systemctl enable NetworkManager
echo 'set root password...'
passwd
## EFI
mkdir /boot/efi
mount /dev/sda1 /boot/efi
lsblk # to check if everything is mounted correctly
sleep 5
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi --removable
grub-mkconfig -o /boot/grub/grub.cfg
exit
umount -R /mnt
reboot

## SWAPFILE

allocate -l 3G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap sw 0 0' >> /etc/fstab
free -m

## USER
echo what username?
USERUSERNAME=input
useradd -m -g users -G wheel -s /bin/bash $USERUSERNAME
passwd $USERUSERNAME

EDITOR=nano visudo
# %wheel ALL=(ALL) ALL
# use sed to uncomment

reboot now


# 1-install.sh
echo log in as regular user now
exit

