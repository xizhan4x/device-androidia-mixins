PRODUCT_PACKAGES += \
    daemon_cl \
    ufipc_daemon_app \
    avb_streamhandler_app \
    avb_streamhandler_client_app \
    pluginias-media_transport-avb_configuration_gp_mrb \
    libias-audio-smartx \
    libias-audio-modules \
    libsmartx-subsystem \
    alsa_aplay \
    alsa_ctl \
    alsa_amixer \
    asound.conf \

AUDIOSERVER_MULTILIB := 64

# for AVB and GPTP services
PRODUCT_PROPERTY_OVERRIDES += persist.eavb.mode=m

# for gPTP service in automotive profile or not
PRODUCT_PROPERTY_OVERRIDES += persist.gptp.automotive_profile={{automotive_profile}}
