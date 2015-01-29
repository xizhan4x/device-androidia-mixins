BOARD_KERNEL_CMDLINE += \
	console=ttyS0,115200n8 \
	idle=halt \
	earlyprintk=xgold \
	debug \
	notsc \
	cma=128M \
	nolapic_pm \
	apic=sofia \

# Device Tree Blob file name:
BOARD_DTB_FILE ?= $[board_dtb]
