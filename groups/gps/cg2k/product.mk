PRODUCT_PACKAGES += \
{{#gpp}}
    cws_manu \
{{/gpp}}
    gps.$(TARGET_BOARD_PLATFORM) \
    gnssCG2000 \
    libgnssconf \
    libgnsspatch \
    libgnssapi \
    gnssStelp \
    MSLConfig.txt \

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \

ifneq (, $(filter r2_%, $(TARGET_PRODUCT)))
    PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.gnss.sv.status=true
endif
