#!/bin/bash
	
	# maintenance.sh [OPTIONS]
	#	> f : Copy configuration files
	#	> c : Copy cron files
	#	> h : Package /home 
	#	> s : Package /usr/scripts
	#	> w : Packageo /www
	#	> b : Backup SD card
	#	> v : Clean /.watch
	#	> n : Notify
	
	
	
	# Copy configuration files
	# --------------------------------------------------------------------	
	if [[ $1 == *"f"* ]];
	then
		# Baner ssh
		cp /etc/issue.net /media/backups/cfgfiles/issue.net

		# DHCPCD
		cp /etc/dhcpcd.conf /media/backups/cfgfiles/dhcpcd.conf
		cp /etc/dhcpcd.conf.bak /media/backups/cfgfiles/dhcpcd.conf.bak

		# ssh
		cp /etc/ssh/sshd_config /media/backups/cfgfiles/sshd_config
		cp /etc/ssh/sshd_config.bak /media/backups/cfgfiles/sshd_config.bak

		# fail2ban
		cp /etc/fail2ban/jail.conf /media/backups/cfgfiles/jail.conf
		cp /etc/fail2ban/jail.conf.bak /media/backups/cfgfiles/jail.conf.bak

		# fstab
		cp /etc/fstab /media/backups/cfgfiles/fstab
		cp /etc/fstab.bak /media/backups/cfgfiles/fstab.bak

		# trasnsmission
		cp /etc/transmission-daemon/settings.json /media/backups/cfgfiles/settings.json
		cp /etc/transmission-daemon/settings.json.bak /media/backups/cfgfiles/settings.json.bak

		# plex
		cp /etc/default/plexmediaserver /media/backups/cfgfiles/plexmediaserver
		cp /etc/default/plexmediaserver.bak /media/backups/cfgfiles/plexmediaserver.bak

		# raspberry
		cp /boot/cmdline.txt /media/backups/cfgfiles/cmdline.txt
		cp /boot/cmdline.txt.bak /media/backups/cfgfiles/cmdline.txt.bak

		# lighttp
		cp /etc/lighttpd/lighttpd.conf /media/backups/cfgfiles/lighttpd.conf
		cp /etc/lighttpd/lighttpd.conf.bak /media/backups/cfgfiles/lighttpd.conf.bak	
	fi
	


	# Copy cron files
	# --------------------------------------------------------------------
	if [[ $1 == *"c"* ]];
	then
		crontab -l > /media/backups/cron/root
		crontab -l -u pi > /media/backups/cron/pi
	fi

	
	
	# Package /home 
	# --------------------------------------------------------------------
	if [[ $1 == *"h"* ]];
	then
		tar czf /media/backups/home/pi.tar.gz /home/pi/ 2> /dev/null
	fi

	
	
	# Package /usr/scripts
	# --------------------------------------------------------------------
	if [[ $1 == *"s"* ]];
	then
		tar czf /media/backups/scripts/scripts.tar.gz /usr/scripts 2> /dev/null
	fi

	
	
	# Package /www 
	# --------------------------------------------------------------------
	if [[ $1 == *"w"* ]];
	then	
		tar czf /media/backups/www/www.tar.gz /server/www/ 2> /dev/null
	fi

	
	
	# Backup SD card
	# --------------------------------------------------------------------
	if [[ $1 == *"b"* ]];
	then
		dd if=/dev/mmcblk0p1 bs=4M | gzip > /media/backups/sd/mmcblk0p1.image.gz
		dd if=/dev/mmcblk0p2 bs=4M | gzip > /media/backups/sd/mmcblk0p2.image.gz
	fi
	
	# Restore
	# gunzip --stdout raspbian.image.gz | sudo dd bs=4M of=/dev/mmcblk0p1

	
	
	# Clean /.watch
	# --------------------------------------------------------------------
	if [[ $1 == *"v"* ]];
	then
		rm -r /server/.watch/*.torrent.added 2> /dev/null
	fi
	
	
	
	# Notify
	# --------------------------------------------------------------------
	if [[ $1 == *"n"* ]];
	then
		/usr/scripts/./push.sh Maintenance done. Options: $1
	fi
exit
