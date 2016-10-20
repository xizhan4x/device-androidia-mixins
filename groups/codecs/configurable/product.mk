# Audio/video codec support.
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/media_codecs.xml:system/etc/media_codecs.xml

{{#is_not_cht}}
ifneq (,$(wildcard $(LOCAL_PATH)/../media_codecs_performance.xml))
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../media_codecs_performance.xml:system/etc/media_codecs_performance.xml
endif

{{/is_not_cht}}
{{#cht_t3}}
ifneq (,$(wildcard $(LOCAL_PATH)/../media_codecs_performance_t3.xml))
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../media_codecs_performance_t3.xml:system/etc/media_codecs_performance.xml
endif
{{/cht_t3}}
{{#cht_t4}}
ifneq (,$(wildcard $(LOCAL_PATH)/../media_codecs_performance_t4.xml))
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../media_codecs_performance_t4.xml:system/etc/media_codecs_performance.xml
endif
{{/cht_t4}}
