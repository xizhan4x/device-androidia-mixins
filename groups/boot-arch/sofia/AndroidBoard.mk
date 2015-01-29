
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

BUILD_BOOTCORE_FROM_SRC := true
MODEM_PLATFORM := {{{modem_platform}}}
MODEM_PROJECTNAME := {{{modem_projectname}}}
SOCLIB_SRC_PATH := $(CURDIR)/soclib
MOBILEVISOR_SVC_PATH := $(CURDIR)/mobilevisor/services
MOBILEVISOR_SRC_PATH := $(CURDIR)/mobilevisor/products
MOBILEVISOR_REL_PATH := $(CURDIR)/mobilevisor/release
MOBILEVISOR_GUEST_PATH := $(CURDIR)/mobilevisor/guests
FLASHFILES_DIR := $(PRODUCT_OUT)/fls
VBT_GENERATE_TOOL := $(MOBILEVISOR_REL_PATH)/tools/vbtgen
BUILD_VMM_FROM_SRC := true
BUILD_SECVM_FROM_SRC := true
MV_CONFIG_BITNESS := {{{bitness}}}
MV_CONFIG_CHIP_VER := {{{mv_config_chip_ver}}}
GEN_VMM_FLS_FILES := true
SECVM_SRC_PATH := $(CURDIR)/secure_vm
NON_IMC_BUILD := true
BUILT_MODEM := $(CURDIR)/modem/prebuilt/$(MODEM_PLATFORM)/$(MODEM_PROJECTNAME).ihex
export NON_IMC_BUILD
SPLASH_IMG_GENERATE_TOOL := $(MOBILEVISOR_REL_PATH)/tools/splash_img_generate

createflashfile_dir:
	mkdir -p $(FLASHFILES_DIR)

droidcore: createflashfile_dir


include device/intel/common/boot/sofia/soclib.mk
include device/intel/common/boot/sofia/mobilevisor_svc.mk
include device/intel/common/boot/sofia/bootcore.mk
include device/intel/common/boot/sofia/mobilevisor_config.mk
include device/intel/common/boot/sofia/mobilevisor.mk
include device/intel/common/boot/sofia/secvm.mk
include device/intel/common/boot/sofia/modem.mk

