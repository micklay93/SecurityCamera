# Yi Outdoor Security Camera

This is a repo used to build custom Yi Outdoor Security Camera


### Uploading Footage To Google Drive

There is a script that is manually put on the camera in the home dir. It is manually triggered `./footageRetentionPolicy.sh` and runs indefinitely. 

Project location:
```
Scripts/footageRetentionPolicy.sh
```

Improvements can be made to add this script to the camera `startup.sh` script, which is executed after the camera has booted up from within the named `yi-hack-v3`
