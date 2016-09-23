include $(CLEAR_VARS)
LOCAL_MODULE := ioc-slcan-reboot
LOCAL_REQUIRED_MODULES := init.rc cansend slcan_attach slcand ioc_slcan.sh
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)
LOCAL_POST_INSTALL_CMD := $(hide) sed -i 's;\(on property:sys.powerctl=\*\);\1\n    exec u:r:ioc_slcan:s0 -- /sbin/ioc_slcan.sh;' $(TARGET_ROOT_OUT)/init.rc
include $(BUILD_PHONY_PACKAGE)
