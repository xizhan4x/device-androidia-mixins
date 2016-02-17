#
# -- OTA RELATED DEFINES --
#

# tell build system where to get the recovery.fstab. Userfastboot
# uses this too.
TARGET_RECOVERY_FSTAB ?= $(TARGET_DEVICE_DIR)/fstab

# Used by ota_from_target_files to add platform-specific directives
# to the OTA updater scripts
TARGET_RELEASETOOLS_EXTENSIONS ?= device/intel/common/recovery

# Adds edify commands swap_entries and copy_partition for robust
# update of the EFI system partition
TARGET_RECOVERY_UPDATER_LIBS := libupdater_esp

# Extra libraries needed to be rolled into recovery updater
# libgpt_static and libefivar are needed by libupdater_esp
TARGET_RECOVERY_UPDATER_EXTRA_LIBS := libcommon_recovery libgpt_static libefivar

# By default recovery minui expects RGBA framebuffer
# also affects UI in Userfastboot
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"


#
# FILESYSTEMS
#

# NOTE: These values must be kept in sync with BOARD_GPT_INI
BOARD_SYSTEMIMAGE_PARTITION_SIZE ?= 2684354560
BOARD_BOOTLOADER_PARTITION_SIZE ?= 62914560
BOARD_BOOTLOADER_BLOCK_SIZE := {{{bootloader_block_size}}}
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE ?= 104857600
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := {{system_fs}}

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_FLASH_BLOCK_SIZE := 512
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

# Partition table configuration file
BOARD_GPT_INI ?= $(TARGET_DEVICE_DIR)/gpt.ini

TARGET_BOOTLOADER_BOARD_NAME := $(TARGET_DEVICE)

#
# Trusted Factory Reset - persistent partition
#
DEVICE_PACKAGE_OVERLAYS += device/intel/common/boot/overlay
ADDITIONAL_DEFAULT_PROPERTIES += ro.frp.pst=/dev/block/by-name/android_persistent

{{#fastbootefi}}
# For fastboot-uefi we need to parse gpt.ini into
# a binary format.

#can't use := here, as PRODUCT_OUT is not defined yet
BOARD_GPT_BIN = $(PRODUCT_OUT)/gpt.bin
BOARD_FLASHFILES += $(BOARD_GPT_BIN):gpt.bin
INSTALLED_RADIOIMAGE_TARGET += $(BOARD_GPT_BIN)

# For fastboot-uefi we offer the possibility to flash from a USB
# storage device using the "installer" EFI application
BOARD_FLASHFILES += $(PRODUCT_OUT)/efi/installer.efi
BOARD_FLASHFILES += device/intel/common/boot/startup.nsh

{{/fastbootefi}}
{{^fastbootefi}}

#
# USERFASTBOOT Configuration
#
BOOTLOADER_ADDITIONAL_DEPS += $(PRODUCT_OUT)/fastboot.img
BOOTLOADER_ADDITIONAL_ARGS += --fastboot $(PRODUCT_OUT)/fastboot.img

BOARD_FLASHFILES += $(BOARD_GPT_INI):gpt.ini
INSTALLED_RADIOIMAGE_TARGET += $(BOARD_GPT_INI)
{{/fastbootefi}}

{{#bootloader_policy}}
{{#blpolicy_use_efi_var}}
ifneq ({{bootloader_policy}},static)
BOOTLOADER_POLICY_OEMVARS = $(PRODUCT_OUT)/bootloader_policy-oemvars.txt
BOARD_FLASHFILES += $(BOOTLOADER_POLICY_OEMVARS):bootloader_policy-oemvars.txt
BOARD_OEM_VARS += $(BOOTLOADER_POLICY_OEMVARS)
endif
{{/blpolicy_use_efi_var}}
{{/bootloader_policy}}

{{#run_tco_on_shutdown}}
BOARD_KERNEL_CMDLINE += iTCO_wdt.stop_on_shutdown=0
{{/run_tco_on_shutdown}}

BOARD_SEPOLICY_DIRS += device/intel/sepolicy/boot-arch/efi
