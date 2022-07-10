#!/bin/bash
# Create systemd service to disable bluetooth on startup

touch bluetooth-disable-at-boot.service
cat bluetooth-disable-at-boot.service<< EOF
[Unit]
Description=Disable Bluetooth at boot

[Service]
Type=oneshot
ExecStart=/usr/sbin/rfkill block bluetooth
ExecStop=
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
sed -i 's/^ *//g' bluetooth-disable-at-boot.service
sudo cp bluetooth-disable-at-boot.service  /lib/systemd/system/
sudo cp bluetooth-disable-at-boot.service /etc/systemd/system/bluetooth-disable-at-boot.service
sudo chmod 644 /etc/systemd/system/bluetooth-disable-at-boot.service
sudo systemctl enable --now bluetooth-disable-at-boot.service
sudo systemctl daemon-reload
sudo systemctl status bluetooth-disable-at-boot.service
