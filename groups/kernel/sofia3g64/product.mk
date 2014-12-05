TARGET_KERNEL_ARCH := x86_64

LOCAL_KERNEL_MODULE_FILES :=
# use default kernel
LOCAL_KERNEL_PATH := device/intel/sofia3g-kernel/$(TARGET_KERNEL_ARCH)
LOCAL_KERNEL := $(LOCAL_KERNEL_PATH)/vmlinux.bin
LOCAL_KERNEL_MODULE_FILES := $(wildcard $(LOCAL_KERNEL_PATH)/modules/*)

# Copy kernel into place
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    $(foreach f, $(LOCAL_KERNEL_MODULE_FILES), $(f):system/lib/modules/$(notdir $(f))) \
  $(foreach f, $(LOCAL_KERNEL_MODULE_TREE_FILES), $(LOCAL_KERNEL_PATH)/lib/modules/$(f):system/lib/modules/$(f))

