
#Camera isys firmware
PRODUCT_PACKAGES += \
    ipu4_isys_bxt_fw_a0.bin \
    ipu4_isys_bxt_fw_b0.bin

#Camera psys firmware
PRODUCT_PACKAGES += \
    ipu4_psys_bxt_fw_a0.bin \
    ipu4_psys_bxt_fw_b0.bin

#Camera cpd file
PRODUCT_PACKAGES += \
    ipu4_cpd_a0.bin \
    ipu4_cpd_b0.bin

ifeq ($(TARGET_BOARD_PLATFORM),)
    $(error Please define TARGET_BOARD_PLATFORM in product-level Makefile)
endif

# Camera HAL (camera3hal).
PRODUCT_PACKAGES += camera.$(TARGET_BOARD_PLATFORM)

# 3A/AIQ and camera tuning files.
PRODUCT_PACKAGES += \
    libmfldadvci \
    dummy.aiqb \

# Camera: Format set up for graphics
PRODUCT_PROPERTY_OVERRIDES += ro.camera.pixel_format = 0x10F
PRODUCT_PROPERTY_OVERRIDES += ro.camera.rec.pixel_format = 0x100
PRODUCT_PROPERTY_OVERRIDES += ro.ycbcr.pixel_format = 0x10F
