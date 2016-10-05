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

### Improvements
* Notify when download is complete (pushetta?).
