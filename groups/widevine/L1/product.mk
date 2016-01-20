ifneq ($(BOARD_WIDEVINE_OEMCRYPTO_LEVEL),1)
    $(error Incompatible Widevine parameters check boot-arch AND widevine mixins)
endif

# Widevine drm classic common
PRODUCT_PROPERTY_OVERRIDES += drm.service.enabled=true
PRODUCT_PACKAGES += com.google.widevine.software.drm.xml\
    com.google.widevine.software.drm\
    libdrmwvmplugin \
    libwvm \
    libdrmdecrypt \
    libwvdrmengine \
    libWVStreamControlAPI_L1 \
    libwvdrm_L1 \
    liboemcrypto

# Test app for widevine drm classic
PRODUCT_PACKAGES_ENG += WidevineSamplePlayer

# Test app for widevine drm modular
PRODUCT_PACKAGES_ENG += ExoPlayerDemo
