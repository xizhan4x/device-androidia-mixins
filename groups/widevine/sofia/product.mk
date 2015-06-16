
# Widevine drm classic common
ifneq ($(BOARD_WIDEVINE_OEMCRYPTO_LEVEL),)
PRODUCT_PROPERTY_OVERRIDES += drm.service.enabled=true
PRODUCT_PACKAGES += com.google.widevine.software.drm.xml\
    com.google.widevine.software.drm\
    libdrmwvmplugin \
    libwvm \
    libdrmdecrypt
endif

# Widevine drm classic L1 only
ifeq ($(BOARD_WIDEVINE_OEMCRYPTO_LEVEL),1)
PRODUCT_PACKAGES += \
    libWVStreamControlAPI_L1 \
    libwvdrm_L1
endif

# Widevine drm classic L3 only
ifeq ($(BOARD_WIDEVINE_OEMCRYPTO_LEVEL),3)
PRODUCT_PACKAGES += \
    libWVStreamControlAPI_L3 \
    libwvdrm_L3
endif

# Widevine drm modular common, reserved by default
PRODUCT_PACKAGES += \
    libwvdrmengine

# Widevine drm modular L1 only
ifeq ($(BOARD_WIDEVINE_OEMCRYPTO_LEVEL),1)
PRODUCT_PACKAGES += \
    liboemcrypto
endif

ifneq ($(BOARD_WIDEVINE_OEMCRYPTO_LEVEL),)
# Test app for widevine drm classic
PRODUCT_PACKAGES_ENG += WidevineSamplePlayer
endif

# Test app for widevine drm modular
PRODUCT_PACKAGES_ENG += ExoPlayerDemo
