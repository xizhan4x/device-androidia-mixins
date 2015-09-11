PRODUCT_PACKAGES += \
    cws_manu \
    gps.$(TARGET_BOARD_PLATFORM) \
    gnssCG2000 \
    libgnssconf \
    libgnsspatch \
    libgnssapi \
    gnssStelp \
    RXN_IntApp \
    MSLConfig.txt \
    libgnssrxnkey \
    rxn_services_xybrid

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
