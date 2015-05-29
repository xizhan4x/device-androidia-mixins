# WCS remoting solution for ENG and USERDEBUG
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
       rservice \
       at_cli_client
endif

