# add IMS overlay folder only if AOSP dependency is available
ifneq ($(wildcard frameworks/opt/telephony/src/java/com/android/internal/telephony/OemPhoneCreator*),)
   DEVICE_PACKAGE_OVERLAYS += device/intel/common/ims/overlay

# IMS Properties
{{#ims_enabled}}
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.ims_support=1
{{/ims_enabled}}
endif


