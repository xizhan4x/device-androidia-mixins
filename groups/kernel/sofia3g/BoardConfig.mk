# Specify location of board-specific kernel headers
TARGET_BOARD_KERNEL_HEADERS := device/intel/sofia3g-kernel/kernel-headers

KERNEL_LOGLEVEL ?= 7

BOARD_KERNEL_CMDLINE += \
	loglevel=$(KERNEL_LOGLEVEL) \
	console=ttyS0,115200n8 \
	idle=halt \
	earlyprintk=xgold \
	debug \
	notsc \
	androidboot.hardware=$(TARGET_DEVICE) \
	cma=128M \
	nolapic_pm \
	firmware_class.path=/system/vendor/firmware \
	apic=sofia \


# Device Tree Blob file name:
BOARD_DTB_FILE ?= $[board_dtb]
