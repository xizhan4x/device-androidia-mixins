ifneq ($(USE_CAMERA_HAL_3),true)
$(error Camera V3 HAL must be enabled, check camera mixin option!) 
endif

# Currently, Davis Reef is using legacy libcamera2 for depth data flow,
# but the color/2D frames are using camera3hal. Sooner or later, the
# data flow should also use camera3hal.
USE_CAMERA_HAL2 := true

# We don't need Intel meta buffer since libcamera2 is not used for
# video record.
USE_INTEL_METABUFFER := false

# Set CSS API version.
USE_CSS_2_1 := true
