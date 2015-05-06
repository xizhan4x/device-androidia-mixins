#sigma_c
ifneq (,$(filter $(TARGET_BUILD_VARIANT),eng userdebug))
PRODUCT_PACKAGES += \
wifi_wfa \
hostapd_cli \
wpa_cli
endif
