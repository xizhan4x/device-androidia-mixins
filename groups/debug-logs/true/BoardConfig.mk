ifeq ($(MIXIN_DEBUG_LOGS),true)
ADDITIONAL_DEFAULT_PROPERTIES += ro.service.default_logfs=apklogfs
ADDITIONAL_DEFAULT_PROPERTIES += ro.intel.logger={{logger}}
ADDITIONAL_DEFAULT_PROPERTIES += logd.kernel.raw_message={{klogd_raw_message}}
ADDITIONAL_DEFAULT_PROPERTIES += persist.intel.logger.rot_cnt={{logger_rot_cnt}}
ADDITIONAL_DEFAULT_PROPERTIES += persist.intel.logger.rot_size={{logger_rot_size}}
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/debug-logs
BOARD_SEPOLICY_M4DEFS += module_debug_logs=true
endif
