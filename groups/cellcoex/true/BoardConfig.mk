BOARD_HAVE_CELLCOEX := true
BOARD_HAVE_CELLCOEX_APK := true

# sepolicy rules enhancement for cellcoex
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/cellcoex/in_system_apk/btcoex_{{{btcoex_role}}}
