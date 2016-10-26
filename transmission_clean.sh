#!/bin/sh

SERVER="127.0.0.1:9091"

TORRENTLIST=`transmission-remote $SERVER --list | sed -e '1d;$d;s/^ *//' | cut --only-delimited --delimiter=" "  --fields=1`

for TORRENTID in $TORRENTLIST
do
    DL_COMPLETED=`transmission-remote $SERVER --torrent $TORRENTID --info | grep "Percent Done: 100%"`

    STATE_STOPPED=`transmission-remote $SERVER --torrent $TORRENTID --info | grep "State: Seeding\|Stopped\|Finished\|Idle"`

    if [ "$DL_COMPLETED" ] && [ "$STATE_STOPPED" ]; then
		# Notify with pushetta
		FILE=`transmission-remote $SERVER --torrent $TORRENTID  --info | grep Name: | cut -d" " -f4`
        ./push.sh Downloaded: $FILE

        transmission-remote $SERVER --torrent $TORRENTID --remove
    fi
done
	# Move to specific directory
	./transmission_move.sh
exit
