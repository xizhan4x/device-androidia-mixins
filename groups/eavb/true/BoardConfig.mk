# for Open-avb gPTP daemon
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/gptp

# for AVB Streamhandler daemon
BOARD_SEPOLICY_M4DEFS += module_gptp=true
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/avbstreamhandler

# Common CFLAGS for IAS components
#IAS eng and userdebug build variant
ifneq ($(TARGET_BUILD_VARIANT),user)
  IAS_COMMON_CFLAGS := -DENG_DEBUG
else
  IAS_COMMON_CFLAGS :=
endif

TARGET_FS_CONFIG_GEN += device/intel/common/eavb/filesystem_config/config.fs
