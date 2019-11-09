#!/bin/bash
set -x

DOCKER_IMAGE="csw-mobot/buildroot"

docker images | grep $DOCKER_IMAGE || docker build -t $DOCKER_IMAGE .

TARGET=${1:-"mobot-rpi0w_defconfig"}

mkdir -p ./output
CMD="docker run -ti --rm \
    -v $(pwd)/output:/opt/output \
    -v $(pwd)/:/opt/input \
    $DOCKER_IMAGE"

$CMD make O=/opt/output BR2_EXTERNAL=/opt/input/ $TARGET
$CMD make O=/opt/output BR2_EXTERNAL=/opt/input/
