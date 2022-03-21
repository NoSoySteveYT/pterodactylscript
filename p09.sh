#!/bin/bash
cd /var/www/pterodactyl
next='sh p10.sh'

echo
echo '---------- Añadiendo permisos ----------'
echo
sleep 1s

chown -R www-data:www-data /var/www/pterodactyl/*
cd /root/Pterodactyl-install-script
$next
exit
