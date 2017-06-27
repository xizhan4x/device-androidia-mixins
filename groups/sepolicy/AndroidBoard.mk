include $(CLEAR_VARS)
LOCAL_MODULE := sepolicy-areq-checker
LOCAL_REQUIRED_MODULES := sepolicy
LOCAL_ADDITIONAL_DEPENDENCIES := sepolicy

#
# On user builds, enforce that open tickets are considered violations.
#
ifeq ($(TARGET_BUILD_VARIANT),user)
LOCAL_USER_OPTIONS := -i
endif

LOCAL_POST_INSTALL_CMD := device/intel/sepolicy/tools/capchecker $(LOCAL_USER_OPTIONS) -p device/intel/sepolicy/tools/caps.conf $(TARGET_ROOT_OUT)/sepolicy

include $(BUILD_PHONY_PACKAGE)
