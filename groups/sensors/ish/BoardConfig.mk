# enable ish libsensorhub and ish sensor HAL
USE_ISH_SENSOR_HAL := true

# for sensorhubd selinux policy
# Please keep this list in alphabetical order
BOARD_SEPOLICY_UNION += sensorhubd.te
