ifeq ($(MIXIN_DEBUG_LOGS),true)
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/crashlogd
BOARD_SEPOLICY_M4DEFS += module_debug_crashlogd=true
endif
