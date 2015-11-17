INTEL_GNSS_ENABLED := y
INTEL_GNSS_INSTALL_DIR := gnss
BOARD_USE_LBS_GNSS := true
GNSS_RPC_SUPPORT := {{gnss_rpc_support}}
BOARD_SEPOLICY_DIRS += \
        device/intel/sepolicy/gps/ag620
