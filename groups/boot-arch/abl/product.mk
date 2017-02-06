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
LIBPAYLOAD_HEAP_SIZE := 83886080
LIBPAYLOAD_STACK_SIZE := 1048576

# Disable Kernelflinger UI support
KERNELFLINGER_USE_UI := false

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.frp.pst=/dev/block/by-name/android_persistent
