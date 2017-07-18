include $(CLEAR_VARS)
LOCAL_MODULE := ioc-slcan-reboot
ifeq ($(PLATFORM_VERSION), 8.0.0)
LOCAL_REQUIRED_MODULES := init.rc cansend candump slcan_attach slcand ioc_slcand ifconfig_static
else
LOCAL_REQUIRED_MODULES := init.rc cansend candump slcan_attach slcand ioc_slcand toybox_static
endif
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)
include $(BUILD_PHONY_PACKAGE)
