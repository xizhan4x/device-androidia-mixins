ifeq ($(TARGET_BOARD_PLATFORM),)
    $(error Please define TARGET_BOARD_PLATFORM in product-level Makefile)
endif

# Sensors HAL modules
PRODUCT_PACKAGES += \
        sensors.$(TARGET_BOARD_PLATFORM)

PRODUCT_PACKAGES += \
        iio-sensors-hal
