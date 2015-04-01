#setting for embms dep in framework
TARGET_HAS_EMBMS_ENABLE := true

BOARD_SEPOLICY_DIRS += device/intel/common/sepolicy/embms

BOARD_SEPOLICY_UNION +=\
    embmsserver.te \
    installd.te \
    netd.te \
    platform_app.te \
    seapp_contexts \
    service.te \
    service_contexts \
    system_server.te
