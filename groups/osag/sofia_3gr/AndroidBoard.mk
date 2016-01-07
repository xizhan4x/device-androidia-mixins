ifneq ($(BUILD_MODEM_FROM_SRC), true)
BUILT_MODEM := $(SOFIA_FW_SRC_BASE)/modem/prebuilt/$(MODEM_PLATFORM)/$(MODEM_PROJECTNAME).ihex
else
GEN_SECBIN_FILES := true
BUILD_THREADX_FROM_SRC := true
BUILD_3GFW_FROM_SRC := true
GEN_THREADX_FLS_FILES:= true
endif
BUILD_OSAS := 1
NON_IMC_BUILD := true
export NON_IMC_BUILD
include device/intel/common/boot/sofia/sofia-base.mk
