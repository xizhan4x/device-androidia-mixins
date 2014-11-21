# Enable Phone Doctor for eng and userdebug builds
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_COPY_FILES += $(call add-to-product-copy-files-if-exists,\
    vendor/intel/tools/log_infra/crashinfo/crashinfo:system/bin/crashinfo:intel)
PRODUCT_PACKAGES += crash_package
endif
