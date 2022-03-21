#!/bin/bash
EXIT='echo ----------------'
P1='echo ---------------------------------------------'
P2='echo 0: Volver'
P3='echo A: Instalar Dependencias'
P4='echo B: Instalar Composer'
P5='echo C: Descargar Archivos'
P6='echo D: Configuración de MySQL'
P7='echo E: Instalando'
P8='echo F: Configuración de entorno'
P9='echo G: Migrar Tablas'
P10='echo H: Crear usuario para el panel'
P11='echo I: Añadiendo Permisos'
P12='echo J: Configuración de contrab'
P13='echo K: Creacion de pteroq.service'
P14='echo Opción no válida...'

$P1
$P2
$P3
$P4
$P5
$P6
$P7
$P8
$P9
$P10
$P11
$P12
$P13
$P1

while true; do
    read -p "Opcion: " op
    case $op in
        [0]* ) 	clear;exit;; 
        [Aa]* ) 	clear;sh p01.sh;$P1;$P2;$P3;$P4;$P5;$P6;$P7;$P8;$P9;$P10;$P11;$P12;$P13;$P1;;
        [Bb]* ) 	clear;sh p02.sh;$P1;$P2;$P3;$P4;$P5;$P6;$P7;$P8;$P9;$P10;$P11;$P12;$P13;$P1;;
        [Cc]* ) 	clear;sh p03.sh;$P1;$P2;$P3;$P4;$P5;$P6;$P7;$P8;$P9;$P10;$P11;$P12;$P13;$P1;;
		[Dd]* ) 	clear;sh p04.sh;$P1;$P2;$P3;$P4;$P5;$P6;$P7;$P8;$P9;$P10;$P11;$P12;$P13;$P1;;
		[Ee]* ) 	clear;sh p05.sh;$P1;$P2;$P3;$P4;$P5;$P6;$P7;$P8;$P9;$P10;$P11;$P12;$P13;$P1;;
		[Ff]* ) 	clear;sh p06.sh;$P1;$P2;$P3;$P4;$P5;$P6;$P7;$P8;$P9;$P10;$P11;$P12;$P13;$P1;;
		[Gg]* ) 	clear;sh p07.sh;$P1;$P2;$P3;$P4;$P5;$P6;$P7;$P8;$P9;$P10;$P11;$P12;$P13;$P1;;
		[Hh]* ) 	clear;sh p08.sh;$P1;$P2;$P3;$P4;$P5;$P6;$P7;$P8;$P9;$P10;$P11;$P12;$P13;$P1;;
		[Ii]* ) 	clear;sh p09.sh;$P1;$P2;$P3;$P4;$P5;$P6;$P7;$P8;$P9;$P10;$P11;$P12;$P13;$P1;;
		[Jj]* ) 	clear;sh p10.sh;$P1;$P2;$P3;$P4;$P5;$P6;$P7;$P8;$P9;$P10;$P11;$P12;$P13;$P1;;
		[Kk]* ) 	clear;sh p11.sh;$P1;$P2;$P3;$P4;$P5;$P6;$P7;$P8;$P9;$P10;$P11;$P12;$P13;$P1;;
        * ) 		clear;$P14;sleep 1s;$P1;$P2;$P3;$P4;$P5;$P6;$P7;$P8;$P9;$P10;$P11;$P12;$P13;$P1;;
    esac
done
