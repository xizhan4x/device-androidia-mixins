BOARD_SEPOLICY_DIRS += device/intel/common/sepolicy/telemetry

# Please keep this list in alphabetical order.
BOARD_SEPOLICY_UNION += \
	file_contexts \
	file.te \
	keys.conf \
	mac_permissions.xml \
	netd.te \
	property_contexts \
	property.te \
	seapp_contexts \
	telemetry.te \
	vold.te
