#
# -- OTA RELATED DEFINES --
#

# tell build system where to get the recovery.fstab
TARGET_RECOVERY_FSTAB ?= $(TARGET_DEVICE_DIR)/fstab

# By default recovery minui expects RGBA framebuffer
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"

#
# FILESYSTEMS
#

# NOTE: These values must be kept in sync with BOARD_GPT_INI
BOARD_SYSTEMIMAGE_PARTITION_SIZE ?= 2684354560
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE ?= 104857600
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := {{system_fs}}

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_FLASH_BLOCK_SIZE := 512
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

# Partition table configuration file
BOARD_GPT_INI ?= $(TARGET_DEVICE_DIR)/gpt.ini

#
# Trusted Factory Reset - persistent partition
#
DEVICE_PACKAGE_OVERLAYS += device/intel/common/boot/overlay
ADDITIONAL_DEFAULT_PROPERTIES += ro.frp.pst=/dev/block/by-name/android_persistent

#can't use := here, as PRODUCT_OUT is not defined yet
BOARD_GPT_BIN = $(PRODUCT_OUT)/gpt.bin
BOARD_FLASHFILES += $(BOARD_GPT_BIN):gpt.bin
INSTALLED_RADIOIMAGE_TARGET += $(BOARD_GPT_BIN)

BOARD_FLASHFILES += $(BOARD_GPT_INI):gpt.ini
INSTALLED_RADIOIMAGE_TARGET += $(BOARD_GPT_INI)

{{#run_tco_on_shutdown}}
BOARD_KERNEL_CMDLINE += iTCO_wdt.stop_on_shutdown=0
{{/run_tco_on_shutdown}}

BOARD_SEPOLICY_DIRS += device/intel/sepolicy/boot-arch/abl
