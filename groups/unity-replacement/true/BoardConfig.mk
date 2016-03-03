# ---- Enable unity replacement feature ---- #
# To improve the performance of unity apps, this feature
# is implemented to replace the target unity libraries in
# APK with x86 alternatives during installation time.

ENABLE_UNITY_REPLACEMENT := true
INTEL_FEATURE_UNITY_REPLACEMENT := true
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/unity-replacement/
