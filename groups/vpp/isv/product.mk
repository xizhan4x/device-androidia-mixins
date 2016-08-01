# libisv
PRODUCT_PACKAGES += \
    libisv_omx_core \
    libisv

# isv settings
PRODUCT_PACKAGES += \
    VppSettings

# extmode - Intel video extended mode

# copy permission files
PRODUCT_COPY_FILES += \
    vendor/intel/mediasdk_release/ISV/display/v1/com.intel.extmode.xml:system/etc/permissions/com.intel.extmode.xml

PRODUCT_PACKAGES += \
    libextmodejni \
    com.intel.extmode
