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
