PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    bt_vendor.conf \
    370b12060002340e00.sfi \
    370b10060002220e00.sfi \
    370b000600020d0e00.sfi \
    370b00060002280d00.seq \
    bddata_B2_C0 \
    bddata_B0 \
    bddata_K0 \
    bddata_A0 \
    370b12060002340e00_selftest.sfi \
    370b10060002220e00_selftest.sfi \
    bluetooth_intel_restore.sh
