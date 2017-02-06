# add IMS package (fast track)  only if AOSP dependency is available
ifneq ($(wildcard frameworks/opt/telephony/src/java/com/android/internal/telephony/OemPhoneCreator*),)
#ENABLE_RCS := true
PRODUCT_PACKAGES += \
    com.intel.internal.telephony.imsconverged \
    IMSConfigUI \
    ImsService \
    imsstackservice \
    IntelIms
endif

# add IMS overlay and WFC overlays folders only if AOSP dependency is available
ifneq ($(wildcard frameworks/opt/telephony/src/java/com/android/internal/telephony/OemPhoneCreator*),)
   DEVICE_PACKAGE_OVERLAYS += device/intel/common/ims/overlay
   DEVICE_PACKAGE_OVERLAYS += device/intel/common/s2b/overlay

# IMS Properties
{{#ims_enabled}}
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.ims_support=2
{{/ims_enabled}}

# IMS Properties
{{#s2b_enabled}}
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.s2b_support=1
{{/s2b_enabled}}
endif
