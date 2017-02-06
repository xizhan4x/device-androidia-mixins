# To change the default telephony configuration set the following
# variable to the appropriate telephony configuration name.
TELEPHONY_CONFIG ?= {{user_build_config}}

ifeq ($(TARGET_BUILD_VARIANT),user)
TELEPHONY_FOUND_CONFIGS := $(wildcard $(TELEPHONY_CATALOG_DIR)/$(TELEPHONY_CONFIG)/*.xml)
else
PRODUCT_COPY_FILES += device/intel/common/telephony-config/init.telephony-config.rc:root/init.telephony-config.rc
TELEPHONY_FOUND_CONFIGS := $(wildcard $(TELEPHONY_CATALOG_DIR)/*/*.xml)
endif

PRODUCT_COPY_FILES += \
    $(foreach _conf, $(TELEPHONY_FOUND_CONFIGS), $(_conf):$(TELEPHONY_OUT_CATALOG_DIR)/$(patsubst $(TELEPHONY_CATALOG_DIR)/%,%,$(_conf)))

ifeq ($(TARGET_BUILD_VARIANT),user)
# For security concerns, the software scalability based on EFI
# variable is disabled on USER build.  Static configuration
# $(TELEPHONY_CONFIG) is selected instead
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += $(shell cat $(TELEPHONY_PROP_DIR)/$(TELEPHONY_CONFIG).prop)
else
OEMVARS_OUT = $(PRODUCT_OUT)/oemvars
TELEPHONY_OEMVARS := $(subst .prop,.txt,$(notdir $(wildcard $(TELEPHONY_PROP_DIR)/*.prop)))
BOARD_FLASHFILES += $(foreach prop,$(TELEPHONY_OEMVARS),$(addprefix $(OEMVARS_OUT)/oemvars-telephony-config-,$(prop)):oemvars-telephony-config-$(prop))
endif
