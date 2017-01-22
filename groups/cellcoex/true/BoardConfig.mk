BOARD_HAVE_CELLCOEX := true
BOARD_HAVE_CELLCOEX_APK := true

# Enable core dump for eng and userdebug builds
ifneq ($(TARGET_BUILD_VARIANT),user)
    # Verbose level of the service.
    PRODUCT_DEFAULT_PROPERTY_OVERRIDES += log.tag.CWS_CELLCOEX_MGR=DEBUG
    # Verbose level of the coexistence plugin.
    PRODUCT_DEFAULT_PROPERTY_OVERRIDES += log.tag.CWS_CELLCOEX_HANDLER=DEBUG
endif

# Enable geolocation feature
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.cellcoex.geoloc={{{geoloc}}}

# sepolicy rules enhancement for cellcoex
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/cellcoex/in_system_apk/btcoex_{{{btcoex_role}}}
