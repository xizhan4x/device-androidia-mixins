DEVICE_PACKAGE_OVERLAYS += device/intel/common/telephony/overlay_sflte

ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.tel.hot_swap.support=true \
    persist.ril-daemon.disable=dsds\

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

{{#intel_cta}}
DEVICE_PACKAGE_OVERLAYS += vendor/intel/featsetres_tel/cta
{{/intel_cta}}
# unstub CRM only if modem silent reset is enabled
ifeq ($(MODEM_SILENT_RESET_ENABLED),true)
  ADDITIONAL_DEFAULT_PROPERTIES += \
      persist.sys.crm0.load_stub=false \
      persist.sys.crm1.load_stub=false
endif

BOARD_HAVE_ATPROXY := true
