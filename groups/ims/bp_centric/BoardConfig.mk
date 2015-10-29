# add IMS overlay and WFC overlays folders only if AOSP dependency is available
ifneq ($(wildcard frameworks/opt/telephony/src/java/com/android/internal/telephony/OemPhoneCreator*),)
   DEVICE_PACKAGE_OVERLAYS += device/intel/common/ims/overlay
   DEVICE_PACKAGE_OVERLAYS += device/intel/common/s2b/overlay

# IMS Properties
{{#ims_enabled}}
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.ims_support=1
{{/ims_enabled}}

# IMS Properties
{{#s2b_enabled}}
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.s2b_support=1
{{/s2b_enabled}}
endif
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/bp_centric/
