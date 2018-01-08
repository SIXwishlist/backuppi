#!/bin/bash

PLATFORM='unknown'
UNAMESTR="$(uname)"
if [[ "$UNAMESTR" == 'Linux' ]]; then
    PLATFORM='linux'
elif [[ "$UNAMESTR" == 'FreeBSD' ]]; then
    PLATFORM='freebsd'
elif [[ "$UNAMESTR" == 'Darwin' ]]; then
    PLATFORM='macos'
fi

if (( $# < 1 )); then
    echo $0: usage: myscript name
    exit 1
fi

DRY=""
if (( $# >= 2 )); then
    if [[ $2 == "--dry" ]]; then  
        echo "Running a Dry Run"
        DRY="-n"
    fi
fi

if [[ "$PLATFORM" == 'macos' ]]; then
    FOLDER="$(greadlink -f $1)"
elif [[ "$PLATFORM" == 'linux' ]]; then
    FOLDER="$(readlink -f $1)"
else
   echo Unsupported PLATFORM
   exit 1
fi

DEST_NAME=$BACKUPPI_TARGET_HOST
DEST_BKP_DIR=$BACKUPPI_TARGET_DIR

echo $DEST_BKP_DIR

HOST_NAME="$(uname -n)"
HOST_NAME="${HOST_NAME%%.*}" # Remove network info from uname -n

FOLDER_NAME="$(basename $FOLDER)"

if [[ "$DRY" != "" ]]; then
    echo "Backup with the following commands"
    echo
    echo rsync -av -e ssh --delete $FOLDER $DEST_NAME:$DEST_BKP_DIR/$HOST_NAME/$FOLDER_NAME/daily 
else
    rsync -av -e ssh --delete $FOLDER $DEST_NAME:$DEST_BKP_DIR/$HOST_NAME/$FOLDER_NAME/daily 
fi