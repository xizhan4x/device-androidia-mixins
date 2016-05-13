ifeq ($(TARGET_BUILD_VARIANT),user)
# For security concerns, the software scalability based on EFI
# variable is disabled on USER build.  Static configuration
# $(TELEPHONY_CONFIG) is selected instead
ADDITIONAL_DEFAULT_PROPERTIES += $(shell cat $(TELEPHONY_PROP_DIR)/$(TELEPHONY_CONFIG).prop)
else
OEMVARS_OUT = $(PRODUCT_OUT)/oemvars
TELEPHONY_OEMVARS := $(subst .prop,.txt,$(notdir $(wildcard $(TELEPHONY_PROP_DIR)/*.prop)))
BOARD_FLASHFILES += $(foreach prop,$(TELEPHONY_OEMVARS),$(addprefix $(OEMVARS_OUT)/oemvars-telephony-config-,$(prop)):oemvars-telephony-config-$(prop))
endif

BOARD_SEPOLICY_M4DEFS += module_telephony_config=true
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/telephony-config/dynamic
