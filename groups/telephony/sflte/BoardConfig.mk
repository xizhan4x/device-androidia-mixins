DEVICE_PACKAGE_OVERLAYS += device/intel/common/telephony/overlay_sflte

BOARD_USE_IMC_OEM_TELEPHONY := false

BOARD_HAVE_MODEM := true

BOARD_SEPOLICY_DIRS += device/intel/sepolicy/telephony \
                       device/intel/sepolicy/telephony/sflte

{{#ril_iosm}}
# Enable -RIL_IOSM_ENABLED
RIL_IOSM_ENABLED := true
{{/ril_iosm}}

{{#modem_silent_reset}}
# Enable -MODEM_SILENT_RESET_ENABLED
MODEM_SILENT_RESET_ENABLED := true
{{/modem_silent_reset}}

{{#modem_silent_active}}
# Enable -MODEM_SILENT_RESET_ACTIVE
MODEM_SILENT_RESET_ACTIVE := true
{{/modem_silent_active}}

{{#intel_cta}}
INTEL_FEATURE_CTA := true
DEVICE_PACKAGE_OVERLAYS += vendor/intel/featsetres_tel/cta
{{/intel_cta}}

BOARD_HAVE_ATPROXY := true
BOARD_HAVE_MODEM_USING_SECPACK := true
