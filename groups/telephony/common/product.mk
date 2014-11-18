# product.mk common to all Telephony platforms
PRODUCT_COPY_FILES += \
    device/intel/common/telephony/all/apns-conf.xml:system/etc/apns-conf.xml

# copy permission files
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

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
    libmodemupdate

# AT Proxy
PRODUCT_PACKAGES += \
    proxy

PRODUCT_PACKAGES_DEBUG += \
    mmgr-debug

# Rapid RIL packages
PRODUCT_PACKAGES += \
    librapid-ril-core \
    librapid-ril-util

# Modem Trace Server (MTS)
PRODUCT_PACKAGES += \
    mts

