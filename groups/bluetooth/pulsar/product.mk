PRODUCT_PACKAGES += \
    bt_vendor.conf \
    audio.a2dp.default \
    03110006002a340f00.sfi \
    bddata_PULSAR \
    nvm_init.sh \

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
