#
# -- OTA RELATED DEFINES --
#

# tell build system where to get the recovery.fstab. Userfastboot
# uses this too.
TARGET_RECOVERY_FSTAB ?= $(TARGET_DEVICE_DIR)/fstab

BOARD_SYSTEMIMAGE_PARTITION_SIZE ?= 2147483648
BOARD_CACHEIMAGE_PARTITION_SIZE ?= 104857600
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE ?= ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE ?= 4569694208
ifneq ($(BOARD_USERDATAIMAGE_PARTITION_SIZE),)
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE ?= ext4
else
ifneq ($(CALLED_FROM_SETUP),true)
$(warning "BOARD_USERDATAIMAGE_PARTITION_SIZE not defined, please specify at the top of your device's BoardConfig.mk")
endif
endif

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_FLASH_BLOCK_SIZE := 4096

TARGET_BOOTLOADER_IS_2ND := true
TARGET_BOOTLOADER_BOARD_NAME := {{{modem_projectname}}}

BOARD_KERNEL_BASE := 0x0
BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x0800000 --ramdisk_offset 0x400000 --second_offset 0x700010

#REVERTME: need align this configure of sofia3gr on sofialte
#revert is tracked in https://jira01.devtools.intel.com/browse/OAM-6593
ifeq (${TARGET_BOARD_PLATFORM},sofia_lte)
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x0800000 --ramdisk_offset 0x300000 --second_offset 0x600010
endif

BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true

{{#msm}}
# Enable -DFEAT_RPC_SERVICE for various IMC services
FEAT_MSM := YES
{{/msm}}

# HACK to work around lack of PAE kernel override
override LIBART_IMG_TARGET_BASE_ADDRESS := 0x30000000
# Force 32-bit host ART to workaround crash due to above change
HOST_PREFER_32_BIT := true

SECURE_PLAYBACK_ENABLE := false

TARGET_RELEASETOOLS_EXTENSIONS := device/intel/common/recovery/${TARGET_BOARD_PLATFORM}/
TARGET_RECOVERY_UPDATER_LIBS := libcommon_recovery librecovery_sofia3g_intel

# All sofia devices depend on this mixin group currently due to symlink
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/boot-arch/common

# Define this to not use the common stable human readable names aka by-name/recovery
BOARD_SEPOLICY_M4DEFS += sepolicy_use_raw_block_devices=true
