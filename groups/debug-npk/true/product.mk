# There is a strong dependency on debug-logs; disable debug-npk if not set
ifeq ($(MIXIN_DEBUG_LOGS),true)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.npk.rc:root/init.npk.rc \
    {{{npk_cfg_path}}}/npk.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/npk.cfg
PRODUCT_PACKAGES += \
    npk_init \
    logd2sven

endif #MIXIN_DEBUG_LOGS
