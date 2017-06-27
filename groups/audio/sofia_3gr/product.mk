# Audio logging property for audio driver
ifeq ($(TARGET_BUILD_VARIANT),eng)
PRODUCT_PROPERTY_OVERRIDES += persist.audio.log=2
else ifeq ($(TARGET_BUILD_VARIANT),userdebug)
PRODUCT_PROPERTY_OVERRIDES += persist.audio.log=1
else
PRODUCT_PROPERTY_OVERRIDES += persist.audio.log=0
endif

#Enable low latency stream
PRODUCT_PROPERTY_OVERRIDES += persist.audio.low_latency=1

#Enable deep buffer for video playback
PRODUCT_PROPERTY_OVERRIDES += media.stagefright.audio.deep=true

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/audio_effects.conf:system/etc/audio_effects.conf \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:vendor/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:vendor/etc/permissions/android.software.sip.voip.xml

PRODUCT_PACKAGES += \
    audio.primary.$(TARGET_BOARD_PLATFORM) \
    audio.r_submix.default \
    libauddriver \
    tinyplay \
    tinymix \
    tinycap \
    audio.a2dp.default \
    audio_daemon \
    audio.usb.default

