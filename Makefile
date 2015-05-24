XENO_DIR = ../xenomai-3
EXTRA_CFLAGS := -I${XENO_DIR}/include/cobalt/kernel \
-I${XENO_DIR}/include/cobalt -I${XENO_DIR}/kernel/cobalt/include \
-I${XENO_DIR}/kernel/cobalt/arch/arm/include -I${XENO_DIR}/include 

ARCH = arm
KERNEL_DIR = ../rpi-linux/build
MODULE_DIR = $(shell pwd)

obj-m += osc-gpio-rtdm.o

.PHONY: all
all:: modules

.PHONY: modules
modules:
	${MAKE} ARCH=${ARCH} CROSS_COMPILE=${CROSS_COMPILE} -C ${KERNEL_DIR} SUBDIRS=${MODULE_DIR}  modules

.PHONY: clean
clean::
	rm -f  *.o  .*.o  .*.o.* *.ko  .*.ko  *.mod.* .*.mod.* .*.cmd *~
	rm -f Module.symvers Module.markers modules.order 
	rm -rf .tmp_versions

