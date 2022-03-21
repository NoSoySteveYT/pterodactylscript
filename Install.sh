#!/bin/bash
panel='sh p01.sh'
wings='sh wings.sh'
web='sh webserver.sh'
OPS='sh options.sh'
CERT='sh  Certbots.sh'
PHP='sh phpmyadmin.sh'

EXIT="echo ----------------"
P1='echo ---------------------------------------------'
P2='echo 0:  Salir'
P3='echo 1:  Instalar Pterodactyl Panel'
P4='echo 2:  Continuar Desde...'
P5='echo 3:  Instalar Pterodactyl Wings'
P6='echo 4:	 Configurar WebServer'
P7='echo 5:  Crear certificado ssl'
P8='echo 6:  Instalar PhpMyAdmin'
P9='echo ---------------------------------------------'
P10='echo Opción no válida...'

$P1
$P2
$P3
$P4
$P5
$P6
$P7
$P8
$P9

while true; do
    read -p "Opcion: " op
    case $op in
        [0]* ) clear;$EXIT;echo "Saliendo";$EXIT; exit;; 
        [1]* ) clear;echo "Instalando Pterodactyl Panel";$panel;$P1;$P2;$P3;$P4;$P5;$P6;$P7;$P8;$P9;;
        [2]* ) clear;$OPS;$P1;$P2;$P3;$P4;$P5;$P6;$P7;$P8;;
		[3]* ) clear;$wings;$P1;$P2;$P3;$P4;$P5;$P6;$P7;$P8;$P9;;
		[4]* ) clear;$web;$P1;$P2;$P3;$P4;$P5;$P6;$P7;$P8;$P9;;
        [5]* ) clear;$CERT;$P1;$P2;$P3;$P4;$P5;$P6;$P7;$P8;$P9;;
        [6]* ) clear;$PHP;$P1;$P2;$P3;$P4;$P5;$P6;$P7;$P8;$P9;;
           * ) clear;$P9;sleep 1s;$P1;$P2;$P3;$P4;$P5;$P6;$P7;$P8;$P9;;
    esac
done
