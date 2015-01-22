PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=false \

PRODUCT_PACKAGES += \
    libauddriver \
    librpc-ril \

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \

ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.dual_sim=dsds \
    persist.tel.hot_swap.support=true \
	persist.ril-daemon.disable=dsds

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
        rild.libpath=/system/lib/librpc-ril.so \

