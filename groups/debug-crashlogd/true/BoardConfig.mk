ifeq ($(MIXIN_DEBUG_LOGS),true)
ADDITIONAL_DEFAULT_PROPERTIES += persist.crashlogd.data_quota=50
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/crashlogd

CRASHLOGD_LOGS_PATH := "/data/logs"
CRASHLOGD_APLOG := true
CRASHLOGD_FULL_REPORT := true
CRASHLOGD_MODULE_MODEM ?= true
{{#binder}}
CRASHLOGD_MODULE_BINDER := {{{binder}}}
{{/binder}}
{{#btdump}}
CRASHLOGD_MODULE_BTDUMP := {{{btdump}}}
{{/btdump}}
CRASHLOGD_USE_SD := false
{{#arch}}
CRASHLOGD_ARCH := {{{arch}}}
{{/arch}}
endif
