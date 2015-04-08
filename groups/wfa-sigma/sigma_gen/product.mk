#sigma
ifneq (,$(filter $(TARGET_BUILD_VARIANT),eng userdebug))
PRODUCT_PACKAGES += \
wifi_wfa \
hostapd_cli \
wpa_cli
endif

#widi-testing
PRODUCT_PACKAGES_DEBUG += \
WirelessDisplaySigmaCapiUI \
com.intel.widi.sigmaapi \
com.intel.widi.sigmaapi.xml \
libwidisigmajni \
libsigmacapi \
shcli \
shsrv
