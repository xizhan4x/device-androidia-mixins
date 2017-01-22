# Settings for Intel Smart Video library:
TARGET_HAS_ISV := true

DEVICE_PACKAGE_OVERLAYS += device/intel/common/video_isv/overlay

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.media.avsync = 1

# Settings for the video extended mode:
INTEL_FEATURE_VIDEO_EXT_MODE := true

PRODUCT_BOOT_JARS += com.intel.extmode

BOARD_SEPOLICY_DIRS += device/intel/sepolicy/vpp/isv
