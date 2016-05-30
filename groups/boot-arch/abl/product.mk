$(call inherit-product,build/target/product/verity.mk)

PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/by-name/android_system

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.verified_boot.xml:system/etc/permissions/android.software.verified_boot.xml
