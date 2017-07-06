ifneq ($(BOARD_WIDEVINE_OEMCRYPTO_LEVEL),3)
    $(error Incompatible Widevine parameters check boot-arch AND widevine mixins)
endif

#enable Widevine drm
PRODUCT_PROPERTY_OVERRIDES += drm.service.enabled=true

PRODUCT_COPY_FILES += device/intel/common/media/mfx_omxil_core_widevine.conf:vendor/etc/mfx_omxil_core.conf

# There is an additional dependency on hdcpd that should be controlled
# through the content-protection mixin

PRODUCT_PACKAGES += com.google.widevine.software.drm.xml \
    com.google.widevine.software.drm \
    libdrmwvmplugin \
    libwvm \
    libdrmdecrypt \
    libwvdrmengine \
    libWVStreamControlAPI_L3 \
    libwvdrm_L3

PRODUCT_PACKAGES_ENG += WidevineSamplePlayer \
                        ExoPlayerDemo
