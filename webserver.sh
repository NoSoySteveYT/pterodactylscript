#!/bin/bash
P1='echo ---------------------------------------------'
P2='echo 0:  volver'
P3='echo 1:  Http'
P4='echo 2:  Https'
P5='echo Opción no válida...'

$P1
$P2
$P3
$P4
$P1

while true; do
    read -p "Opcion: " op
    case $op in
        [0]* ) clear;exit;; 
        [1]* ) clear;sh http.sh;$P1;$P2;$P3;$P4;$P1;;
        [2]* ) clear;sh https.sh;$P1;$P2;$P3;$P4;$P1;;
           * ) clear;$P1;$P5;$P1;sleep 1s;clear;$P1;$P2;$P3;$P4;$P1;;
    esac
done