#!/sbin/busybox sh

CACHE=$(/sbin/busybox blkid /dev/block/mmcblk0p35 | /sbin/busybox grep "f2fs" | /sbin/busybox wc -l)

if [ "${CACHE}" -eq "1" ]; then
	mount -t f2fs -o noatime,nosuid,nodev,discard,nodiratime,inline_xattr,inline_data /dev/block/platform/msm_sdcc.1/by-name/cache /cache
else
	mount -t ext4 -o noatime,nosuid,nodev,barrier=1,noauto_da_alloc,errors=continue /dev/block/platform/msm_sdcc.1/by-name/cache /cache
fi;
