BOARD_SEPOLICY_UNION += \
	intel_prop.te

ifneq ($(TARGET_UEFI_ARCH),)
INTEL_PROP_LIBDMI := true
endif

