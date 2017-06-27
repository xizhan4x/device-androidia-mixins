PRODUCT_PACKAGES += \
    libgnssapi \
    libclientgps \
    liblbstrace \
    RXN_MSL \
    RXN_IntApp \
    rxn_services_xybrid \
    lbsd \
    gps.$(TARGET_BOARD_PLATFORM) \

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:vendor/etc/permissions/android.hardware.location.gps.xml \

PRODUCT_COPY_FILES += \
    hardware/imc/gnss/lbs/config_files/sf3g/LbsConfig.cfg:system/etc/LbsConfig.cfg
PRODUCT_COPY_FILES += \
    hardware/imc/gnss/lbs/config_files/sf3g/LbsConfig_agnss.cfg:system/etc/LbsConfig_agnss.cfg
ifeq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_COPY_FILES += \
       hardware/imc/gnss/lbs/config_files/sf3g/LbsLogConfig_user.cfg:system/etc/LbsLogConfig.cfg
else
PRODUCT_COPY_FILES += \
    hardware/imc/gnss/lbs/config_files/sf3g/LbsLogConfig.cfg:system/etc/LbsLogConfig.cfg
endif
PRODUCT_COPY_FILES += \
    hardware/imc/gnss/lbs/config_files/sf3g/LbsPltConfig.cfg:system/etc/LbsPltConfig.cfg

# SBEE Configuration files
PRODUCT_COPY_FILES += \
       hardware/imc/gnss/lbs/lbs_core/lbsd/sbee/license/config/MSLConfig.txt:system/etc/MSLConfig.txt
PRODUCT_COPY_FILES += \
       hardware/imc/gnss/lbs/lbs_core/lbsd/sbee/license/keys/license.key:system/etc/license.key
PRODUCT_COPY_FILES += \
       hardware/imc/gnss/lbs/lbs_core/lbsd/sbee/license/keys/security.key:system/etc/security.key

PRODUCT_COPY_FILES += \
       hardware/imc/gnss/lbs/config_files/sf3g/gps.conf:system/etc/gps.conf

PRODUCT_COPY_FILES += \
    hardware/imc/gnss/lbs/lbsd.sh:system/bin/lbsd.sh
PRODUCT_COPY_FILES += \
    hardware/imc/gnss/lbs/config_files/sf3g/cacert.txt:system/etc/cacert.txt

