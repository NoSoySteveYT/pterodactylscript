#!/bin/bash
rm /etc/apache2/sites-enabled/000-default.conf
rm /etc/apache2/sites-enabled/pterodactyl.conf
a2dissite 000-default.conf
systemctl stop apache2
systemctl stop nginx
killall apache2
killall nginx
apt-get install -y libapache2-mod-php
a2enmod php8.0

echo
echo '---------- Elige el puerto que usara el servidor web apache2, si no sabes pone 80 ----------'
echo
read -p "Puerto: " PORT

echo
echo '---------- Pone tu dominio si no tienes dominio pone 0.0.0.0 ----------'
echo
sleep 1s
read -p "Dominio: " DOM

cat << EOF > /etc/apache2/sites-available/pterodactyl.conf
<VirtualHost *:$PORT>
  ServerName $DOM
  DocumentRoot "/var/www/pterodactyl/public"
  
  AllowEncodedSlashes On
  
  php_value upload_max_filesize 100M
  php_value post_max_size 100M
  
  <Directory "/var/www/pterodactyl/public">
    AllowOverride all
    Require all granted
  </Directory>
</VirtualHost>
EOF
ln -s /etc/apache2/sites-available/pterodactyl.conf /etc/apache2/sites-enabled/pterodactyl.conf
a2enmod rewrite

ufw allow $PORT/tcp
ufw allow $PORT/udp

systemctl restart apache2

exit