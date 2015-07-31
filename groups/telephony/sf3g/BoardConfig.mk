TARGET_LOAD_MODEM_DATA_EXTRACT := true
TARGET_LOAD_MODEM_SECURE_BLOCK := true
DEVICE_PACKAGE_OVERLAYS += device/intel/common/telephony/overlay_sf3g

BOARD_USE_3G_RPCRIL := true
BOARD_USE_IMC_OEM_TELEPHONY := true

ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.radio.multisim.config = dsds \
    persist.tel.hot_swap.support=true \
    persist.ril-daemon.disable=dsds \
    ro.telephony.default_network=0,1

BOARD_SEPOLICY_DIRS += device/intel/sepolicy/telephony/sf3g
