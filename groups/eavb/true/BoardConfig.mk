# for Open-avb gPTP daemon
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/gptp

# for UFIPC CommonAPI Runtime
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/ufipc

# for AVB Streamhandler daemon
BOARD_SEPOLICY_M4DEFS += module_gptp=true
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/avbstreamhandler

# for AVB and GPTP services
ADDITIONAL_BUILD_PROPERTIES += persist.eavb.mode=m

# for gPTP service in automotive profile or not
ADDITIONAL_BUILD_PROPERTIES += persist.gptp.automotive_profile={{automotive_profile}}

# SmartX module Properties
smxelements := CFG SMX EVT RZN AHD MDL SXC SHM SMW RB DP DBG TST SMJ

ADDITIONAL_BUILD_PROPERTIES += \
       $(foreach item, $(smxelements),persist.media.smartx.$(item)log=3)

# Common CFLAGS for IAS components
#IAS eng and userdebug build variant
ifneq ($(TARGET_BUILD_VARIANT),user)
  IAS_COMMON_CFLAGS := -DENG_DEBUG
else
  IAS_COMMON_CFLAGS :=
endif
