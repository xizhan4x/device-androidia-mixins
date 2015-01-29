# BoardConfig.mk common to all platforms with Telephony

# Config flags
BOARD_HAVE_MODEM := true
BOARD_HAVE_ATPROXY := true
# Set the list of supported modem families
# This parameter comes from mixin group instantiation in the device definition
BOARD_MODEM_LIST := {{{modems}}}

# System Properties
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.dual_sim=none \
    persist.ril-daemon.disable=0 \
    rild.libpath=/system/lib/librapid-ril-core.so \
    ro.telephony.default_network=9 \
    persist.tel.hot_swap.support=true

# Telephony common overlay folder
DEVICE_PACKAGE_OVERLAYS += device/intel/common/telephony/overlay
