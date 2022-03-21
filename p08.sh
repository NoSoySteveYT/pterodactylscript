cd /var/www/pterodactyl
next='sh p09.sh'

echo
echo '---------- Crea tu usuario para el panel ----------'
echo
sleep 1s

php artisan p:user:make
cd /root/Pterodactyl-install-script
$next
exit
