#!/bin/sh
	# Se sincronizan los datos pendientes de escritura
	sync

	# Inhabilitamos y borramos la cache
	echo 3 > /proc/sys/vm/drop_caches

	# Esperamos
	sleep 3

	# Habilitamos de nuevo la cache
	echo 0 > /proc/sys/vm/drop_caches
exit
