L_BRING_UP := true
COMBO_CHIP_VENDOR := intel
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/fmradio/lightninpeak

{{^record_supported}}
DEVICE_SUPPORT_FM_RECORD := false
{{/record_supported}}
