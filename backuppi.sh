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

if [ $# -ne 1 ]; then
    echo $0: usage: myscript name
    exit 1
fi

if [[ "$PLATFORM" == 'macos' ]]; then
    FOLDER="$(greadlink -f $1)"
elif [[ "$PLATFORM" == 'linux' ]]; then
    FOLDER="$(readlink -f $1)"
else
   echo Unsupported PLATFORM
   exit 1
fi

DEST_NAME="${!BAKUPPI_TARGET_HOST}"
DEST_BKP_DIR="${!BAKUPPI_TARGET_DIR}"

HOST_NAME="$(uname -n)"
HOST_NAME="${HOST_NAME%%.*}" # Remove network info from uname -n

FOLDER_NAME="$(dirname $FOLDER)"
FOLDER_NAME="$(basename $FOLDER_NAME)"

echo rsync -av -n -e ssh --delete $FOLDER $DEST_NAME:$DEST_BKP_DIR/$HOST_NAME/$FOLDER_NAME/daily 