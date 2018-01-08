# BackupPi

_Tu che fai? Non Backuppi?_

I have a RaspberryPI that I use as a network drive. So I am collecting here all the automation I use with this network drive.

BackupPi contains two scripts. One is a file that must be included and configured on the PI. It uses `cron` for managing the disk and providing the weekly and monthly snapshots (and other stuff).

The other file is used by the client to drop the folder in the backup destination. The script just makes ture that the files are in the right place.

