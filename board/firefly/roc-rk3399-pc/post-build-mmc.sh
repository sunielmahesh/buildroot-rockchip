#!/bin/sh

BOARD_DIR="$(dirname $0)"

install -m 0644 -D $BOARD_DIR/grub.cfg $BINARIES_DIR
install -m 0644 -D $BOARD_DIR/bootaa64.efi $BINARIES_DIR/efi/boot/bootaa64.efi
install -m 0644 -D $BINARIES_DIR/rk3399-roc-pc-mezzanine.dtb $BINARIES_DIR/rockchip/rk3399-roc-pc-mezzanine.dtb
