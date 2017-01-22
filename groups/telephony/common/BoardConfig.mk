# BoardConfig.mk common to all platforms with Telephony

# Config flags
BOARD_HAVE_MODEM := true
BOARD_HAVE_ATPROXY := true
# crashlogd configuration
CRASHLOGD_MODULE_MODEM ?= true
# Set the list of supported modem families
# This parameter comes from mixin group instantiation in the device definition
BOARD_MODEM_LIST := {{{modems}}}

# System Properties
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath={{{rild}}}.so \
    ro.telephony.default_network=9 \
    persist.tel.stk.apbip=true

{{#use_crm}}
{{#pcie}}
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/telephony/pcie
{{/pcie}}
{{/use_crm}}

# Telephony common overlay folder
DEVICE_PACKAGE_OVERLAYS += device/intel/common/telephony/overlay_data

BOARD_SEPOLICY_DIRS += device/intel/sepolicy/telephony
{{#use_mcm}}
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/telephony/rpc
{{/use_mcm}}

{{#use_crm}}
INTEL_TELEPHONY_USE_CRM := true
{{/use_crm}}
{{#use_mcm}}
INTEL_TELEPHONY_USE_MCM := true
{{/use_mcm}}
