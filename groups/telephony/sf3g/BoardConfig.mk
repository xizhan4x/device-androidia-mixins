TARGET_LOAD_MODEM_DATA_EXTRACT := true
TARGET_LOAD_MODEM_SECURE_BLOCK := true
DEVICE_PACKAGE_OVERLAYS += device/intel/common/telephony/overlay_sf3g

BOARD_USE_3G_RPCRIL := true
BOARD_USE_IMC_OEM_TELEPHONY := false

ADDITIONAL_BUILD_PROPERTIES += \
    persist.radio.multisim.config = dsds \
    persist.ril-daemon.disable=dsds \
    ro.telephony.default_network=0,1

BOARD_SEPOLICY_DIRS += device/intel/sepolicy/telephony \
                       device/intel/sepolicy/telephony/sf3g
