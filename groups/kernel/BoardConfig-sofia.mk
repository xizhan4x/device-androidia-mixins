BOARD_KERNEL_CMDLINE += \
	console=ttyS0,115200n8 \
	idle=halt \
	earlyprintk={{{earlyprintk}}} \
	debug \
	notsc \
	cma=128M \
	nolapic_pm \
	apic=sofia \
	cma={{{cma_size}}}

{{#lapic_timer}}
BOARD_KERNEL_CMDLINE += \
    nolapic_timer \
    x86_intel_xgold_timer=soctimer_only
{{/lapic_timer}}

# Device Tree Blob file name:
BOARD_DTB_FILE ?= {{{board_dtb}}}
