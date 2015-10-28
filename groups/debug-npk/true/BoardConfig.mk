# There is a strong dependency on debug-logs; disable debug-npk if not set
ifeq ($(MIXIN_DEBUG_LOGS),true)

# Enable redirection of android logs to SVENTX
LOGCATEXT_USES_SVENTX := true
BOARD_SEPOLICY_DIRS += \
    device/intel/sepolicy/npk

ifeq ($(PSTORE_CONFIG),PRAM)

# Default configuration for dumps to pstore
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.npk.cfg=pstore,fw

# Increase pstore dump size to fit MSC buffers
BOARD_KERNEL_CMDLINE += \
    intel_pstore_pram.record_size=524288 \
    pstore.extra_size=524288

endif # PSTORE_CONFIG == PRAM

endif #MIXIN_DEBUG_LOGS
