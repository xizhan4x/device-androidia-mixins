PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml

ifeq ($(TARGET_BOARD_PLATFORM),)
    $(error Please define TARGET_BOARD_PLATFORM in product-level Makefile)
endif

# Sensors HAL modules
PRODUCT_PACKAGES += \
        sensors.$(TARGET_BOARD_PLATFORM)

PRODUCT_PACKAGES += \
	android.hardware.sensors@1.0-service \
	android.hardware.sensors@1.0-impl
