$(call inherit-product,build/target/product/verity.mk)

PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/by-name/android_system

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/fstab:root/fstab.$(TARGET_PRODUCT) \
	frameworks/native/data/etc/android.software.verified_boot.xml:system/etc/permissions/android.software.verified_boot.xml

TARGET_NO_DEVICE_UNLOCK := true
TARGET_BOOT_SIGNER := ias
TARGET_IAFW_ARCH := i386

# Libpayload configuration for ABL
LIBPAYLOAD_BASE_ADDRESS := 0x12200000
LIBPAYLOAD_HEAP_SIZE := 805306368
LIBPAYLOAD_STACK_SIZE := 33554432
