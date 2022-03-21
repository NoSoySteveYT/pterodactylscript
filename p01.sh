next='sh p02.sh'
echo
echo '---------- Añadiendo repositorios ----------'
echo
sleep 1s

apt -y install software-properties-common curl apt-transport-https ca-certificates gnupg
LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
add-apt-repository -y ppa:chris-lea/redis-server
curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash

apt update
apt-add-repository universe

echo
echo '---------- Instalando Dependencias ----------'
echo
sleep 1s

apt -y install php8.0 
apt -y install php8.0-cli
apt -y install php8.0-gd
apt -y install php8.0-mysql
apt -y install php8.0-pdo
apt -y install php8.0-mbstring
apt -y install php8.0-tokenizer
apt -y install php8.0-bcmath
apt -y install php8.0-xml
apt -y install php8.0-fpm
apt -y install php8.0-curl
apt -y install php8.0-zip
apt -y install mariadb-server 
apt -y install nginx 
apt -y install tar 
apt -y install unzip 
apt -y install git 
apt -y install redis-server
cd /root/Pterodactyl-install-script
$next
exit
