# Yi Outdoor Security Camera

This is a repo used to build custom Yi Outdoor Security Camera

***

### Uploading Footage To Google Drive

Each Camera has ftp enabled to allow files to be transferred between the Camera and another device. This is controlled via the MagicMirror repo, where there is a script scheduled via crontab to get recent files from the camera.
These files are then uploaded to a Cloud Storage provider such as Google Drive via [rclone](https://rclone.org/drive/).

`0 * * * * /home/pi/Camera/downloadDailyFootage.sh`

`downloadDailyFootage.sh`

```
currentDate=$(date  '+%YY%mM%dD')

cd /home/pi/Camera
wget -m --user root --password <SSH_PASSWORD> ftp://<PRIVATE_CAMERA_IP>//tmp/sd/record/$currentDate*
sleep 10
rclone copy /home/pi/Camera/<PRIVATE_CAMERA_IP>/tmp/sd/record/ GoogleDrive:CCTV/FrontdoorCamera

sleep 5

wget -m --user root --password <SSH_PASSWORD> ftp://<PRIVATE_CAMERA_IP>//tmp/sd/record/$currentDate*
sleep 10
rclone copy /home/pi/Camera/<PRIVATE_CAMERA_IP>/tmp/sd/record/ GoogleDrive:CCTV/DrivewayCamera
```

***

### Deleting Footage On Camera Device

There is a script that is manually put on the camera in the home dir. 
It is manually triggered `./footageRetentionPolicy.sh` and runs indefinitely.

[footageRetentionPolicy.sh script](Scripts/footageRetentionPolicy.sh)

Improvements can be made to add this script to the camera `startup.sh` script, which is executed after the camera has booted up from within the named `yi-hack-v3`
