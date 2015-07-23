# Tinyalsa
PRODUCT_PACKAGES_DEBUG += \
         tinymix \
         tinyplay \
         tinycap

# SST Firmware
PRODUCT_PACKAGES += \
    fw_sst_22a8.bin \
    dfw_sst.bin

#audio FWDT Library for asoc_dfw
PRODUCT_PACKAGES += \
    dfw_sst.v1

# Ring 1 audio policy configuration file
PRODUCT_COPY_FILES += $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf

