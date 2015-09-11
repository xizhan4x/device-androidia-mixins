ifeq ($(MIXIN_DEBUG_LOGS),true)
ADDITIONAL_DEFAULT_PROPERTIES += persist.service.apklogfs.enable=1
ADDITIONAL_DEFAULT_PROPERTIES += ro.intel.logger={{logger}}
ADDITIONAL_DEFAULT_PROPERTIES += persist.intel.logger.rot_cnt={{logger_rot_cnt}}
ADDITIONAL_DEFAULT_PROPERTIES += persist.intel.logger.rot_size={{logger_rot_size}}
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/debug-logs
endif
