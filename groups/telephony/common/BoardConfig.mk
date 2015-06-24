# BoardConfig.mk common to all platforms with Telephony

# Config flags
BOARD_HAVE_MODEM := true
BOARD_HAVE_ATPROXY := true
# crashlogd configuration
CRASHLOGD_MODULE_MODEM ?= true
# Set the list of supported modem families
# This parameter comes from mixin group instantiation in the device definition
BOARD_MODEM_LIST := {{{modems}}}

# System Properties
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.ril-daemon.disable=0 \
    rild.libpath=librapid-ril-core.so \
    ro.telephony.default_network=9 \
    sys.mdmcli.jarPath=/system/framework/com.intel.internal.telephony.MmgrClient.jar \
    sys.mdmcli.className=com.intel.internal.telephony.mmgr.MmgrModemStatusMonitor \
    persist.tel.hot_swap.support=true

# Telephony common overlay folder
DEVICE_PACKAGE_OVERLAYS += device/intel/common/telephony/overlay_data

BOARD_SEPOLICY_DIRS += device/intel/common/sepolicy/telephony

# Please keep this list in alphabetical order.
BOARD_SEPOLICY_UNION +=\
	atproxy.te \
	efiprop.te \
	cg2k.te \
	file_contexts \
	file.te \
	gpsd.te \
	mediaserver.te \
	mmgr.te \
	mts.te \
	netd.te \
	nvm_server.te \
	power_hal_helper.te \
	property.te \
	property_contexts \
	radio.te \
	rild.te \
	service_contexts \
	service_manager.te \
	shell.te \
	system_app.te \
	system_server.te

