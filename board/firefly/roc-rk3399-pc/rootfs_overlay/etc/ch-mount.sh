#!/bin/sh

function mnt() {
        echo "MOUNTING"
        mount -t proc /proc ${2}proc
        mount -t sysfs /sys ${2}sys
        mount -o bind /dev ${2}dev
        mount -o bind /dev/pts ${2}dev/pts
}

function umnt(){
        echo "UNMOUNTING"
        umount ${2}proc
        umount ${2}sys
        umount ${2}dev/pts
        umount ${2}dev
}

if [ "$1" == "-m" ] && [ -n "$2" ] ;
then
        mnt $1 $2
elif [ "$1" == "-u" ] && [ -n "$2" ];
then
        umnt $1 $2
else
        echo ""
        echo "Either 1'st, 2'nd or both parameters were missing"
        echo ""
        echo "1'st parameter can be one of these: -m(mount) OR -u(umount)"
        echo "2'nd parameter is the full path of rootfs directory(with trailing '/')"
        echo ""
        echo "For example: ch-mount -m /media/sdcard/"
        echo ""
        echo 1st parameter : ${1}
        echo 2nd parameter : ${2}
fi
