BOARD_SEPOLICY_DIRS += device/intel/sepolicy/intel_prop

ifneq ($(TARGET_UEFI_ARCH),)
INTEL_PROP_LIBDMI := true
endif

