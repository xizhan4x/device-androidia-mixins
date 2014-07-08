# product.mk common to all Telephony platforms
PRODUCT_COPY_FILES += \
    device/intel/common/telephony/all/apns-conf.xml:system/etc/apns-conf.xml

# copy permission files
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Modem related packages
PRODUCT_PACKAGES += \
    mdm_fw_pkg \
    miu-app

# Modem Manager related packages
PRODUCT_PACKAGES += \
    mmgr \
    libmodemupdate

PRODUCT_PACKAGES_DEBUG += \
    mmgr-debug

# Rapid RIL packages
PRODUCT_PACKAGES += \
    librapid-ril-core \
    librapid-ril-util

