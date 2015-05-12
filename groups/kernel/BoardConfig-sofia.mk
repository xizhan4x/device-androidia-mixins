BOARD_KERNEL_CMDLINE += \
	console=ttyS0,115200n8 \
	idle=halt \
	earlyprintk={{{earlyprintk}}} \
	debug \
	notsc \
	cma=128M \
	nolapic_pm \
	apic=sofia \
	cma={{{cma_size}}} \
    nolapic_timer \
    x86_intel_xgold_timer=lapic_and_soctimer

# Device Tree Blob file name:
BOARD_DTB_FILE ?= {{{board_dtb}}}
