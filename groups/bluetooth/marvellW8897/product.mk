PRODUCT_PACKAGES += \
    hciattach \
    audio.a2dp.default \
    uart8897_bt.bin \
    helper_uart_3000000.bin

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:vendor/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:vendor/etc/permissions/android.hardware.bluetooth_le.xml \
    $(LOCAL_PATH)/btcfg.sh:vendor/bin/btcfg.sh \
    $(LOCAL_PATH)/btscocfg.sh:vendor/bin/btscocfg.sh

PRODUCT_PROPERTY_OVERRIDES += \
    bluetooth.hwcfg=stop \
    bluetooth.scocfg=stop

# Bluetooth eng / userdebug
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    hciconfig \
    btmon \
    hcitool
endif
