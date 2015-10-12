DEVICE_PACKAGE_OVERLAYS += device/intel/common/telephony/overlay_sflte

ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.tel.hot_swap.support=true \
    persist.ril-daemon.disable=dsds\

BOARD_USE_IMC_OEM_TELEPHONY := false

BOARD_SEPOLICY_DIRS += device/intel/sepolicy/telephony \
                       device/intel/sepolicy/telephony/sflte

{{#ril_iosm}}
# Enable -RIL_IOSM_ENABLED
RIL_IOSM_ENABLED := true
{{/ril_iosm}}
