ifneq ($(TARGET_BUILD_VARIANT),user)
ADDITIONAL_DEFAULT_PROPERTIES += persist.fota.ota_stream={{update_stream}}

AFOTAAPP_EULA_PATH := {{{eula}}}
AFOTAAPP_LOG_LEVEL := {{{log_level}}}
endif

