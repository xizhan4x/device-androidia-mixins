# sepolicy rules enhancement for shutdown animation
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/shutdownanim
BOARD_SEPOLICY_UNION += \
    shutdownanim.te \
    system_server.te

INTEL_FEATURE_SHUTDOWNANIM_SUPPORT := true

