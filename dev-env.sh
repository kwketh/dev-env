#!/bin/bash
HOSTNAME=dev-env
IMAGE_NAME=kwketh/dev-env
TAG=latest
DOCKER=docker
IMAGE=$IMAGE_NAME:$TAG
if [ -z "$1" ]; then
    MOUNTPOINT=$(pwd)
else
    MOUNTPOINT=$(realpath $1)
fi
docker run -h $HOSTNAME --rm -it -w "/mnt" -v "$MOUNTPOINT:/mnt" $IMAGE

