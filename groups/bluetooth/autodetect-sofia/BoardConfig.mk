BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_INTEL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/intel/common/bluetooth/ag620/
DEVICE_PACKAGE_OVERLAYS += device/intel/common/bluetooth/overlay-bt-pan
DEVICE_PACKAGE_OVERLAYS += device/intel/common/bluetooth/overlay-hid-kb
# Sofia uses ag620 as indicated above via BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/bluetooth/ag620
