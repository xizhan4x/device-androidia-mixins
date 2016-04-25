# Se policies
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/fmradio/lighthousepeak

{{^record_supported}}
DEVICE_SUPPORT_FM_RECORD := false
{{/record_supported}}
