PRODUCT_PACKAGES += \
	efiprop

TELEPHONY_OEMVARS := $(wildcard device/intel/common/telephony-config/oemvars*)
BOARD_FLASHFILES += $(foreach oem,$(TELEPHONY_OEMVARS),$(oem):$(notdir $(oem)))