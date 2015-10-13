NFC_PN547_CONF_PATH := device/intel/common/nfc/pn547

# PN547-specific configuration files
PRODUCT_COPY_FILES += \
    $(NFC_PN547_CONF_PATH)/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(NFC_PN547_CONF_PATH)/libnfc-nxp.conf:system/etc/libnfc-nxp.conf

# PN547-specific NFC packages
PRODUCT_PACKAGES += \
    nfc_nci.pn54x.default \
    libpn547_fw

# Common NFC feature files
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/hald/fuse/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/hald/fuse/permissions/android.hardware.nfc.hce.xml

# Common NFC packages
PRODUCT_PACKAGES += \
    NfcNci

ifeq ($(FLAG_GMS_AVAILABLE),yes)
ifneq ($(FLAG_GMS_PACKAGES), minimal)
PRODUCT_PACKAGES += \
    AndroidPay \
    TagGoogle
endif
else
PRODUCT_PACKAGES += \
    Tag
endif
