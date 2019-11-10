#!/bin/zsh
start=$(cat /sys/block/mmcblk0/mmcblk0p2/start)
end=$(($start+$(cat /sys/block/mmcblk0/mmcblk0p2/size)))
newend=$(($(cat /sys/block/mmcblk0/size)-8))

if [ "$newend" -gt "$end" ]
then
    parted -s /dev/mmcblk0 unit s resize 2 $start $newend
    resize2fs /dev/mmcblk0p2
fi