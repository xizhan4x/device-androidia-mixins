PRODUCT_PACKAGES += libhoudini houdini
PRODUCT_PROPERTY_OVERRIDES += ro.dalvik.vm.isa.arm=x86 ro.enable.native.bridge.exec=1

ifeq ($(TARGET_SUPPORTS_64_BIT_APPS),true)
PRODUCT_PACKAGES += houdini64
PRODUCT_PROPERTY_OVERRIDES += ro.dalvik.vm.isa.arm64=x86_64 ro.enable.native.bridge.exec64=1
endif

PRODUCT_DEFAULT_PROPERTY_OVERRIDES := ro.dalvik.vm.native.bridge=libhoudini.so $(PRODUCT_DEFAULT_PROPERTY_OVERRIDES)
