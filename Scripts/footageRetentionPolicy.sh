#!/bin/sh

echo "STARTING footageDeletionPolicy.sh" >> ~/footageDeletionLog.txt;

while true; do
    sleep 86400;
    echo "DELETING FILES OLDER THAN 3 DAYS" >> ~/footageDeletionLog.txt;
    find /tmp/sd/record/* -mtime +3;
    find /tmp/sd/record/* -mtime +3 -exec rm {} \;
    echo "COMPLETED" >> ~/footageDeletionLog.txt;
done &
