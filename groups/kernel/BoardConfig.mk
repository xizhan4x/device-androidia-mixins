# Specify location of board-specific kernel headers
TARGET_BOARD_KERNEL_HEADERS := {{{path}}}/kernel-headers

KERNEL_LOGLEVEL ?= {{{loglevel}}}

BOARD_KERNEL_CMDLINE += \
        loglevel=$(KERNEL_LOGLEVEL) \
        androidboot.hardware=$(TARGET_DEVICE)\
        firmware_class.path=/system/etc/firmware
{{#boot_boost}}

BOARD_KERNEL_CMDLINE += \
        bootboost=1
{{/boot_boost}}

{{#pmsuspend_debug}}
BOARD_KERNEL_CMDLINE += \
        pm_suspend_debug=1
{{/pmsuspend_debug}}
{{#memory_hole}}
BOARD_KERNEL_CMDLINE += \
        memmap=4M\$$0x5c400000
{{/memory_hole}}
{{#interactive_governor}}
BOARD_KERNEL_CMDLINE += \
	intel_pstate=disable
{{/interactive_governor}}
{{#relative_sleepstates}}

BOARD_KERNEL_CMDLINE += \
        relative_sleep_states=1
{{/relative_sleepstates}}

