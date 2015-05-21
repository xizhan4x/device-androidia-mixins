# Settings for Intel Smart Video library:
TARGET_HAS_ISV := true

DEVICE_PACKAGE_OVERLAYS += device/intel/common/video_isv/overlay

ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.media.avsync = 1
