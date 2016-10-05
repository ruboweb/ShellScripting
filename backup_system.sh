#!/bin/bash

hoy=$(date +"%Y-%m-%d.%H%M%S")


# no parametros, muestra ayuda
if [ -z $1 ];
then
        echo "Parámentros del script:"
        echo "    -h: Ayuda"
        echo "    -a: Realización de copia de seguridad automática"
        echo "    -m prefijo: Realización de copia de seguridad manual. Requiere un segundo parámetro con el prefijo a concatenar en el nombre de la copia"
exit
fi


# ayuda
if [ $1 = "-h" ];
then
	echo "Parámentros del script:"
        echo "    -h: Ayuda"
        echo "    -a: Realización de copia de seguridad automática"
        echo "    -m prefijo: Realización de copia de seguridad manual. Requiere un segundo parámetro con el prefijo a concatenar en el nombre de la copia"
exit
fi


# copia automatica, sin avance (pv) para poder programarla en el cron
if [ $1 = "-a" ];
then
	bkauto="/media/backups/snapshots/$hoy.server.img.gz"
	dd if=/dev/mmcblk0  bs=1M | gzip > $bkauto
exit
fi


# copia manual, con avance (pv)
if [ $1 = "-m" ];
then
	if [ -z $2 ];
	then
		echo "Falta el prefijo de la copia, por ejemplo: -m instalacion_original"
	exit
	fi

	bkmanual="/media/backups/hitos/$hoy.$2.server.img.gz"
	pv /dev/mmcblk0 | dd bs=1M | gzip > $bkmanual
exit
fi

exit
