#!/bin/bash
HOSTNAME=dev-env
IMAGE_NAME=kwketh/dev-env
TAG=latest
DOCKER=docker
IMAGE=$IMAGE_NAME:$TAG
DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
HASH=$(cat /dev/urandom | head -c 256 | md5 | head -c 8)
if [ -z "$1" ]; then
    MOUNTPOINT=$(pwd)
else
    MOUNTPOINT=$(realpath $1)
fi
docker run -h $HOSTNAME --rm -it -w "/mnt" -v "$MOUNTPOINT:/mnt" $IMAGE

