ifeq ($(MIXIN_DEBUG_LOGS),true)
PRODUCT_COPY_FILES += $(LOCAL_PATH)/init.coredump.rc:root/init.coredump.rc
endif
