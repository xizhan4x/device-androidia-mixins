INTEL_FEATURE_ADAPTIVE_AUTHENTICATION := true
DEVICE_PACKAGE_OVERLAYS += device/intel/common/aware/overlay
INTEL_FEATURE_AWARESERVICE := true
PRODUCT_BOOT_JARS += com.intel.aware.awareservice com.intel.aware.aaservice
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/awareservice/ish
