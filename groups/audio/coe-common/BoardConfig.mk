DEVICE_PACKAGE_OVERLAYS += device/intel/common/audio/overlay

# Enable configurable audio policy
USE_CONFIGURABLE_AUDIO_POLICY := 1

# Use XML audio policy configuration file
USE_XML_AUDIO_POLICY_CONF := 1

# Use Intel's custom PFW
USE_CUSTOM_PARAMETER_FRAMEWORK := true

BOARD_SEPOLICY_M4DEFS += module_coe_common=true
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/audio/coe-common
