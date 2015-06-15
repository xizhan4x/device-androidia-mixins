ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_COPY_FILES += device/intel/common/debug/init.lmdump.rc:root/init.lmdump.rc
endif
