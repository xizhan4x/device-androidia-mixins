PRODUCT_BOOT_JARS += com.intel.internal.cellcoex.plugin
BOARD_HAVE_CELLCOEX := true

# Enable core dump for eng and userdebug builds
ifneq ($(TARGET_BUILD_VARIANT),user)
    # Verbose level of the service.
    ADDITIONAL_DEFAULT_PROPERTIES += log.tag.CWS_CELLCOEX_MGR=DEBUG
    # Verbose level of the coexistence plugin.
    ADDITIONAL_DEFAULT_PROPERTIES += log.tag.CWS_CELLCOEX_HANDLER=DEBUG
endif

# Enable Cellular Coexistence NRT (Non Real Time)
ADDITIONAL_DEFAULT_PROPERTIES += config.disable_cellcoex=0

# Enable Cellular coexistence RT (Real Time).
ADDITIONAL_DEFAULT_PROPERTIES += service.cellcoexmgr.rtcoex=1

# sepolicy rules enhancement for cellcoex
BOARD_SEPOLICY_DIRS += device/intel/common/sepolicy/cellcoex/in_system_server
BOARD_SEPOLICY_UNION += \
    hostapd.te \
    service_contexts \
    system_server.te
