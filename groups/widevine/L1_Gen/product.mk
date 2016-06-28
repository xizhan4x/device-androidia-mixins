#enable Widevine drm
PRODUCT_PROPERTY_OVERRIDES += drm.service.enabled=true

PRODUCT_COPY_FILES += device/intel/common/media/mfx_omxil_core_widevine.conf:system/etc/mfx_omxil_core.conf

# There is an additional dependency on hdcpd that should be controlled
# through the content-protection mixin

PRODUCT_PACKAGES += com.google.widevine.software.drm.xml \
    com.google.widevine.software.drm \
    libdrmwvmplugin \
    libwvm \
    libdrmdecrypt \
    libWVStreamControlAPI_L1 \
    libwvdrm_L1

# WV Modular
PRODUCT_PACKAGES += libwvdrmengine

PRODUCT_PACKAGES_ENG += ExoPlayerDemo

PRODUCT_PACKAGES += liboemcrypto

{{#additional_lib}}
PRODUCT_PACKAGES += {{{additional_lib}}}
{{/additional_lib}}

BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 1
