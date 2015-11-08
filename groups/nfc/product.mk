# Common NFC feature files
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml

# Common NFC packages
PRODUCT_PACKAGES += \
    NfcNci

ifeq ($(FLAG_GMS_AVAILABLE),true)
ifneq ($(FLAG_GMS_MINIMAL), true)
GMS_PATH := vendor/google/gms
PRODUCT_COPY_FILES += \
    $(GMS_PATH)/apps/AndroidPay/lib/armeabi/libbarhopper.so:system/app/AndroidPay/lib/arm/libbarhopper.so \
    $(GMS_PATH)/apps/AndroidPay/lib/armeabi/libframesequence.so:system/app/AndroidPay/lib/arm/libframesequence.so \
    $(GMS_PATH)/apps/AndroidPay/lib/armeabi/libgoogle-ocrclient.so:system/app/AndroidPay/lib/arm/libgoogle-ocrclient.so

PRODUCT_PACKAGES += \
    AndroidPay \
    TagGoogle
endif
else
PRODUCT_PACKAGES += \
    Tag
endif
