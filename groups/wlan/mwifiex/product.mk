PRODUCT_PACKAGES += \
    pcie8897_wlan.bin \
    pcieuart8897_combo.bin \
    cal_data.conf

PRODUCT_PACKAGES += \
    hostapd \
    hostapd_cli \
    wificond \
    wifilogd \
    wpa_supplicant \
    wpa_cli \
    iw

PRODUCT_COPY_FILES += \
    device/intel/common/wlan/wpa_supplicant-common.conf:vendor/etc/wifi/wpa_supplicant.conf \
    device/intel/common/wlan/mwifiex/wpa_supplicant_overlay.conf:vendor/etc/wifi/wpa_supplicant_overlay.conf \
    frameworks/native/data/etc/android.hardware.wifi.xml:vendor/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:vendor/etc/permissions/android.hardware.wifi.direct.xml

