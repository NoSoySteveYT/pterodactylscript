cd /var/www/pterodactyl
next='sh p08.sh'

echo
echo '---------- Migrando Tablas de DB ----------'
echo
sleep 1s

php artisan migrate --seed --force
cd /root/Pterodactyl-install-script
$next
exit
