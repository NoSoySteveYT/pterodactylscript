#!/bin/bash
cd /var/www/pterodactyl
next='sh p11.sh'

echo
echo '---------- Configuracion de Crontab ----------'
echo
sleep 1s

line="* * * * * php /var/www/pterodactyl/artisan schedule:run >> /dev/null 2>&1"
(crontab -u $(whoami) -l; echo "$line" ) | crontab -u $(whoami) -
cd /root/Pterodactyl-install-script
echo
echo '---------- Verfique que la linea no este duplicada ----------'
echo '---------- si es asi borre la linea duplicada y guarde ----------'
echo 
sleep 5s
crontab -e
cd /root/Pterodactyl-install-script 
$next
exit
