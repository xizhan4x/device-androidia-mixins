# product.mk common to Telephony disabled platforms
PRODUCT_COPY_FILES += \
    device/intel/common/telephony/all/apns-conf.xml:system/etc/old-apns-conf.xml

# Inherit from common Open Source Telephony product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
