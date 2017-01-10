PRODUCT_PACKAGES += \
    daemon_cl \
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

# for AVB service in D6 mode or not
PRODUCT_PROPERTY_OVERRIDES += persist.d6.mode=n

PRODUCT_PROPERTY_OVERRIDES += \
       $(foreach item, $(smxelements),persist.media.smartx.$(item)log=3)
