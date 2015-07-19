BOARD_HAVE_BLUETOOTH := true
{{#hsu}}
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_CUSTOM_BT_CONFIG := device/intel/common/bluetooth/default/default.conf
{{/hsu}}
{{^hsu}}
BOARD_HAVE_BLUETOOTH_LINUX := true
{{/hsu}}
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/intel/common/bluetooth/bcm43241/
DEVICE_PACKAGE_OVERLAYS += device/intel/common/bluetooth/overlay-bt-pan
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/bluetooth/bcm43241
