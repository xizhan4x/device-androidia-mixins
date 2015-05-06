#sigma_c
ifneq (,$(filter $(TARGET_BUILD_VARIANT),eng userdebug))
PRODUCT_PACKAGES += \
wifi_wfa \
hostapd_cli \
wpa_cli
endif

#sigma_java
PRODUCT_PACKAGES_DEBUG += \
SigmaCapiUI \
com.intel.sigma.sigmaapi \
com.intel.sigma.sigmaapi.xml \
libsigmajni \
libsigmacapi \
shcli \
shsrv \
intel_sigma
# Build only when INTEL_PASSPOINT is NOT set
ifneq ($(INTEL_PASSPOINT), true)
PRODUCT_PACKAGES_DEBUG += \
com.intel.passpointmanager \
sigmapasspointmanager_stub
endif
# Build only when INTEL_WIDI is NOT set
ifneq ($(INTEL_WIDI), true)
PRODUCT_PACKAGES_DEBUG += \
com.intel.widi.sink \
sigmawidisink_stub
endif
