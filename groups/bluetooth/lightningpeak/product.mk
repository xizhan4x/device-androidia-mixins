PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

PRODUCT_COPY_FILES += \
    vendor/intel/fw/bluetooth/intel/370b10060002220e00.sfi:system/etc/firmware/bt/370b10060002220e00.sfi \
    vendor/intel/fw/bluetooth/intel/bddata_B0:system/etc/bluetooth/bddata_B0 \
    vendor/intel/fw/bluetooth/intel/370b000600020d0e00.sfi:system/etc/firmware/bt/370b000600020d0e00.sfi \
    vendor/intel/fw/bluetooth/intel/bddata_K0:system/etc/bluetooth/bddata_K0 \
    vendor/intel/fw/bluetooth/intel/370b00060002280d00.seq:system/etc/firmware/bt/370b00060002280d00.seq \
    vendor/intel/fw/bluetooth/intel/bddata_A0:system/etc/bluetooth/bddata_A0

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    bt_vendor.conf
