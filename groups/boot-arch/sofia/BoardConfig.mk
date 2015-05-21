#
# -- OTA RELATED DEFINES --
#

# tell build system where to get the recovery.fstab. Userfastboot
# uses this too.
TARGET_RECOVERY_FSTAB ?= $(TARGET_DEVICE_DIR)/fstab

BOARD_SYSTEMIMAGE_PARTITION_SIZE ?= 2147483648
BOARD_CACHEIMAGE_PARTITION_SIZE ?= 104857600
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE ?= ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE ?= 4470079488
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

BOARD_KERNEL_BASE := 0x0
BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x0800000 --ramdisk_offset 0x400000 --second_offset 0x600010

BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true

# Flash partition layout:
{{^fls_prebuilts}}
INTEL_PRG_FILE ?= device/intel/$(TARGET_BOARD_PLATFORM)/modem_cfg_emmc.prg
GEN_PRG_FROM_SRC := true
TARGET_NO_RECOVERY := false
{{/fls_prebuilts}}
{{#fls_prebuilts}}
INTEL_PRG_FILE := hardware/intel/sofia3g-fls/modem_cfg_emmc.prg
GEN_PRG_FROM_SRC := false

TARGET_NO_RECOVERY := true
BOARD_USE_FLS_PREBUILTS := $(TARGET_PRODUCT)
{{/fls_prebuilts}}

PARTITION_XML_PATH = $(CURDIR)/device/intel/${TARGET_BOARD_PLATFORM}/partition.xml
RAMLAYOUT_XML_PATH = $(CURDIR)/device/intel/${TARGET_BOARD_PLATFORM}/8192_ram_layout.xml

# Enable -DFEAT_RPC_SERVICE for various IMC services
FEAT_MSM := YES

# HACK to work around lack of PAE kernel override
override LIBART_IMG_TARGET_BASE_ADDRESS := 0x30000000

SECURE_PLAYBACK_ENABLE := true
