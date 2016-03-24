BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_INTEL := true
BT_VENDOR_CONF_DIR := {{{vendor_conf}}}
BOARD_USE_IBT_STACK := {{{use_ibt}}}
{{#use_ibt}}
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := hardware/intel/libbt-vendor-intel/conf/intel/{{{vendor_conf}}}/
{{/use_ibt}}
{{^use_ibt}}
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR += hardware/intel/libbt-vendor-intel/conf/vanilla/{{{vendor_conf}}}/
{{/use_ibt}}
DEVICE_PACKAGE_OVERLAYS += device/intel/common/bluetooth/overlay-bt-pan
DEVICE_PACKAGE_OVERLAYS += device/intel/common/bluetooth/overlay-hid-kb
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/bluetooth/common \
                       device/intel/sepolicy/bluetooth/ag620 \
                       device/intel/sepolicy/bluetooth/sofia_nvm

BOARD_HAVE_HCIVSSERVICE := {{{hci_vs_service}}}

{{#hci_vs_service}}
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/bthcivsservice
{{/hci_vs_service}}
