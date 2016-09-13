PREBUILT_TOS_IMAGE_TARGET := $(TOPDIR)vendor/intel/fw/evmm/prebuilts/ikgt_pkg.bin
INSTALLED_TOS_IMAGE_TARGET := $(PRODUCT_OUT)/tos.img
TOS_SIGNING_KEY := $(PRODUCTS.$(INTERNAL_PRODUCT).PRODUCT_VERITY_SIGNING_KEY).pk8
TOS_SIGNING_CERT := $(PRODUCTS.$(INTERNAL_PRODUCT).PRODUCT_VERITY_SIGNING_KEY).x509.pem
# The product is prefixed with platform name
INTERNAL_PLATFORM := $(firstword $(subst _, " ", $(TARGET_PRODUCT)))

.PHONY: tosimage
tosimage: $(INSTALLED_TOS_IMAGE_TARGET)

$(INSTALLED_TOS_IMAGE_TARGET): $(PREBUILT_TOS_IMAGE_TARGET) $(MKBOOTIMG) $(BOOT_SIGNER)
	@echo "mkbootimg to create boot image for TOS file: $@"
	$(hide) $(MKBOOTIMG) --kernel $(PREBUILT_TOS_IMAGE_TARGET) --output $@
	$(if $(filter true,$(PRODUCTS.$(INTERNAL_PRODUCT).PRODUCT_SUPPORTS_BOOT_SIGNER)),\
		@echo "sign prebuilt TOS file: $@" &&\
		$(BOOT_SIGNER) /tos $@ $(TOS_SIGNING_KEY) $(TOS_SIGNING_CERT) $@)

# Prebuild the evmm_pkg.bin and lk.bin
.PHONY: $(PREBUILT_TOS_IMAGE_TARGET)
$(PREBUILT_TOS_IMAGE_TARGET):
	@echo "making lk.bin.."
	$(hide) (cd $(TOPDIR)trusty && $(TRUSTY_ENV_VAR) ./generate_prebuilt.sh)
	@echo "making tos image.."
	$(hide) (cd $(TOPDIR)vendor/intel/fw/evmm/$(INTERNAL_PLATFORM) && $(TRUSTY_ENV_VAR) ./generate_prebuilt.sh)

# Add dependence for flashfiles
INSTALLED_RADIOIMAGE_TARGET += $(INSTALLED_TOS_IMAGE_TARGET)
