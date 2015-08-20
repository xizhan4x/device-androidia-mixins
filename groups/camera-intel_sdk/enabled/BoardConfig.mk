ifneq ($(USE_CAMERA_HAL_3),true)
$(error Camera V3 HAL must be enabled, check camera mixin option!) 
endif

# Enable Intel camera extension.
USE_INTEL_CAMERA_EXTRAS := true

# Enable Intel camera extension.
ENABLE_INTEL_CAMERA_SDK := true
