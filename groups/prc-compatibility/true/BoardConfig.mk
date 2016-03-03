# ---- Enable PRC compatiblity feature ---- #
# In PRC market, some APKs are packed in non-standard way,
# that is, the x86(_64) libraries aren't workable although
# they're found in the APK. This feature intends to relieve
# the impact from such scenarios based-on the heuristic algorithm.

PRC_COMPATIBILITY_PACKAGE := true
INTEL_FEATURE_PRC_COMPATIBILITY := true
