include $(CLEAR_VARS)
LOCAL_MODULE := add-sr300-to-usb-group
LOCAL_REQUIRED_MODULES := cameraserver
LOCAL_POST_INSTALL_CMD := $(hide) sed -i -e "/^\s*group.*camera/ { /\busb\b/ ! { s/\(^.*\$\)/\1 usb/ } }" $(TARGET_OUT)/etc/init/cameraserver.rc
include $(BUILD_PHONY_PACKAGE)
