# for Open-avb gPTP daemon
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/gptp

# for UFIPC CommonAPI Runtime
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/ufipc

# for AVB Streamhandler daemon
# BOARD_SEPOLICY_M4DEFS += module_gptp=true
# BOARD_SEPOLICY_DIRS += device/intel/sepolicy/avbstreamhandler

# SmartX module Properties
smxelements := CFG SMX EVT RZN AHD MDL SXC SHM SMW RB DP DBG TST SMJ

# Common CFLAGS for IAS components
#IAS eng and userdebug build variant
ifneq ($(TARGET_BUILD_VARIANT),user)
  IAS_COMMON_CFLAGS := -DENG_DEBUG
else
  IAS_COMMON_CFLAGS :=
endif
