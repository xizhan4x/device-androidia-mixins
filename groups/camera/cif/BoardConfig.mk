# The make targets for both projects are identical
# (e.g. camera.gmin.so), so the Android.mk's wrap themselves in tests
# for these.  Set only one.  And we'll just ignore the inconsistent _.
USE_CAMERA_HAL2 := false
USE_CAMERA_HAL_3 := true

# Enable CIF ISP, camera3hal builds different code for
# different ISPs
BOARD_CAMERA_CIF_SUPPORT = true

# Face Engine can be either PVL or IA.
BOARD_CAMERA_FACE_ENGINE = {{{face_engine}}}

# camera3hal won't build if this isn't true
USE_SHARED_IA_FACE = true

# Intel camera extras (HDR, face detection, panorama, red-eye detection etc.).
USE_INTEL_CAMERA_EXTRAS := true

# Selects which subdirectory to pick in libmfldadvci/ia_imaging/ia_panorama/
IA_PANORAMA_VERSION := 1.0

# On ISP encoding in Sofia
USE_INTEL_JPEG := false

# Must be "false" (NOT simply unset!) or else lots of camera
# depencencies will remove themselves from the build...
USE_CAMERA_STUB := false

{{#restrict_preview}}
# If set to true a patch is applied to the camera service that
# ensures that the maximum preview size is no greater than the
# maximum screen size when using the camera 1 api.
RESTRICT_PREVIEW_BY_SCREEN := true
{{/restrict_preview}}

BOARD_SEPOLICY_DIRS += device/intel/sepolicy/camera
