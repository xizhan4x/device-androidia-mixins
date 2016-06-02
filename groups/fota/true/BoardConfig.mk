ifneq ($(TARGET_BUILD_VARIANT),user)
{{#update_stream}}
ADDITIONAL_DEFAULT_PROPERTIES += persist.fota.ota_stream={{update_stream}}
{{/update_stream}}

AFOTAAPP_EULA_PATH := {{{eula}}}
AFOTAAPP_LOG_LEVEL := {{{log_level}}}
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/fota
endif

