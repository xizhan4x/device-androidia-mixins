PRODUCT_PACKAGES += \
        hald        \
        halctl


# HAL autodetection bind mount prefixes
# and target paths.
# Exported variables are for the gfx, media,
# software update client and wifi components
# to fetch.

HAL_AUTODETECT := true

HAL_BIND_MOUNT := true
HAL_TELEMETRY := true

HAL_SCRIPTS_PREFIX := /system/etc
HAL_PROPERTIES_PREFIX := /system/etc/hald/properties
HAL_RECORDS_PREFIX := /system/etc/hald/hrec.d
HAL_FUSE_PREFIX_DEFAULT := /system/etc/hald/fuse/default
HAL_FUSE_PREFIX_PERM := /system/etc/hald/fuse/permissions
HAL_FUSE_PREFIX_ATOMISP := /system/etc/hald/fuse/atomisp
HAL_FUSE_PREFIX_MODPROBE := /system/etc/hald/fuse/modprobe.d
HAL_OEM_VAR_PREFIX := /system/etc/firmware/

HAL_FUSE_MOUNT_DEFAULT := /system/rt/hal_fuse
HAL_FUSE_MOUNT_PERM := /system/etc/permissions
HAL_FUSE_MOUNT_ATOMISP := /system/etc/atomisp
HAL_FUSE_MOUNT_MODPROBE := /system/etc/modprobe.d

HAL_BM_SOURCE_GFX_PREFIX := /system/vendor/gfx
HAL_BM_TARGET_GFX := /system/rt/gfx

HAL_BM_SOURCE_MEDIA_PREFIX := /system/vendor/media
HAL_BM_TARGET_MEDIA := /system/rt/media

HAL_BM_SOURCE_AUDIO_PREFIX := /system/vendor/audio
HAL_BM_TARGET_AUDIO := /system/rt/audio

HAL_BM_SOURCE_WIFI_PREFIX := /system/vendor/wifi
HAL_BM_TARGET_WIFI := /system/rt/wifi

HAL_BM_TARGETS := :$(HAL_BM_TARGET_GFX):$(HAL_BM_TARGET_MEDIA):$(HAL_BM_TARGET_AUDIO):$(HAL_BM_TARGET_WIFI):

HAL_KMSG_NAME := /dev/__hal_kmsg__

# Forcing these directories to live post zip update
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/virtual.txt:system/etc/firmware/virtual/virtual.txt \
        $(LOCAL_PATH)/virtual.txt:system/rt/audio/virtual.txt \
        $(LOCAL_PATH)/virtual.txt:system/rt/gfx/virtual.txt \
        $(LOCAL_PATH)/virtual.txt:system/rt/hal_fuse/virtual.txt \
        $(LOCAL_PATH)/virtual.txt:system/rt/media/virtual.txt \
        $(LOCAL_PATH)/virtual.txt:system/rt/wifi/virtual.txt
