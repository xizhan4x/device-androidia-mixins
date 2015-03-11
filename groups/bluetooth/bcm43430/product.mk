PRODUCT_PACKAGES += \
    hciattach \
    audio.a2dp.default \
    BCM4343A0_001.001.034.0043.0000.hcd

PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
		frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

ADDITIONAL_BUILD_PROPERTIES += bluetooth.hwcfg=stop \
                bluetooth.rfkill=1

# Bluetooth eng / userdebug
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
	hciconfig \
	btmon \
	hcitool
endif
