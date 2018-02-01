#!/bin/bash
# Server demon application for Backuppi
#
# It automatically scan the backup folder performing weekly and monthly
# snapshots. It also upload the monthly snapshot online (if needed)

BKP_DIR=$BACKUPPI_BKP_DIR

echo "Scan $BKP_DIR"

for host in $(find $BKP_DIR -maxdepth 1 -type d)
do
    echo "HOST" $host
    for dest in $(find $host -maxdepth 1 -type d)
    do
        echo "SUB FOLDER" $dest
        echo rsync –av --delete $dest/daily $dest/weekly
    done
done

