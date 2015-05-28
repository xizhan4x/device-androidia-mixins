# DS4 HAL modules.
PRODUCT_PACKAGES += \
	camera.$(TARGET_BOARD_PLATFORM) \
	camera.plugin.ds4.$(TARGET_PRODUCT)

# DS4 FW.
PRODUCT_PACKAGES += \
	ds4fw

# DS4 camera2 API extensions.
PRODUCT_PACKAGES += \
	com.intel.camera2.extensions.depthcamera \
	com.intel.camera2.extensions.depthcamera.xml \
	libinteldepthcamera_jni

# Apps can now be compiled against the add-on without having to
# manually copy the com.intel.camera2.extensions.depthcamera.jar to the
# app 'libs' folder, ensuring only the built-in jar file
# on the device is used.
PRODUCT_BOOT_JARS += com.intel.camera2.extensions.depthcamera

# Product configuration files.
PRODUCT_COPY_FILES += \
	device/intel/common/camera/ds4/camera_ds4.xml:system/etc/camera_ds4.xml \
	device/intel/common/camera/ds4/com.intel.camera.depth.xml:system/etc/permissions/com.intel.camera.depth.xml
