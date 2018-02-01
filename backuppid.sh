#!/bin/bash
# Server demon application for Backuppi
#
# It automatically scan the backup folder performing weekly and monthly
# snapshots. It also upload the monthly snapshot online (if needed)

BKP_DIR=$BACKUPPI_BKP_DIR

echo "Scan $BKP_DIR"

for host in $(ls -d $BKP_DIR/*)
do
    echo $host
done

