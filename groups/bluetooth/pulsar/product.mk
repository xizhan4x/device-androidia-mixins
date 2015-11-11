PRODUCT_PACKAGES += \
    bt_vendor.conf \
    audio.a2dp.default \
    370b120600010e0f00.sfi \
    bddata_B2_C0 \
    nvm_init.sh \

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
