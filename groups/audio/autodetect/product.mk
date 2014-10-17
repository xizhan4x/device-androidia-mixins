# Tinyalsa
PRODUCT_PACKAGES_DEBUG += \
        tinymix \
        tinyplay \
        tinycap \
        tinypcminfo

# Audio Primary HAL
PRODUCT_PACKAGES += \
        audio.primary.$(TARGET_BOARD_PLATFORM)

# Extended Audio HALs
PRODUCT_PACKAGES += \
        audio.r_submix.default \
        audio.hdmi.$(TARGET_BOARD_PLATFORM) \
        audio.usb.default \
        audio.a2dp.default

PRODUCT_COPY_FILES += $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf
PRODUCT_COPY_FILES += $(LOCAL_PATH)/audio/mixer_paths_ALC5640.xml:system/etc/mixer_paths.xml

# SST Firmware
PRODUCT_PACKAGES += \
    fw_sst_0f28_ssp0.bin \
    fw_sst_0f28_ssp2.bin


