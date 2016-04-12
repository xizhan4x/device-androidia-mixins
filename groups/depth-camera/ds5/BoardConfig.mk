ifneq ($(USE_CAMERA_HAL_3),true)
$(error Camera V3 HAL must be enabled, check camera mixin option!)
endif

USE_CAMERA_REALSENSE_NEW := true

# Enable DS5 camera HAL support. This is built as the master/main camera HAL
# and will relay calls to camera3hal for other cameras in the system.
USE_CAMERA_DS5 := true

# Build camera3hal as system lib instead as camera HAL module.
USE_CAMERA_ATOMISP_EMBED := true

# Use the DS5 libusb specific SELinux rules
BOARD_SEPOLICY_DIRS += \
        device/intel/sepolicy/depth-camera/common \
        device/intel/sepolicy/depth-camera/ds5

# Increase number of urb buffers to 16
BOARD_KERNEL_CMDLINE += uvcvideo.uvc_urbs=16
