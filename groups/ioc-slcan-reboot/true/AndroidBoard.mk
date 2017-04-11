include $(CLEAR_VARS)
LOCAL_MODULE := ioc-slcan-reboot
LOCAL_REQUIRED_MODULES := init.rc cansend candump slcan_attach slcand ioc_slcand ifconfig_static
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)
include $(BUILD_PHONY_PACKAGE)
