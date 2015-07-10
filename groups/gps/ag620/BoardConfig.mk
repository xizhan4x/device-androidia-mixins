INTEL_GNSS_ENABLED := y
INTEL_GNSS_INSTALL_DIR := gnss
BOARD_USE_LBS_GNSS := true

BOARD_SEPOLICY_DIRS += \
		device/intel/sepolicy/gps/common \
		device/intel/sepolicy/gps/ag620
