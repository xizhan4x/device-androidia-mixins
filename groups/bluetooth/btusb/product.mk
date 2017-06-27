PRODUCT_PACKAGES += \
    audio.a2dp.default \
		ath3k-1.fw \

PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.bluetooth.xml:vendor/etc/permissions/android.hardware.bluetooth.xml \
		frameworks/native/data/etc/android.hardware.bluetooth_le.xml:vendor/etc/permissions/android.hardware.bluetooth_le.xml

PRODUCT_PROPERTY_OVERRIDES += bluetooth.hwcfg=stop \
                bluetooth.rfkill=1
