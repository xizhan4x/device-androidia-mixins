# make usb enumerated in charging mode for user builds
ifeq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_COPY_FILES += $(LOCAL_PATH)/init.cos-charging.rc:root/init.cos-charging.rc
endif
