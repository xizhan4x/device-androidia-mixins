# enable ish libsensorhub and ish sensor HAL
USE_ISH_SENSOR_HAL := true

# for sensorhubd selinux policy
BOARD_SEPOLICY_DIRS += device/intel/common/sepolicy/sensorhub

# Please keep this list in alphabetical order
BOARD_SEPOLICY_UNION += \
    device.te \
    file_contexts \
    file.te \
    sensorhubd.te \
    system_server.te
