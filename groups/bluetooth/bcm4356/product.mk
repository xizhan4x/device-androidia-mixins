PRODUCT_PACKAGES += \
    hciattach \
    audio.a2dp.default \
    BCM4354A2_001.003.015.0026.0032_RC.hcd \

PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
		frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

ADDITIONAL_BUILD_PROPERTIES += bluetooth.hwcfg=stop \
                bluetooth.rfkill=1
