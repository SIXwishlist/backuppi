# BackupPi

_Tu che fai? Non Backuppi?_

I have a RaspberryPI that I use as a network drive. So I am collecting here all the automation I use with this network drive.

BackupPi contains two scripts. One is a file that must be included and configured on the PI. It uses `cron` for managing the disk and providing the weekly and monthly snapshots (and other stuff).

The other file is used by the client to drop the folder in the backup destination. The script just makes ture that the files are in the right place.

## Configuration

You need to set the following env variables:

### Client

 * `BACKUPPI_TARGET_HOST`:  the destination host, ex: `192.168.1.42` or `mybackupdrive` (if configured in `.ssh/config`)
 * `BACKUPPI_TARGET_DIR`: the directory in the server where backups are stored.

 ### Server
 
  * `BACKUPPI_BKP_DIR`:  the directory in the server where backups are stored.