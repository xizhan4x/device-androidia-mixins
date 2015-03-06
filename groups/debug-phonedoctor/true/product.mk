ifeq ($(MIXIN_DEBUG_LOGS),true)
PRODUCT_COPY_FILES += $(call add-to-product-copy-files-if-exists,\
    vendor/intel/tools/log_infra/crashinfo/crashinfo:system/bin/crashinfo:intel)
PRODUCT_PACKAGES += crash_package
endif
