simuimage_bin := $(PRODUCT_OUT)/$(TARGET_PRODUCT).img
simuimage_bin_zip := $(PRODUCT_OUT)/$(TARGET_PRODUCT).zip

simuimage_size := 5368709120

$(simuimage_bin): \
	bootloader \
	bootimage \
	recoveryimage \
	systemimage \
	userdataimage \
	cacheimage \
	$(SIMG2IMG)

	$(hide) rm -f $(PRODUCT_OUT)/*.decomp
	$(hide) rm -f $(simuimage_bin)

	$(SIMG2IMG) $(INSTALLED_SYSTEMIMAGE) $(INSTALLED_SYSTEMIMAGE).decomp
	$(SIMG2IMG) $(ANDROID_BUILD_TOP)/$(PRODUCT_OUT)/cache.img $(ANDROID_BUILD_TOP)/$(PRODUCT_OUT)/cache.img.decomp
	$(SIMG2IMG) $(ANDROID_BUILD_TOP)/$(PRODUCT_OUT)/userdata.img $(ANDROID_BUILD_TOP)/$(PRODUCT_OUT)/userdata.img.decomp

	device/intel/build/create_gpt_image.py \
		--create $(ANDROID_BUILD_TOP)/$@ \
		--block $(BOARD_FLASH_BLOCK_SIZE) \
		--table $(ANDROID_BUILD_TOP)/$(BOARD_GPT_INI) \
		--size $(simuimage_size)B \
		--bootloader $(bootloader_bin) \
		--bootloader2 $(bootloader_bin) \
		--boot $(ANDROID_BUILD_TOP)/$(INSTALLED_BOOTIMAGE_TARGET) \
		--recovery $(ANDROID_BUILD_TOP)/$(INSTALLED_RECOVERYIMAGE_TARGET) \
		--misc none \
		--metadata none \
		--system $(ANDROID_BUILD_TOP)/$(INSTALLED_SYSTEMIMAGE).decomp \
		--cache $(ANDROID_BUILD_TOP)/$(PRODUCT_OUT)/cache.img.decomp \
		--data $(ANDROID_BUILD_TOP)/$(PRODUCT_OUT)/userdata.img.decomp \
		--persistent none \
		--factory none

$(simuimage_bin_zip): $(simuimage_bin)
	zip $@ $(simuimage_bin)

BOARD_FLASHFILES += $(simuimage_bin_zip):$(TARGET_PRODUCT).zip

.PHONY: simuimage
simuimage: $(simuimage_bin)
