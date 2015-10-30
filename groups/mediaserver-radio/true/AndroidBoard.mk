include $(CLEAR_VARS)
LOCAL_MODULE := mediaserver-radio
LOCAL_REQUIRED_MODULES := init.rc
LOCAL_POST_INSTALL_CMD := $(hide) sed -i 's/group audio [radio ]*/group audio radio /g' $(TARGET_ROOT_OUT)/init.rc
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)
include $(BUILD_PHONY_PACKAGE)
