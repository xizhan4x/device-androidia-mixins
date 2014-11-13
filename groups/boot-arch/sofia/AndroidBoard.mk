
FLSTOOL := $(BUILD_OUT_EXECUTABLES)/FlsTool

SYSTEM_FLS      := $(PRODUCT_OUT)/fls/system.fls
USERDATA_FLS    := $(PRODUCT_OUT)/fls/userdata.fls
CACHE_FLS       := $(PRODUCT_OUT)/fls/cache.fls
BOOTIMG_FLS     := $(PRODUCT_OUT)/fls/boot.fls
RECOVERY_FLS    := $(PRODUCT_OUT)/fls/recovery.fls

ALL_ANDROID_FLS := $(SYSTEM_FLS) $(USERDATA_FLS) $(CACHE_FLS) $(BOOTIMG_FLS)

droidcore: $(ALL_ANDROID_FLS)

flashfiledir:
	mkdir -p $(PRODUCT_OUT)/fls

$(ALL_ANDROID_FLS): flashfiledir \
					$(FLSTOOL) \
					$(BOARD_PRG_FILE) \
					$(FLASHLOADER_FLS) \

FLSTOOL_CMDLINE := $(FLSTOOL) \
						--replace --to-fls2 \
						--prg $(BOARD_PRG_FILE) \
						$(INJECT_FLASHLOADER_FLS) \

$(SYSTEM_FLS): systemimage
	$(FLSTOOL_CMDLINE) --output $@ --tag SYSTEM $(INSTALLED_SYSTEMIMAGE)

$(USERDATA_FLS): userdataimage
	$(FLSTOOL_CMDLINE) --output $@ --tag USERDATA $(INSTALLED_USERDATAIMAGE_TARGET)

$(CACHE_FLS): cacheimage
	$(FLSTOOL_CMDLINE) --output $@ --tag CACHE $(INSTALLED_CACHEIMAGE_TARGET)

$(BOOTIMG_FLS): bootimage
	$(FLSTOOL_CMDLINE) --output $@ --tag BOOT_IMG $(INSTALLED_BOOTIMAGE_TARGET)

#$(RECOVERY_FLS): $(INSTALLED_RECOVERYIMAGE_TARGET)
#	$(FLSTOOL_CMDLINE) --output $@ --tag RECOVERY $(INSTALLED_RECOVERYIMAGE_TARGET):3

