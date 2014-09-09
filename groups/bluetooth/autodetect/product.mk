PRODUCT_PACKAGES += \
    hciattach \
	rfkillp \
    audio.a2dp.default

# Bluetooth FW
PRODUCT_PACKAGES += \
    bt_rtl8723b \
    bt_bcm43241

PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
		frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

ifneq ($(wildcard vendor/intel/fw/bluetooth/broadcom/bcm43241/*),)
PRODUCT_COPY_FILES += \
		vendor/intel/fw/bluetooth/broadcom/bcm43241/BCM43241B0_0082.hcd:system/etc/firmware/bt/BCM43241B0_0082.hcd:broadcom \
		vendor/intel/fw/bluetooth/broadcom/bcm43241/BCM4324B3_002.004.006.0076.0093.hcd:system/etc/firmware/bt/BCM4324B3_002.004.006.0076.0093.hcd:broadcom
endif

# Bluetooth eng / userdebug
PRODUCT_PACKAGES += \
    hciconfig \
    btmon \
    hcitool
