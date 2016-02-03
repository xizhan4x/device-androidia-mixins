USE_INTEL_FG_ALGO := true

BOARD_SEPOLICY_DIRS += device/intel/sepolicy/pmic/common
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/pmic/intel_swfg_sofia

# Set the following variable to true to enable
# SoC smoother for reporting the battery capacity.
USE_SWFG_SOC_SMOOTHER := true

# Set the following variable to true to enable
# temperature and load compensation algorithm.
USE_SWFG_TEMPERATURE_LOAD_COMPENSATION := true

