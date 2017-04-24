BOARD_HAVE_BLUETOOTH := false
BOARD_HAVE_BLUETOOTH_LINUX_PRI := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR = $(TARGET_DEVICE_DIR)
DEVICE_PACKAGE_OVERLAYS += \
    device/intel/common/bluetooth/overlay-bt-pan \
    device/intel/common/bluetooth/overlay-hid-kb \
    device/intel/common/bluetooth/overlay-bt-startup
BOARD_SEPOLICY_DIRS += \
    device/intel/sepolicy/bluetooth/common \
    device/intel/sepolicy/bluetooth/marvellW8897
