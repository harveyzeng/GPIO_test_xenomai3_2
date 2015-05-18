EXTRA_CFLAGS := -I/home/harvey/workspace/xenomai-3/include  -I/home/harvey/workspace/xenomai-3/kernel/cobalt/include -I/home/harvey/workspace/xenomai-3/kernel/cobalt/arch/arm/include

ARCH = arm
CROSS_COMPILE = /home/harvey/workspace/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin/arm-linux-gnueabihf-
KERNEL_DIR = /home/harvey/workspace/rpi-kernel
MODULE_DIR = $(shell pwd)

obj-m += oscillateur-gpio-rtdm.o

.PHONY: all
all:: modules

.PHONY: modules
modules:
	${MAKE} ARCH=${ARCH} CROSS_COMPILE=${CROSS_COMPILE} -C ${KERNEL_DIR} SUBDIRS=${MODULE_DIR}  modules

XENOCONFIG=/home/harvey/workspace/xenomai-3/dist/usr/xenomai/bin/xeno-config
.PHONY: clean
clean::
	rm -f  *.o  .*.o  .*.o.* *.ko  .*.ko  *.mod.* .*.mod.* .*.cmd *~
	rm -f Module.symvers Module.markers modules.order 
	rm -rf .tmp_versions

