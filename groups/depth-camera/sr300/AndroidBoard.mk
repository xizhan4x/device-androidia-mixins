include $(CLEAR_VARS)
LOCAL_MODULE := add-sr300-to-usb-group
LOCAL_REQUIRED_MODULES := init.rc
LOCAL_POST_INSTALL_CMD := $(hide) sed -i 's/\(group.*camera\) \(usb \)*/\1 usb /g' $(TARGET_ROOT_OUT)/init.rc
include $(BUILD_PHONY_PACKAGE)
