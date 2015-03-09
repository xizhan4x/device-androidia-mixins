ifeq ($(TARGET_BOARD_PLATFORM),)
    $(error Please define TARGET_BOARD_PLATFORM in product-level Makefile)
endif

# Since camera3hal is built as main HAL, libcamera2 will be build
# as legacy library.
PRODUCT_PACKAGES += libcamera.legacy

# Add OV680 FW
PRODUCT_PACKAGES += ov680_fw.bin
