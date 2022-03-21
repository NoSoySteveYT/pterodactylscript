next='sh p03.sh'

echo
echo "---------- Instalando Composer ----------"
echo
sleep 1s

curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
cd /root/Pterodactyl-install-script
$next
exit
