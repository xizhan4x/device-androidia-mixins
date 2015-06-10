PRODUCT_PACKAGES += \
    bt_vendor.conf \
    audio.a2dp.default \
    a00.pbn \
    a10.pbn \
    a11.pbn \
    bddata \
    nvm_init.sh \

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
