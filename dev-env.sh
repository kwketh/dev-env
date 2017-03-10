#!/bin/bash
HOSTNAME=dev-env
IMAGE_NAME=kwketh/dev-env
TAG=latest
DOCKER=docker
IMAGE=$IMAGE_NAME:$TAG
WORKDIR=$1
SESSIONID=$(cat /dev/urandom | head -c 256 | md5sum | head -c 8)
MOUNTFLAGS=""

# Set default flags
readonly='false'
mutable='false'

# Parse flags
while getopts 'rm' flag; do
  case "${flag}" in
    r) readonly='true'; WORKDIR=$2 ;;
    m) if [ "$readonly" = "true" ]; then
         mutable=true
       else
         echo "error: mutable option can only be used in read-only mode."
         exit
       fi
       ;;
  esac
done

# Convert work directory to full absolute path
if [ -z "$WORKDIR" ]; then
    WORKDIR=$(pwd)
else
    WORKDIR=$(realpath $WORKDIR)
fi

DIRNAME=$(basename $WORKDIR)

if [ "$readonly" = "true" ]; then
    echo "dev-env: running in read-only mode."
    MOUNTFLAGS=":ro"
fi

if [ "$mutable" = "true" ]; then
    SESSIONDIR="$HOME/.tmp_$SESSIONID"
    echo "         (files are mutable but will be discarded)"
    rsync -a $WORKDIR/ $SESSIONDIR
    WORKDIR="$SESSIONDIR"
    MOUNTFLAGS=""
fi

docker run -h $HOSTNAME --rm -it -w "/workspace/$DIRNAME" -v "$WORKDIR:/workspace/$DIRNAME$MOUNTFLAGS" -p 8081:8081 $IMAGE

if [ "$mutable" = "true" ]; then
    echo "discarding temporary files."
    rm -rf "$SESSIONDIR"
fi

