PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:vendor/etc/permissions/android.hardware.sensor.stepcounter.xml \
	frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:vendor/etc/permissions/android.hardware.sensor.stepdetector.xml \
	frameworks/native/data/etc/android.hardware.sensor.heartrate.xml:vendor/etc/permissions/android.hardware.sensor.heartrate.xml \
	frameworks/native/data/etc/android.hardware.sensor.heartrate.ecg.xml:vendor/etc/permissions/android.hardware.sensor.heartrate.ecg.xml

ifeq ($(TARGET_BOARD_PLATFORM),)
    $(error Please define TARGET_BOARD_PLATFORM in product-level Makefile)
endif

# Activity HAL modules
PRODUCT_PACKAGES += \
        activity_recognition.$(TARGET_BOARD_PLATFORM)

