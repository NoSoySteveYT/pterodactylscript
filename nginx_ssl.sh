#!/bin/bash

apt update
apt -y install snapd
snap install --classic certbot

rm /etc/nginx/sites-enabled/pterodactyl.conf

systemctl stop nginx
systemctl stop apache2
killall nginx
killall apache2

echo
echo '---------- Escribe el nombre de tu dominio ----------'
echo
read -p "Dominio: " DOM

certbot certonly --nginx -d $DOM

exit
