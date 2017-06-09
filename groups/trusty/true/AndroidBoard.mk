ifndef PREBUILT_MULTIBOOT
# The product is prefixed with platform name
INTERNAL_PLATFORM := $(firstword $(subst _, " ", $(TARGET_PRODUCT)))
LOCAL_MAKE := make

.PHONY: evmm_lk_build tosimage multiboot

# Build evmm and lk
evmm_lk_build: yoctotoolchain
	@echo "making lk.bin.."
	$(hide) (cd $(TOPDIR)trusty && $(TRUSTY_ENV_VAR) $(LOCAL_MAKE) {{{lk_project}}})
	@echo "making tos image.."
	$(hide) (cd $(TOPDIR)vendor/intel/fw/evmm/$(INTERNAL_PLATFORM) && $(TRUSTY_ENV_VAR) $(LOCAL_MAKE))

# Bootloader is Kernelflinger(EFI)
# Use unified binary for vmm and lk: evmm_lk_pkg.bin --> tos.img
ifeq ({{boot-arch}}, efi)
EVMM_LK_PKG_TARGET := $(TRUSTY_BUILDROOT)evmm_lk_pkg.bin

INSTALLED_TOS_IMAGE_TARGET := $(PRODUCT_OUT)/tos.img
TOS_SIGNING_KEY := $(PRODUCTS.$(INTERNAL_PRODUCT).PRODUCT_VERITY_SIGNING_KEY).pk8
TOS_SIGNING_CERT := $(PRODUCTS.$(INTERNAL_PRODUCT).PRODUCT_VERITY_SIGNING_KEY).x509.pem

tosimage: $(INSTALLED_TOS_IMAGE_TARGET)
$(INSTALLED_TOS_IMAGE_TARGET): evmm_lk_build $(MKBOOTIMG) $(BOOT_SIGNER)
	@echo "mkbootimg to create boot image for TOS file: $@"
	$(hide) $(MKBOOTIMG) --kernel $(EVMM_LK_PKG_TARGET) --output $@
	$(if $(filter true,$(PRODUCTS.$(INTERNAL_PRODUCT).PRODUCT_SUPPORTS_BOOT_SIGNER)),\
		@echo "sign prebuilt TOS file: $@" &&\
		$(BOOT_SIGNER) /tos $@ $(TOS_SIGNING_KEY) $(TOS_SIGNING_CERT) $@)

INSTALLED_RADIOIMAGE_TARGET += $(INSTALLED_TOS_IMAGE_TARGET)

# Bootloader is ABL
# Use separate binaries for vmm and lk: evmm_pkg.bin --> multiboot.img, lk.bin --> tos.img
else ifeq ({{boot-arch}}, abl)
LK_TARGET := $(TRUSTY_BUILDROOT)build-{{{lk_project}}}/lk.bin
EVMM_PKG_TARGET := $(TRUSTY_BUILDROOT)evmm_pkg.bin

IAS_IMAGE_APP := ias_image_app
IAS_IMAGE_SIGNER := ias_image_signer

SIGNING_KEY := $(ABL_OS_KERNEL_KEY).pk8
SIGNING_CERT := $(ABL_OS_KERNEL_KEY).x509.pem

IMAGE_TYPE := 0x40300

INSTALLED_MULTIBOOT_IMAGE_TARGET := $(PRODUCT_OUT)/multiboot.img
INSTALLED_TOS_IMAGE_TARGET := $(PRODUCT_OUT)/tos.img

multiboot: $(INSTALLED_MULTIBOOT_IMAGE_TARGET)
$(INSTALLED_MULTIBOOT_IMAGE_TARGET): evmm_lk_build $(IAS_IMAGE_APP) $(IAS_IMAGE_SIGNER)
	$(IAS_IMAGE_APP) -o $(@:.img=.img_unsigned) -i $(IMAGE_TYPE) $(EVMM_PKG_TARGET)
	$(IAS_IMAGE_SIGNER) $(@:.img=.img_unsigned) $(SIGNING_KEY) $(SIGNING_CERT) $@
	@echo "Multiboot ABL image successfully generated at $(PRODUCT_OUT)/multiboot.img"

tosimage:$(INSTALLED_TOS_IMAGE_TARGET)

ifeq (true,$(BOARD_AVB_ENABLE)) # BOARD_AVB_ENABLE == true
$(INSTALLED_TOS_IMAGE_TARGET): evmm_lk_build $(MKBOOTIMG) $(AVBTOOL)
	@echo "mkbootimg to create boot image for TOS file: $@"
	$(hide) $(MKBOOTIMG) --kernel $(LK_TARGET) --output $@
	$(hide) $(AVBTOOL) add_hash_footer \
		--image $@ \
		--partition_size $(BOARD_TOSIMAGE_PARTITION_SIZE) \
		--partition_name tos $(INTERNAL_AVB_SIGNING_ARGS)
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --include_descriptors_from_image $(INSTALLED_TOS_IMAGE_TARGET)
else
$(INSTALLED_TOS_IMAGE_TARGET): evmm_lk_build $(MKBOOTIMG) $(BOOT_SIGNER)
	@echo "mkbootimg to create boot image for TOS file: $@"
	$(hide) $(MKBOOTIMG) --kernel $(LK_TARGET) --output $@
	$(if $(filter true,$(PRODUCTS.$(INTERNAL_PRODUCT).PRODUCT_SUPPORTS_BOOT_SIGNER)),\
		@echo "sign prebuilt TOS file: $@" &&\
		$(BOOT_SIGNER) /tos $@ $(SIGNING_KEY) $(SIGNING_CERT) $@)
endif

INSTALLED_RADIOIMAGE_TARGET += $(INSTALLED_TOS_IMAGE_TARGET)
INSTALLED_RADIOIMAGE_TARGET += $(INSTALLED_MULTIBOOT_IMAGE_TARGET)

endif

else
INSTALLED_MULTIBOOT_IMAGE_TARGET := $(PRODUCT_OUT)/multiboot.img
.PHONY: multiboot
multiboot: $(INSTALLED_MULTIBOOT_IMAGE_TARGET)
$(INSTALLED_MULTIBOOT_IMAGE_TARGET): $(PREBUILT_MULTIBOOT)
	$(hide) cp $(PREBUILT_MULTIBOOT) $(INSTALLED_MULTIBOOT_IMAGE_TARGET)
	@echo "Multiboot ABL image successfully generated at $(PRODUCT_OUT)/multiboot.img"
INSTALLED_RADIOIMAGE_TARGET += $(INSTALLED_MULTIBOOT_IMAGE_TARGET)
endif
