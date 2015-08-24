ADDITIONAL_DEFAULT_PROPERTIES += wifi.interface=wlan0
WPA_SUPPLICANT_VERSION := VER_2_1_DEVEL
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WLAN_DEVICE := rtl
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_rtl

DEVICE_PACKAGE_OVERLAYS += device/intel/common/wlan/overlay-wifi-display

# WiDi / Miracast Optimisations
DEVICE_PACKAGE_OVERLAYS += device/intel/common/wlan/overlay-miracast-go
DEVICE_PACKAGE_OVERLAYS += device/intel/common/wlan/overlay-p2p-connected-stop-scan
