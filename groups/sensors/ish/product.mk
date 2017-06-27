# sensorhub config xml file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensors/sensors_config.xml:system/etc/sensors_config.xml

# ISH sensorhubd modules
PRODUCT_PACKAGES += \
    sensorhubd      \
    libsensorhub    \
    AndroidCalibrationTool

# ISH Sensor HAL modules
PRODUCT_PACKAGES += \
    sensors.$(TARGET_BOARD_PLATFORM)    \
    activity_recognition.$(TARGET_BOARD_PLATFORM)

$(foreach sensor,{{{sensors}}}, \
$(eval PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.$(sensor).xml:vendor/etc/permissions/android.hardware.sensor.$(sensor).xml))
