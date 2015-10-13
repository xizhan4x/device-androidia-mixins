# DS4 HAL modules.
PRODUCT_PACKAGES += \
	camera.$(TARGET_BOARD_PLATFORM) \
	camera.plugin.ds4.$(TARGET_BOARD_PLATFORM)

# DS4 FW.
PRODUCT_PACKAGES += \
	ds4fw

# DS4 camera2 API extensions.
PRODUCT_PACKAGES += \
	com.intel.camera2.extensions.depthcamera \
	com.intel.camera2.extensions.depthcamera.xml \
	libinteldepthcamera_jni

# DS4 FW Update Tool.
PRODUCT_PACKAGES += \
       FWUpdateR200

# DSAPI property default value
PRODUCT_PROPERTY_OVERRIDES += \
	sys.ds4.claim_gpio=0

# Apps can now be compiled against the add-on without having to
# manually copy the com.intel.camera2.extensions.depthcamera.jar to the
# app 'libs' folder, ensuring only the built-in jar file
# on the device is used.
PRODUCT_BOOT_JARS += com.intel.camera2.extensions.depthcamera

# Product configuration files.
PRODUCT_COPY_FILES += \
	device/intel/common/camera/ds4/camera_realsense.xml:system/etc/camera_realsense.xml \
	device/intel/common/camera/ds4/com.intel.camera.depth.xml:system/etc/permissions/com.intel.camera.depth.xml

$(eval PRODUCT_COPY_FILES += $(LOCAL_PATH)/camera_realsense.xml:system/etc/camera_realsense.$(TARGET_BOARD_PLATFORM).xml)
