# There is a strong dependency on debug-logs; disable debug-npk if not set
ifeq ($(MIXIN_DEBUG_LOGS),true)

# Enable redirection of android logs to SVENTX
LOGCATEXT_USES_SVENTX := true
BOARD_SEPOLICY_DIRS += \
    device/intel/common/sepolicy/npk
BOARD_SEPOLICY_UNION += \
    device.te \
    file_contexts \
    logsvc.te \
    npk_init.te

endif #MIXIN_DEBUG_LOGS
