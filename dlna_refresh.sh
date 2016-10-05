#!/bin/bash

sudo service minidlna stop && sudo rm -f /var/cache/minidlna/files.db && sudo service minidlna start

exit
