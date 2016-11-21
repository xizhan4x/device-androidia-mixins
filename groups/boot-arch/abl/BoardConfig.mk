#
# -- OTA RELATED DEFINES --
#

# tell build system where to get the recovery.fstab
TARGET_RECOVERY_FSTAB ?= $(TARGET_DEVICE_DIR)/fstab

# Used by ota_from_target_files to add platform-specific directives
# to the OTA updater scripts
TARGET_RELEASETOOLS_EXTENSIONS ?= device/intel/common/recovery/bootloader

# By default recovery minui expects RGBA framebuffer
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"

# Needed for ABL firmware update
TARGET_RECOVERY_UPDATER_LIBS := libabl_recovery

#
# FILESYSTEMS
#

# NOTE: These values must be kept in sync with BOARD_GPT_INI
BOARD_SYSTEMIMAGE_PARTITION_SIZE ?= 3221225472
BOARD_BOOTLOADER_PARTITION_SIZE ?= $$(({{bootloader_len}} * 1024 * 1024))
BOARD_BOOTLOADER_BLOCK_SIZE := {{{bootloader_block_size}}}
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE ?= 104857600
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := {{system_fs}}

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_FLASH_BLOCK_SIZE := 512
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

#
# Trusted Factory Reset - persistent partition
#
DEVICE_PACKAGE_OVERLAYS += device/intel/common/boot/overlay
ADDITIONAL_DEFAULT_PROPERTIES += ro.frp.pst=/dev/block/by-name/android_persistent

{{#run_tco_on_shutdown}}
BOARD_KERNEL_CMDLINE += iTCO_wdt.stop_on_shutdown=0
{{/run_tco_on_shutdown}}

BOARD_SEPOLICY_DIRS += device/intel/sepolicy/boot-arch/abl

TARGET_BOOTLOADER_BOARD_NAME := $(TARGET_DEVICE)
