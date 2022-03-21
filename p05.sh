#!/bin/bash
next='sh p06.sh'
cd /var/www/pterodactyl

echo
echo '---------- Instalando ----------'
echo
sleep 1s

cp .env.example .env
composer install --no-dev --optimize-autoloader
php artisan key:generate --force

cd /root/Pterodactyl-install-script 
$next
exit
