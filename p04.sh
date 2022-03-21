#!/bin/bash
next='sh p05.sh'

echo
echo "------------------------------------------------------"
echo "Ingresa una contraseña para la configuracion de mysql"
echo "asegurate de usar una contraseña que recuerdes"
echo "este paso es irreversible !!!!"
echo "------------------------------------------------------"
echo
sleep 1s
read -p "Contraseña: " PASS
echo "Recuerda guarda tu contraseña"
sleep 5s

mysql -u root -p"1" <<EOF
CREATE USER 'pterodactyl'@'127.0.0.1' IDENTIFIED BY '$PASS';
CREATE DATABASE panel;
GRANT ALL PRIVILEGES ON panel.* TO 'pterodactyl'@'127.0.0.1' WITH GRANT OPTION;
CREATE USER 'pterodactyluser'@'127.0.0.1' IDENTIFIED BY '$PASS';
GRANT ALL PRIVILEGES ON *.* TO 'pterodactyluser'@'127.0.0.1' WITH GRANT OPTION;
EOF
back='/home/mysql_password.txt'
echo "---------- Contraseña guardada en el archivo $back ----------"
sleep 5s
cat << EOF > $back
$PASS
EOF

cat << EOF > /etc/mysql/my.cnf
# The MariaDB configuration file
#
# The MariaDB/MySQL tools read configuration files in the following order:
# 0. "/etc/mysql/my.cnf" symlinks to this file, reason why all the rest is read.
# 1. "/etc/mysql/mariadb.cnf" (this file) to set global defaults,
# 2. "/etc/mysql/conf.d/*.cnf" to set global options.
# 3. "/etc/mysql/mariadb.conf.d/*.cnf" to set MariaDB-only options.
# 4. "~/.my.cnf" to set user-specific options.
#
# If the same option is defined multiple times, the last one will apply.
#
# One can use all long options that the program supports.
# Run program with --help to get a list of available options and with
# --print-defaults to see which it would actually understand and use.
#
# If you are new to MariaDB, check out https://mariadb.com/kb/en/basic-mariadb-articles/

#
# This group is read both by the client and the server
# use it for options that affect everything
#
[client-server]
# Port or socket location where to connect
# port = 3306
socket = /run/mysqld/mysqld.sock

# Import all .cnf files from configuration directory
!includedir /etc/mysql/conf.d/
!includedir /etc/mysql/mariadb.conf.d/

[mysqld]
bind-address=0.0.0.0
EOF

cat << EOF > /etc/alternatives/my.cnf
# The MariaDB configuration file
#
# The MariaDB/MySQL tools read configuration files in the following order:
# 0. "/etc/mysql/my.cnf" symlinks to this file, reason why all the rest is read.
# 1. "/etc/mysql/mariadb.cnf" (this file) to set global defaults,
# 2. "/etc/mysql/conf.d/*.cnf" to set global options.
# 3. "/etc/mysql/mariadb.conf.d/*.cnf" to set MariaDB-only options.
# 4. "~/.my.cnf" to set user-specific options.
#
# If the same option is defined multiple times, the last one will apply.
#
# One can use all long options that the program supports.
# Run program with --help to get a list of available options and with
# --print-defaults to see which it would actually understand and use.
#
# If you are new to MariaDB, check out https://mariadb.com/kb/en/basic-mariadb-articles/

#
# This group is read both by the client and the server
# use it for options that affect everything
#
[client-server]
# Port or socket location where to connect
# port = 3306
socket = /run/mysqld/mysqld.sock

# Import all .cnf files from configuration directory
!includedir /etc/mysql/conf.d/
!includedir /etc/mysql/mariadb.conf.d/

[mysqld]
bind-address=0.0.0.0
EOF
cd /root/Pterodactyl-install-script
$next
exit
