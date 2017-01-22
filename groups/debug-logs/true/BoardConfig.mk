ifeq ($(MIXIN_DEBUG_LOGS),true)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.service.default_logfs=apklogfs
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.intel.logger={{logger}}
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += logd.kernel.raw_message={{klogd_raw_message}}
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.intel.logger.rot_cnt={{logger_rot_cnt}}
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.intel.logger.rot_size={{logger_rot_size}}
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/debug-logs
BOARD_SEPOLICY_M4DEFS += module_debug_logs=true
endif
