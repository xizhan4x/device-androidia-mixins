BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_LINUX := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR = $(TARGET_DEVICE_DIR)
DEVICE_PACKAGE_OVERLAYS += \
    device/intel/common/bluetooth/overlay-bt-pan \
    device/intel/common/bluetooth/overlay-hid-kb \
    device/intel/common/bluetooth/overlay-bt-startup
BOARD_SEPOLICY_DIRS += \
    device/intel/sepolicy/bluetooth/common \
    device/intel/sepolicy/bluetooth/marvellW8897
