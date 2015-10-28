BOARD_KERNEL_CMDLINE += \
	idle=halt \
	debug \
	nolapic_pm \
	apic=sofia \
	cma={{{cma_size}}} \
	slub_max_order=0

ifneq (,$(filter eng userdebug,$(TARGET_BUILD_VARIANT)))
BOARD_KERNEL_CMDLINE += \
	console=tdcons \
	console=ttyS0,115200n8 \
	earlyprintk={{{earlyprintk}}}
endif # TARGET_BUILD_VARIANT is eng, userdebug

# Device Tree Blob file name:
BOARD_DTB_FILE ?= {{{board_dtb}}}

YOCTO_TOOLCHAIN_REQUIRED_VERSION := 1.6
