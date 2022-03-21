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
echo '---------- Elige el puerto que usara SLL, si no sabes pone 443 ----------'
echo
read -p "Puerto: " PORTS

echo
echo '---------- Pone tu dominio ----------'
echo
sleep 1s
read -p "Dominio: " DOM

cat << EOF > /etc/apache2/sites-available/pterodactyl.conf
<VirtualHost *:$PORT>
  ServerName $DOM
  
  RewriteEngine On
  RewriteCond %{HTTPS} !=on
  RewriteRule ^/?(.*) https://%{SERVER_NAME}/$1 [R,L] 
</VirtualHost>

<VirtualHost *:$PORTS>
  ServerName $DOM
  DocumentRoot "/var/www/pterodactyl/public"

  AllowEncodedSlashes On
  
  php_value upload_max_filesize 100M
  php_value post_max_size 100M

  <Directory "/var/www/pterodactyl/public">
    Require all granted
    AllowOverride all
  </Directory>

  SSLEngine on
  SSLCertificateFile /etc/letsencrypt/live/$DOM/fullchain.pem
  SSLCertificateKeyFile /etc/letsencrypt/live/$DOM/privkey.pem
</VirtualHost> 
EOF
ln -s /etc/apache2/sites-available/pterodactyl.conf /etc/apache2/sites-enabled/pterodactyl.conf
a2enmod ssl
a2enmod rewrite

ufw allow $PORT/tcp
ufw allow $PORT/udp
ufw allow $PORTS/tcp
ufw allow $PORTS/udp

systemctl restart apache2

exit