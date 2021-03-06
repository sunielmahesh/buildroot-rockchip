#!/bin/sh

MKIMAGE=$HOST_DIR/bin/mkimage
BOARD_DIR="$(dirname $0)"

# create fit output image
install -m 0644 -D $BOARD_DIR/kernel.its $BINARIES_DIR
cd $BINARIES_DIR; $MKIMAGE -f kernel.its uImage.itb; cd - > /dev/null

# create bootcmd for initramfs
$MKIMAGE -A arm -O linux -T script -C none -d $BOARD_DIR/boot_initramfs.cmd $BINARIES_DIR/boot_initramfs.scr

# copy spi loader
install -m 0644 -D $BOARD_DIR/rk3399_loader_spinor_v1.15.114.bin $BINARIES_DIR

# create spi idbloader.img
$MKIMAGE -n rk3399 -T rkspi -d $BINARIES_DIR/u-boot-tpl.bin:$BINARIES_DIR/u-boot-spl.bin $BINARIES_DIR/idbloader.img

# create single bootable spi image
#
#       0x0:	idbloader.img
#   0x60000:	u-boot.itb
#  0x3F8000:    env
#  0x3FE000:	uImage.itb
#  0xFFE000:	boot_initramfs.scr
(cd $BINARIES_DIR

  dd if=idbloader.img of=idbloader-pad.img bs=384K conv=sync
  cat idbloader-pad.img u-boot.itb > u-boot-idbloader.img

  dd if=u-boot-idbloader.img of=u-boot-idbloader-pad.img bs=4088K conv=sync
  cat u-boot-idbloader-pad.img uImage.itb > u-boot-uImage.img

  dd if=u-boot-uImage.img of=u-boot-uImage-pad.img bs=16376K conv=sync
  cat u-boot-uImage-pad.img boot_initramfs.scr > roc-rk3399-pc-spinor.img

cd - > /dev/null)
