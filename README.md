# Scripts
Some Unix Scripts to automatize tasks




## backup_system.sh
It allows you to automate backups.

### Execute
**Automatic backups** The script sets the current date and time of the system and generates a file of the like: 'yyyymmddhhmm.server.img.gz'
```sh
$ sudo ./backup_system.sh -a
```

**Manual backups** The script asks a prefix to concatenate the name of the file to generate: 'yyyymmddhhmm.prefix.server.img.gz'
```sh
$ sudo ./backup_system.sh -m first_install
```

### Configure
The script requires adapting path routes. See lines:
* 31
* 46

In the following lines the script references /dev/mmcblk0 . Adapt to your system.
* 32
* 47



## dlna_refresh.sh
Deletes the database server and the reindexing minidlna again.

### Execute
```sh
$ sudo ./dlna_refresh.sh
```

It can be automated by including it as a cron task.





## maintenance.sh
Automatice maintenance tasks

### Execute
```sh
$ sudo ./maintenance.sh [OPTIONS]
```
[OPTIONS]:
* f : Copy configuration files
* c : Copy cron files
* h : Package /home 
* s : Package /usr/scripts
* w : Packageo /www
* b : Backup SD card
* v : Clean /.watch
* n : Notify

### Configure
Adapt paths to your system and add all the tasks you need. Then confiure your cron, to automatice. For example:
```sh
$ crontab -e

0 5 * * SUM sudo ./maintenance.sh chswvn
0 2 1 * *   sudo ./maintenance.sh fbn
```

## push.sh
Send push notification to http://www.pushetta.com/

### Execute
```sh
$ sudo ./push.sh message to send
```

### Configure
The script requires set two variables:

> token: Pushetta account

> channel: Name of the channel to notify

> expire: Number of days to expire. Default 2 days



## transmission_clean.sh
Deletes torrents once they have been downloaded to 100%.

### Execute
To be run automatically you need to edit the configuration file transmission (before editing the file should stop the demon of transmission. Then edit the file and finally start it again).
```sh
$ sudo nano /etc/transmission-daemon/settings.json
```

Edit next lines:

> "script-torrent-done-enabled": true,

> "script-torrent-done-filename": "/usr/scripts/transmission_clean.sh",


### Configure
Optionally, can configure path to:
> pushetta.sh

> transmission_move.sh


## transmission_move.sh
Move downloaded files to specific directories, by type: Films or Series. The script create directories for the Series.

### Execute
```sh
$ sudo ./transmission_move.sh
```

Create cron task or execute this script from 'transmission_clean.sh'

### Configure
The script requires set two variables:

> dwn_dir: Generic directory to download files

> series_dir: Specific directory to Series

> film_dir: Specific directory to Films


### Improvements
* Can modify to add more extensions files or add more specific directories, for example documentals, ...
