PRODUCT_PACKAGES += \
                    mobilevisor.fls \
                    modem.fls \
                    mvconfig_smp.fls \
                    psi_flash.fls \
                    secvm.fls \
                    slb.fls \
                    splash_img.fls \
                    ucode_patch.fls \

TARGET_BOARD_PLATFORM := sofia3g

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.rc:root/init.{{{hardware}}}.rc \
    $(LOCAL_PATH)/init.recovery.rc:root/init.recovery.{{{hardware}}}.rc \
    $(LOCAL_PATH)/ueventd.rc:root/ueventd.{{{hardware}}}.rc \
    $(LOCAL_PATH)/fstab:root/fstab.{{{hardware}}} \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../media_codecs.xml:system/etc/media_codecs.xml \

