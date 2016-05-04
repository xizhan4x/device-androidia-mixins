BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_INTEL := true
BT_VENDOR_CONF_DIR := {{{vendor_conf}}}
BOARD_USE_IBT_STACK := {{{use_ibt}}}
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := hardware/intel/libbt-vendor-intel/conf/intel/{{{vendor_conf}}}/
DEVICE_PACKAGE_OVERLAYS += device/intel/common/bluetooth/overlay-bt-pan
DEVICE_PACKAGE_OVERLAYS += device/intel/common/bluetooth/overlay-hid-kb
