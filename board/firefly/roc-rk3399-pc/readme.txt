Libre Computer Board ROC-RK3399-PC
===================================

ROC-RK3399-PC is highest performance platforms leveraging the popular
Rockchip RK3399 SoC from Firefly and Libretech.

Wiki link:
https://wiki.amarulasolutions.com/bsp/rockchip/rk3399/roc-rk3399-pc.html

Write SPI Flash
===============

There are several ways to build and flash the distributions to external storage devices
like SD, eMMC, USB, SATA. Since the ROC-RK3399-PC has inbuilt SPI Flash, we use this
flash boot with minimal rootfs and install distributions on supported external storage
devices on board.

Build:

  $ make roc_pc_rk3399_spi_defconfig
  $ make

Prerequisites:

  1. Power off the board.
  2. Remove any bootable storage media like SD, eMMC module.
    (Or plug it and make sure it doesn't have bootable images)
  3. Plug the USB Type-C cable to Type-C 1 port on ROC-RK3399-PC.
  4. Plug the Debug port with board
  5. Open minicom with 1500000 8N1
  6. Power on the board. 

Mask ROM mode:

  lsusb command on host pc should show

  Bus 001 Device 020: ID 2207:330c Fuzhou Rockchip Electronics Company RK3399 in Mask ROM mode

If mask rom mode doesn't appear, then:

  1. Check Prerequisites steps or
  2. Close SPI CLK and GND pins of J16.

Program SPI Flash:

  $ export PATH=./output/host/bin:$PATH
  $ rkdeveloptool ld
  $ rkdeveloptool db ./output/images/rk3399_loader_spinor_v1.15.114.bin
  $ rkdeveloptool wl 0 ./output/images/roc-rk3399-pc-spinor.img
  $ rkdeveloptool rd

--
Jagan Teki <jagan@amarulasolutions.com>
29-Jun-2018
