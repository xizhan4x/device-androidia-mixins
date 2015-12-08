# Audio/video codec support.
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/media_codecs.xml:system/etc/media_codecs.xml

ifneq (,$(wildcard $(LOCAL_PATH)/../media_codecs_performance.xml))
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../media_codecs_performance.xml:system/etc/media_codecs_performance.xml
endif
