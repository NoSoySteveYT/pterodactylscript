#!/bin/bash
cd /var/www/pterodactyl

echo
echo '---------- Creando servicio pteroq ----------'
echo
sleep 1s

cat << EOF > /etc/systemd/system/pteroq.service
# Pterodactyl Queue Worker File
# ----------------------------------

[Unit]
Description=Pterodactyl Queue Worker
After=redis-server.service

[Service]
# On some systems the user and group might be different.
# Some systems use `apache` or `nginx` as the user and group.
User=www-data
Group=www-data
Restart=always
ExecStart=/usr/bin/php /var/www/pterodactyl/artisan queue:work --queue=high,standard,low --sleep=3 --tries=3
StartLimitInterval=180
StartLimitBurst=30
RestartSec=5s

[Install]
WantedBy=multi-user.target
EOF

systemctl enable --now redis-server
systemctl enable --now pteroq.service
cd /root/Pterodactyl-install-script
#sh /root/Pterodactyl-install-script/Install.sh
exit
