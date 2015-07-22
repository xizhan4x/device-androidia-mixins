# enable ish libsensorhub and ish sensor HAL
USE_ISH_SENSOR_HAL := true

# for sensorhubd selinux policy
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/sensorhub
