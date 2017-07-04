#Video codecs
PRODUCT_PACKAGES += \
	libstagefrighthw \
	libhantro_omx_core \
	libOMX.hantro.G1.video.decoder \
	libOMX.hantro.H1.video.encoder
ifeq ($(TARGET_BOARD_PLATFORM), $(filter $(TARGET_BOARD_PLATFORM), sofia3gr))
PRODUCT_PACKAGES += \
        libOMX.hantro.G1.image.decoder \
        libOMX.hantro.7280.video.encoder
endif

ifeq ($(TARGET_BOARD_PLATFORM), $(filter $(TARGET_BOARD_PLATFORM), sofia_lte))
# media profiles and codecs files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../media_codecs_google_audio.xml:vendor/etc/media_codecs_google_audio.xml \
    $(LOCAL_PATH)/../media_codecs_google_telephony.xml:vendor/etc/media_codecs_google_telephony.xml \
    $(LOCAL_PATH)/../media_codecs_google_video_le.xml:vendor/etc/media_codecs_google_video.xml

{{#enc1080p}}
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../media_profiles.xml:vendor/etc/media_profiles.xml
{{/enc1080p}}
{{^enc1080p}}
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../media_profiles_enc720p.xml:vendor/etc/media_profiles.xml
{{/enc1080p}}


endif
