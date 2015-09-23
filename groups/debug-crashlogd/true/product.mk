ifeq ($(MIXIN_DEBUG_LOGS),true)
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/init.crashlogd.rc:root/init.crashlogd.rc \
	$(call add-to-product-copy-files-if-exists,$(LOCAL_PATH)/ingredients.conf:$(TARGET_COPY_OUT_VENDOR)/etc/ingredients.conf) \
	$(call add-to-product-copy-files-if-exists,$(LOCAL_PATH)/crashlog.conf:$(TARGET_COPY_OUT_VENDOR)/etc/crashlog.conf)
PRODUCT_PACKAGES += crashlogd \
	dumpstate_dropbox.sh
endif
