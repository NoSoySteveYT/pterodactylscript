#!/bin/bash
next='sh p07.sh'
cd /var/www/pterodactyl

echo
echo '---------- Configuración del entorno ----------'
echo
sleep 1s

php artisan p:environment:setup
php artisan p:environment:database
php artisan p:environment:mail
cd /root/Pterodactyl-install-script
$next
exit
