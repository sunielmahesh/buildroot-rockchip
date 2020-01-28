#!/bin/sh

BOARD_DIR="$(dirname $0)"

# create partition layout
support/scripts/genimage.sh -c $BOARD_DIR/genimage.cfg
