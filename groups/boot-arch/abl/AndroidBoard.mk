
# Partition table configuration file
BOARD_GPT_INI ?= $(TARGET_DEVICE_DIR)/gpt.ini
BOARD_GPT_BIN = $(PRODUCT_OUT)/gpt.bin
GPT_INI2BIN := ./device/intel/common/gpt_bin/gpt_ini2bin.py

$(BOARD_GPT_BIN): $(BOARD_GPT_INI)
	$(hide) $(GPT_INI2BIN) $< > $@
	$(hide) echo GEN $(notdir $@)

BOARD_FLASHFILES += $(BOARD_GPT_BIN):gpt.bin

# REVERT-ME create GPT IMG for ELK installer script
BOARD_GPT_IMG = $(PRODUCT_OUT)/gpt.img
BOARD_FLASHFILES += $(BOARD_GPT_IMG):gpt.img

GPT_INI2IMG := ./device/intel/build/create_gpt_image.py

intermediate_img := $(call intermediates-dir-for,PACKAGING,flashfiles)/gpt.img

$(BOARD_GPT_IMG): $(BOARD_GPT_INI)
	$(hide) mkdir -p $(dir $(intermediate_img))
	$(hide) $(GPT_INI2IMG) --create --table $< --size $(BOARD_MMC_SIZE) $(intermediate_img)
	$(hide) dd if=$(intermediate_img) of=$@ bs=512 count=34
	$(hide) echo GEN $(notdir $@)


# ABL FW and images files
# Use internal ABL if available, else external
BOARD_USE_ABL := true
ABL_AVAILABLE_CONFIG := gr_mrb gr_mrb_b1
ABL_AVAILABLE_CONFIG_PATH = $(TARGET_DEVICE_DIR)/abl
ABL_BUILD_OUT = $(ANDROID_PRODUCT_OUT)/ifwi_abl

ABL_PATH := vendor/intel/abl
ABL_PREBUILTS_INTERNAL := $(ABL_PATH)/abl_prebuilt/internal
ABL_PREBUILTS_EXTERNAL := $(ABL_PATH)/abl_prebuilt/external

ifneq ($(wildcard $(ABL_PREBUILTS_INTERNAL)),)
ABL_PREBUILT_PATH := $(ABL_PREBUILTS_INTERNAL)/$(TARGET_DEVICE)
else
ifneq ($(wildcard $(ABL_PREBUILTS_EXTERNAL)),)
ABL_PREBUILT_PATH := $(ABL_PREBUILTS_EXTERNAL)/$(TARGET_DEVICE)
else
$(error ABL package error : nor source, nor internal or external prebuilt are available)
endif
endif

define add_board_flashfiles_variant
$(eval BOARD_FLASHFILES_FIRMWARE_$(1) += $(ABL_BUILD_OUT)/ifwi_$(1).bin:ifwi.bin) \
$(eval BOARD_FLASHFILES_FIRMWARE_$(1) += $(ABL_BUILD_OUT)/ifwi_dnx_$(1).bin:ifwi_dnx.bin) \
$(eval BOARD_FLASHFILES_FIRMWARE_$(1) += $(ABL_BUILD_OUT)/dnxp_0x1_$(1).bin:dnxp_0x1.bin) \
$(eval BOARD_FLASHFILES_FIRMWARE_$(1) += $(PRODUCT_OUT)/bootloader.img:bootloader) \
$(eval BOARD_FLASHFILES_FIRMWARE_$(1) += $(TARGET_DEVICE_DIR)/fftf_build.opt:fftf_build.opt)
endef

ABL_AVAILABLE_IOC := $(wildcard $(ABL_PREBUILT_PATH)/ioc_firmware*)
BOARD_FLASHFILES += $(foreach ioc, $(ABL_AVAILABLE_IOC), $(ioc):$(notdir $(ioc)))

$(foreach config,$(ABL_AVAILABLE_CONFIG),$(call add_board_flashfiles_variant,$(config)))

# Rule to create $(OUT)/bootloader image, binaries within are signed with
# testing keys

BOARD_BLDR_SECOND_STAGE_BIN := $(PRODUCT_OUT)/abl/kf4abl.abl
BOARD_BOOTLOADER_IMG := $(PRODUCT_OUT)/bootloader.img
BOARD_BOOTLOADER_DIR := $(PRODUCT_OUT)/bootloader

INSTALLED_RADIOIMAGE_TARGET += $(BOARD_BOOTLOADER_IMG)

$(BOARD_BOOTLOADER_DIR):
	$(hide) rm -rf $(BOARD_BOOTLOADER_DIR)
	$(hide) mkdir -p $(BOARD_BOOTLOADER_DIR)

ifneq ($(BOARD_BOOTLOADER_PARTITION_SIZE),0)
$(BOARD_BOOTLOADER_IMG): $(BOARD_BOOTLOADER_DIR) mkext2img ifwi_update kf4abl-$(TARGET_BUILD_VARIANT)
	$(hide) $(ACP) -f $(BOARD_BLDR_SECOND_STAGE_BIN) $(BOARD_BOOTLOADER_DIR)/fastboot.bin
	mkext2img  $(BOARD_BOOTLOADER_IMG) $(BOARD_BOOTLOADER_BLOCK_SIZE) $(BOARD_BOOTLOADER_PARTITION_SIZE) $(BOARD_BOOTLOADER_DIR)
	echo "Bootloader image successfully generated $(BOARD_BOOTLOADER_IMG)"
else
	$(ACP) -f $(ABL_PREBUILT_PATH)/bldr_utils.img $(BOARD_BOOTLOADER_IMG)
endif

droidcore: $(BOARD_BOOTLOADER_IMG)
