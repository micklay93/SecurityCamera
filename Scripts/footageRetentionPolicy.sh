while true; do
    oldDate=$(busybox date -D %s -d $(( $(busybox date +%s) - 604800)) '+%YY%mM%dD')
    #oldDate is the date 7 days ago
    echo $oldDate  >> footageDeletionLog.txt ;
    echo "BEFORE DELETE:" >> footageDeletionLog.txt ;
    ls /tmp/sd/record/ >> footageDeletionLog.txt ;
    echo "rm -rf /tmp/sd/record/$oldDate*" >> footageDeletionLog.txt ;
    rm -rf /tmp/sd/record/$oldDate* >> footageDeletionLog.txt ; #Comment this line out to stop it deleting files
    echo "AFTER DELETE:" >> footageDeletionLog.txt ;
    ls /tmp/sd/record/ >> footageDeletionLog.txt ;
    sleep 86400;
done &