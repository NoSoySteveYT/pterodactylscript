#!/bin/bash
P1='echo ---------------------------------------------'
P2='echo 0:  volver'
P3='echo 1:  Wings AMD64'
P4='echo 2:  Wings ARM64 AARCH64'
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
        [1]* ) clear;sh wings_amd64.sh;$P1;$P2;$P3;$P4;$P1;;
        [2]* ) clear;sh wings_arm64_aarch64.sh;$P1;$P2;$P3;$P4;$P1;;
           * ) clear;$P1;$P5;$P1;sleep 1s;clear;$P1;$P2;$P3;$P4;$P1;;
    esac
done
