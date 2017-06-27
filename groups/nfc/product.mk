# Common NFC feature files
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:vendor/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:vendor/etc/permissions/android.hardware.nfc.hce.xml

# Common NFC packages
PRODUCT_PACKAGES += \
    NfcNci

ifeq ($(FLAG_GMS_AVAILABLE),true)
ifneq ($(FLAG_GMS_MINIMAL), true)
PRODUCT_PACKAGES += \
    AndroidPay \
    TagGoogle
endif
else
PRODUCT_PACKAGES += \
    Tag
endif
