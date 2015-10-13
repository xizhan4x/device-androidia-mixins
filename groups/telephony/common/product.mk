# product.mk common to all Telephony platforms
PRODUCT_COPY_FILES += \
    device/intel/common/telephony/all/apns-conf.xml:system/etc/apns-conf.xml \
    device/intel/common/telephony/all/old-apns-conf.xml:system/etc/old-apns-conf.xml

# Inherit from common Open Source Telephony product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# copy atproxy_usbreset
PRODUCT_COPY_FILES += \
    device/intel/common/telephony/atproxy_usbreset:system/bin/atproxy_usbreset

# Modem related packages
PRODUCT_PACKAGES += \
    mdm_fw_pkg

PRODUCT_PACKAGES_DEBUG += \
    miu-app

# Modem Manager related packages
PRODUCT_PACKAGES += \
    mmgr \
    libmdmcli_mmgr \
    libmdmcli_jni \
    libmodemupdate{{#m2}} \
    fwswitching{{/m2}}

# AT Proxy
PRODUCT_PACKAGES += \
    proxy

PRODUCT_PACKAGES_DEBUG += \
    mmgr-test \
    ModemClientJavaTest \
    run_test_ipc.sh \
    mcd-test \
    ipcbox

# Rapid RIL packages
PRODUCT_PACKAGES += \
    librapid-ril-core \
    librapid-ril-util

# Modem Trace Server (MTS)
PRODUCT_PACKAGES += \
    mts

# Autocall
PRODUCT_PACKAGES_DEBUG += \
    Autocall

#SimToolkit app
PRODUCT_PACKAGES += \
    Stk
