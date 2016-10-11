# libstagefrighthw
PRODUCT_PACKAGES += \
    libstagefrighthw

# Media SDK and OMX IL components
PRODUCT_PACKAGES += \
    libmfxhw32 \
    libmfxsw32 \
    libmfx_omx_core \
    libmfx_omx_components_hw \
    libmfx_omx_components_sw

ifeq ($(BOARD_USE_64BIT_USERSPACE),true)
PRODUCT_PACKAGES += \
    libmfxhw64 \
    libmfxsw64
endif

{{#hevc_encoder}}
PRODUCT_PACKAGES += \
    libmfx_hevce_hw32
ifeq ($(BOARD_USE_64BIT_USERSPACE),true)
PRODUCT_PACKAGES += \
    libmfx_hevce_hw64
endif

{{/hevc_encoder}}
