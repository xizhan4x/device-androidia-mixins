#
# -- OTA RELATED DEFINES --
#

# tell build system where to get the recovery.fstab. Userfastboot
# uses this too.
TARGET_RECOVERY_FSTAB ?= $(TARGET_DEVICE_DIR)/fstab

BOARD_SYSTEMIMAGE_PARTITION_SIZE = 2147483648 #$(shell echo {{system_partition_size}}*1048576 | bc)
BOARD_CACHEIMAGE_PARTITION_SIZE ?= 104857600
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE ?= ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE = 4569694208 #$(shell echo {{userdata_partition_size}}*1048576 | bc)

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

BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true

{{#msm}}
# Enable -DFEAT_RPC_SERVICE for various IMC services
FEAT_MSM := YES
{{/msm}}

# HACK to work around lack of PAE kernel override
override LIBART_IMG_TARGET_BASE_ADDRESS := 0x30000000

# All sofia devices depend on this mixin group currently due to symlink
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/boot-arch/common

# parallel preload
INTEL_FEATURE_PARALLEL_PRELOAD := true
# parallel package scan
INTEL_FEATURE_PARALLEL_SCAN := true
# Support partial memory copy when unzip
SUPPORT_PARTIAL_COPY := true
