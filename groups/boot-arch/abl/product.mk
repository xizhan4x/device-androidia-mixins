{{^avb}}
$(call inherit-product,build/target/product/verity.mk)

PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/by-name/android_system
{{/avb}}

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/fstab:root/fstab.$(TARGET_PRODUCT) \
	frameworks/native/data/etc/android.software.verified_boot.xml:vendor/etc/permissions/android.software.verified_boot.xml

TARGET_NO_DEVICE_UNLOCK := true
TARGET_BOOT_SIGNER := ias
TARGET_IAFW_ARCH := i386

# Libpayload configuration for ABL
LIBPAYLOAD_BASE_ADDRESS := 0x12800000
LIBPAYLOAD_HEAP_SIZE := 83886080
LIBPAYLOAD_STACK_SIZE := 1048576

# Disable Kernelflinger UI support
KERNELFLINGER_USE_UI := false
# Support boot from osloader
KERNELFLINGER_SUPPORT_ABL_BOOT := true
# Disable kernelflinger debug print to save boot time
KERNELFLINGER_DISABLE_DEBUG_PRINT := true

ABL_OS_KERNEL_KEY := build/target/product/security/verity
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.frp.pst=/dev/block/by-name/android_persistent

# Kernelflinger will set IOC_USE_SLCAN variable
# Distinguish between MRB IOC and NON_MRB_IOC
IOC_USE_SLCAN := true
