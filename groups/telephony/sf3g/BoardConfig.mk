TARGET_LOAD_MODEM_DATA_EXTRACT := true
TARGET_LOAD_MODEM_SECURE_BLOCK := true
DEVICE_PACKAGE_OVERLAYS += device/intel/common/telephony/overlay_sf3g

ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.radio.multisim.config = dsds \
    persist.tel.hot_swap.support=true \
    persist.ril-daemon.disable=dsds

