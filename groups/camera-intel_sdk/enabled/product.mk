# The Intel camera2 SDK exposes Intel extensions to the camera2 API.
# These are exposed in a Google defined way that avoids modifying
# any AOSP code. Use "make docs" to generate it; the output will be located at
# "out/target/common/docs/camera2sdk_doc".
PRODUCT_PACKAGES += \
	com.intel.camera2.extensions \
	com.intel.camera2.extensions.xml \
	libiacp_jni \
	libpvl_jni \
	libpvl_panorama_jni \
	libpvl_skin_smoothing_jni
