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

# Use internal ABL if available, else external
BOARD_USE_ABL := true
ABL_AVAILABLE_CONFIG := {{config}}
ABL_AVAILABLE_CONFIG_PATH = $(TARGET_DEVICE_DIR)/abl
ABL_BUILD_OUT = $(ANDROID_PRODUCT_OUT)/abl

ABL_PATH := vendor/intel/abl
ABL_PREBUILTS_INTERNAL := $(ABL_PATH)/abl_prebuilt/internal
ABL_PREBUILTS_EXTERNAL := $(ABL_PATH)/abl/abl_prebuilt/external

ifneq ($(wildcard $(ABL_PREBUILTS_INTERNAL)),)
ABL_PREBUILT_PATH := $(ABL_PREBUILTS_INTERNAL)/{{prebuilts_dir}}
else
ifneq ($(wildcard $(ABL_PREBUILTS_EXTERNAL)),)
ABL_PREBUILT_PATH := $(ABL_PREBUILTS_EXTERNAL)/{{prebuilts_dir}}
else
$(error ABL package error : nor source, nor internal or external prebuilt are available)
endif
endif

ABL_AVAILABLE_IOC := $(wildcard $(ABL_PREBUILT_PATH)/ioc_firmware*)
BOARD_FLASHFILES += $(foreach ioc, $(ABL_AVAILABLE_IOC), $(ioc):$(notdir $(ioc)))
BOARD_FLASHFILES += $(ABL_PREBUILT_PATH)/bldr_utils.img:bldr_utils.img
BOARD_FLASHFILES += $(foreach config, $(ABL_AVAILABLE_CONFIG), $(ABL_BUILD_OUT)/ifwi_$(config).bin:ifwi_$(config).bin)
INSTALLED_RADIOIMAGE_TARGET += $(foreach config, $(ABL_AVAILABLE_CONFIG), $(ABL_BUILD_OUT)/ifwi_$(config).bin)

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
