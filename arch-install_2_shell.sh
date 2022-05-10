## SWAPFILE
allocate -l 3G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap sw 0 0' >> /etc/fstab
free -m

## USER
USERUSERNAME="arch-user"
useradd -m -g users -G wheel -s /bin/bash $USERUSERNAME
passwd $USERUSERNAME

EDITOR=nano visudo
# %wheel ALL=(ALL) ALL
# use sed to uncomment
reboot
