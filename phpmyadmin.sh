#!/bin/bash
echo
echo '---------- Instalando PhpMyAdmin ----------'
echo
sleep 1s

apt -y install phpmyadmin

mv /usr/share/phpmyadmin /var/www/pterodactyl/public

echo
echo '---------- PhpMyAdmin Instalado ---------'
echo
sleep 1s

echo 'a hora en tu navegador pone tudominio/phpmyadmin'

exit
