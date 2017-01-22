DEVICE_PACKAGE_OVERLAYS += device/intel/common/telephony/overlay_sflte

PRODUCT_PROPERTY_OVERRIDES += \
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

{{#modem_silent_active}}
# Enable -MODEM_SILENT_RESET_ACTIVE
MODEM_SILENT_RESET_ACTIVE := true
{{/modem_silent_active}}

{{#intel_cta}}
INTEL_FEATURE_CTA := true
DEVICE_PACKAGE_OVERLAYS += vendor/intel/featsetres_tel/cta
{{/intel_cta}}

{{#dsds}}
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.multisim.config=dsds
{{/dsds}}

# unstub CRM only if modem silent reset is enabled
ifeq ($(MODEM_SILENT_RESET_ENABLED),true)
  PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
      persist.sys.crm0.load_stub=false \
      persist.sys.crm1.load_stub=false
endif

ifeq ($(MODEM_SILENT_RESET_ACTIVE),true)
  PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
      persist.sys.crm0.silent_reset=true \
      persist.sys.crm1.silent_reset=true
endif

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
      ro.telephony.tcs.hw_name={{tcs_hw}}

BOARD_HAVE_ATPROXY := true
BOARD_HAVE_MODEM_USING_SECPACK := true
