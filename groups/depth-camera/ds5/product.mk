# DS5 HAL modules.
PRODUCT_PACKAGES += \
        camera.$(TARGET_BOARD_PLATFORM) \
        camera.plugin.ds5.$(TARGET_BOARD_PLATFORM)

# DS5 camera2 API extensions.
PRODUCT_PACKAGES += \
        com.intel.camera2.extensions.depthcamera \
        com.intel.camera2.extensions.depthcamera.xml \
        libinteldepthcamera_jni

# Build static library for app development in userdebug
# and eng builds
ifneq ($(filter userdebug eng, $(TARGET_BUILD_VARIANT)),)
PRODUCT_PACKAGES += \
        com.intel.camera2.extensions.depthcamera.static
endif

# Add mediaserver to USB group, as this is required for mediaserver
# to access the USB device via libusb.
PRODUCT_PACKAGES += add-ds5-to-usb-group

# Apps can now be compiled against the add-on without having to
# manually copy the com.intel.camera2.extensions.depthcamera.jar to the
# app 'libs' folder, ensuring only the built-in jar file
# on the device is used.
#PRODUCT_BOOT_JARS += com.intel.camera2.extensions.depthcamera

# Product configuration files.
PRODUCT_COPY_FILES += \
        device/intel/common/camera/ds5/camera_realsense.xml:system/etc/camera_realsense.xml \
        device/intel/common/camera/ds5/com.intel.camera.depth.xml:system/etc/permissions/com.intel.camera.depth.xml

$(eval PRODUCT_COPY_FILES += $(LOCAL_PATH)/camera_realsense.xml:system/etc/camera_realsense.$(TARGET_BOARD_PLATFORM).xml)

