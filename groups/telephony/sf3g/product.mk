PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=false \

PRODUCT_PACKAGES += \
    libauddriver \
    librpc-ril \

PRODUCT_PACKAGES += \
    com.msm.android.MSMClientLib \
    com.msm.android.MSMClientLib.xml \
    MSMClient \
    libmsm_library_jni

#OemTelephony for OEM HOOK API
PRODUCT_PACKAGES += \
    OemTelephonyApp-imc \
    com.intel.internal.telephony.OemTelephony-imc

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    device/intel/common/telephony/all/apns-conf.xml:system/etc/apns-conf.xml

# Inherit from common Open Source Telephony product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/librpc-ril.so \

