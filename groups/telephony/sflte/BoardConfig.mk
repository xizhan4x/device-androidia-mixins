DEVICE_PACKAGE_OVERLAYS += device/intel/common/telephony/overlay_sflte

ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.tel.hot_swap.support=true \
    persist.ril-daemon.disable=dsds\

BOARD_USE_IMC_OEM_TELEPHONY := false
