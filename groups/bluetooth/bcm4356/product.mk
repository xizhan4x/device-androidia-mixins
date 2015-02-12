PRODUCT_PACKAGES += \
    hciattach \
    audio.a2dp.default \
    BCM4354A2_001.003.015.0049.0100_Wci2In_Gpio6.hcd \
    RVP_BCM4354A2_001.003.015.0049.0103_Wci2In_Gpio4.hcd \

PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
		frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

ADDITIONAL_BUILD_PROPERTIES += bluetooth.hwcfg=stop \
                bluetooth.rfkill=1