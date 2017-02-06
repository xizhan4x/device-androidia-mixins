PRODUCT_PACKAGES += CellCoexApp

# Enable core dump for eng and userdebug builds
ifneq ($(TARGET_BUILD_VARIANT),user)
    # Verbose level of the service.
    PRODUCT_DEFAULT_PROPERTY_OVERRIDES += log.tag.CWS_CELLCOEX_MGR=DEBUG
    # Verbose level of the coexistence plugin.
    PRODUCT_DEFAULT_PROPERTY_OVERRIDES += log.tag.CWS_CELLCOEX_HANDLER=DEBUG
endif

# Enable geolocation feature
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.cellcoex.geoloc={{{geoloc}}}
