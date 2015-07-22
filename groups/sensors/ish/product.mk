# ISH sensorhubd modules
PRODUCT_PACKAGES += \
    sensorhubd      \
    libsensorhub    \
    AndroidCalibrationTool

# ISH Sensor HAL modules
PRODUCT_PACKAGES += \
    sensors.$(TARGET_BOARD_PLATFORM)

$(foreach sensor,{{{sensors}}}, \
$(eval PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.$(sensor).xml:system/etc/permissions/android.hardware.sensor.$(sensor).xml))
