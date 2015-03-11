BOARD_SEPOLICY_DIRS += device/intel/common/sepolicy/telemetry

# Please keep this list in alphabetical order.
BOARD_SEPOLICY_UNION += \
	file_contexts \
	file.te \
	netd.te \
	property_contexts \
	property.te \
	telemetry.te \
        vold.te
