next='sh p04.sh'

echo
echo "---------- Descargarndo Archivos ----------"
echo
sleep 1s

mkdir -p /var/www/pterodactyl
cd /var/www/pterodactyl

curl -Lo panel.tar.gz https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz
tar -xzvf panel.tar.gz
chmod -R 755 storage/* bootstrap/cache/
cd /root/Pterodactyl-install-script
$next
exit
