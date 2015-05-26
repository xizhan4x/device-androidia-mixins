# The Intel camera2 SDK exposes Intel extensions to the camera2 API. These are exposed in
# a Google defined way that avoids modifying any AOSP code.
PRODUCT_PACKAGES += \
	com.intel.camera2.extensions \
	com.intel.camera2.extensions.xml \
	libiacp_jni \
	libpvl_jni \
	libpvl_panorama_jni

# Include Intel SDK documentation.
PRODUCT_PACKAGES += \
        camera2sdk_doc
