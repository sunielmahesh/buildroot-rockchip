setenv bootargs earlycon=uart8250,mmio32,0xff1a0000 root=/dev/ram rootwait rw

sf read $kernel_addr_r 0x142000 0xe00000
bootm $kernel_addr_r
