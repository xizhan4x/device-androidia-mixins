ifndef PREBUILT_MULTIBOOT
TOS_IMAGE_TARGET := $(TRUSTY_BUILDROOT)/evmm_lk_pkg.bin
# The product is prefixed with platform name
INTERNAL_PLATFORM := $(firstword $(subst _, " ", $(TARGET_PRODUCT)))
LOCAL_MAKE := make

# Build the evmm_pkg.bin and lk.bin
.PHONY: $(TOS_IMAGE_TARGET)
$(TOS_IMAGE_TARGET): yoctotoolchain
	@echo "making lk.bin.."
	$(hide) (cd $(TOPDIR)trusty && $(TRUSTY_ENV_VAR) $(LOCAL_MAKE) {{{lk_project}}})
	@echo "making tos image.."
	$(hide) (cd $(TOPDIR)vendor/intel/fw/evmm/$(INTERNAL_PLATFORM) && $(TRUSTY_ENV_VAR) $(LOCAL_MAKE))

{{#tos_partition}}
#tos partition is assigned for trusty
INSTALLED_TOS_IMAGE_TARGET := $(PRODUCT_OUT)/tos.img
TOS_SIGNING_KEY := $(PRODUCTS.$(INTERNAL_PRODUCT).PRODUCT_VERITY_SIGNING_KEY).pk8
TOS_SIGNING_CERT := $(PRODUCTS.$(INTERNAL_PRODUCT).PRODUCT_VERITY_SIGNING_KEY).x509.pem

.PHONY: tosimage
tosimage: $(INSTALLED_TOS_IMAGE_TARGET)
$(INSTALLED_TOS_IMAGE_TARGET): $(TOS_IMAGE_TARGET) $(MKBOOTIMG) $(BOOT_SIGNER)
	@echo "mkbootimg to create boot image for TOS file: $@"
	$(hide) $(MKBOOTIMG) --kernel $(TOS_IMAGE_TARGET) --output $@
	$(if $(filter true,$(PRODUCTS.$(INTERNAL_PRODUCT).PRODUCT_SUPPORTS_BOOT_SIGNER)),\
		@echo "sign prebuilt TOS file: $@" &&\
		$(BOOT_SIGNER) /tos $@ $(TOS_SIGNING_KEY) $(TOS_SIGNING_CERT) $@)

INSTALLED_RADIOIMAGE_TARGET += $(INSTALLED_TOS_IMAGE_TARGET)
{{/tos_partition}}

{{^tos_partition}}
#tos partition is disabled and multiboot partition is assigned for trusty
IAS_IMAGE_APP := ias_image_app
IAS_IMAGE_SIGNER := ias_image_signer
IMAGE_TYPE := 0x40300
INSTALLED_MULTIBOOT_IMAGE_TARGET := $(PRODUCT_OUT)/multiboot.img

.PHONY: multiboot
multiboot: $(INSTALLED_MULTIBOOT_IMAGE_TARGET)
$(INSTALLED_MULTIBOOT_IMAGE_TARGET): $(TOS_IMAGE_TARGET) $(IAS_IMAGE_APP) $(IAS_IMAGE_SIGNER)
	$(IAS_IMAGE_APP) -o $(@:.img=.img_unsigned) -i $(IMAGE_TYPE) $(TOS_IMAGE_TARGET)
	$(IAS_IMAGE_SIGNER) $(@:.img=.img_unsigned) $(ABL_OS_KERNEL_KEY).pk8 \
        $(ABL_OS_KERNEL_KEY).x509.pem  $@
	@echo "Multiboot ABL image successfully generated at $(PRODUCT_OUT)/multiboot.img"

INSTALLED_RADIOIMAGE_TARGET += $(INSTALLED_MULTIBOOT_IMAGE_TARGET)
{{/tos_partition}}
else
INSTALLED_MULTIBOOT_IMAGE_TARGET := $(PRODUCT_OUT)/multiboot.img
.PHONY: multiboot
multiboot: $(INSTALLED_MULTIBOOT_IMAGE_TARGET)
$(INSTALLED_MULTIBOOT_IMAGE_TARGET): $(PREBUILT_MULTIBOOT)
	$(hide) cp $(PREBUILT_MULTIBOOT) $(INSTALLED_MULTIBOOT_IMAGE_TARGET)
	@echo "Multiboot ABL image successfully generated at $(PRODUCT_OUT)/multiboot.img"
INSTALLED_RADIOIMAGE_TARGET += $(INSTALLED_MULTIBOOT_IMAGE_TARGET)
endif
