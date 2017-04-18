
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
ABL_BUILD_OUT = $(PRODUCT_OUT)/ifwi_abl

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

BOARD_BLDR_SECOND_STAGE_BIN := $(PRODUCT_OUT)/abl/kf4abl.abl
BOARD_BOOTLOADER_DIR := $(PRODUCT_OUT)/bootloader
BOARD_BOOTLOADER_DEFAULT_IMG := $(PRODUCT_OUT)/bootloader.img
INSTALLED_RADIOIMAGE_TARGET += $(BOARD_BOOTLOADER_DEFAULT_IMG)

define add_board_flashfiles_variant
$(eval BOARD_FLASHFILES_FIRMWARE_$(1) += $(ABL_BUILD_OUT)/ifwi_$(1).bin:ifwi.bin) \
$(eval BOARD_FLASHFILES_FIRMWARE_$(1) += $(ABL_BUILD_OUT)/ifwi_dnx_$(1).bin:ifwi_dnx.bin) \
$(eval BOARD_FLASHFILES_FIRMWARE_$(1) += $(ABL_BUILD_OUT)/dnxp_0x1_$(1).bin:dnxp_0x1.bin) \
$(eval BOARD_FLASHFILES_FIRMWARE_$(1) += $(BOARD_BOOTLOADER_DIR)/$(1)/bootloader.img:bootloader) \
$(eval BOARD_FLASHFILES_FIRMWARE_$(1) += $(TARGET_DEVICE_DIR)/fftf_build.opt:fftf_build.opt)
endef

ABL_AVAILABLE_IOC := $(wildcard $(ABL_PREBUILT_PATH)/ioc_firmware*)
BOARD_FLASHFILES += $(foreach ioc, $(ABL_AVAILABLE_IOC), $(ioc):$(notdir $(ioc)))

$(foreach config,$(ABL_AVAILABLE_CONFIG),$(call add_board_flashfiles_variant,$(config)))

$(BOARD_BOOTLOADER_DIR):
	$(hide) rm -rf $(BOARD_BOOTLOADER_DIR)
	$(hide) mkdir -p $(BOARD_BOOTLOADER_DIR)
	$(foreach config,$(ABL_AVAILABLE_CONFIG),mkdir -p $(BOARD_BOOTLOADER_DIR)/$(config)/out)

ifneq ($(BOARD_BOOTLOADER_PARTITION_SIZE),0)
define generate_bootloader_var
$(eval BOARD_BOOTLOADER_VAR_IMG := $(BOARD_BOOTLOADER_DIR)/$(1)/bootloader.img)
$(hide) $(ACP) -f $(BOARD_BLDR_SECOND_STAGE_BIN) $(BOARD_BOOTLOADER_DIR)/$(1)/out/osloader.bin
$(hide) dd of=$(BOARD_BOOTLOADER_VAR_IMG) if=$(BOARD_BOOTLOADER_DIR)/$(1)/out/ifwi_update.bin bs=1024
$(hide) dd of=$(BOARD_BOOTLOADER_VAR_IMG) if=$(BOARD_BOOTLOADER_DIR)/$(1)/out/osloader.bin bs=1024 seek=8000
cp $(BOARD_BOOTLOADER_VAR_IMG) $(BOARD_BOOTLOADER_DEFAULT_IMG)
echo "Bootloader image successfully generated $(BOARD_BOOTLOADER_VAR_IMG)"
endef

bootloader: $(BOARD_BOOTLOADER_DIR) ifwi_update mkext2img kf4abl-$(TARGET_BUILD_VARIANT)
	$(foreach config,$(ABL_AVAILABLE_CONFIG),$(call generate_bootloader_var,$(config)))
else
bootloader: $(BOARD_BOOTLOADER_DIR)
	$(ACP) -f $(ABL_PREBUILT_PATH)/bldr_utils.img $(BOARD_BOOTLOADER_DEFAULT_IMG)
	$(foreach config,$(ABL_AVAILABLE_CONFIG),cp -v $(BOARD_BOOTLOADER_DEFAULT_IMG) $(BOARD_BOOTLOADER_DIR)/$(config)/)
endif

$(BOARD_BOOTLOADER_DIR)/%/bootloader.img: bootloader
	@echo "Generate bootloader: $@ finished."

$(BOARD_BOOTLOADER_DEFAULT_IMG): bootloader
	@echo "Generate default bootloader: $@ finished."
droidcore: bootloader

.PHONY: bootloader
