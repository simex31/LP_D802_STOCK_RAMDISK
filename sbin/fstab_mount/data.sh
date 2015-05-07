#!/sbin/busybox sh

DATA=$(/sbin/busybox blkid /dev/block/mmcblk0p38 | /sbin/busybox grep "f2fs" | /sbin/busybox wc -l)

if [ "${DATA}" -eq "1" ]; then
	mount -t f2fs -o noatime,nosuid,nodev,discard,nodiratime,inline_xattr,inline_data /dev/block/platform/msm_sdcc.1/by-name/userdata /data
else
	mount -t ext4 -o nosuid,nodev,barrier=1,noatime,noauto_da_alloc,errors=continue /dev/block/platform/msm_sdcc.1/by-name/userdata /data
fi;
