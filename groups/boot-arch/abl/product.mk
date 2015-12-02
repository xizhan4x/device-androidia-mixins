# FIXME surfaceflinger explodes if this is not "gmin"
TARGET_BOARD_PLATFORM := {{target_board_platform}}

# Copy init.rc files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.rc:root/init.$(TARGET_PRODUCT).rc \
    $(LOCAL_PATH)/init.recovery.rc:root/init.recovery.$(TARGET_PRODUCT).rc \
    $(LOCAL_PATH)/ueventd.rc:root/ueventd.$(TARGET_PRODUCT).rc \
    $(LOCAL_PATH)/fstab:root/fstab

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
