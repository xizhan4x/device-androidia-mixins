# enable ish libsensorhub and ish sensor HAL
USE_SCALABLE_SENSOR_HAL := true

# for sensorhubd selinux policy
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/sensorhub

# if audio classifer avaliable
ENABLE_AUDIO_CLASSIFIER := {{{audio_classifier}}}
