#PTEST mode sepolicy dir for eng and userdebug builds
ifneq ($(TARGET_BUILD_VARIANT),user)
    BOARD_SEPOLICY_DIRS += device/intel/sepolicy/ptest/sofialte
endif
