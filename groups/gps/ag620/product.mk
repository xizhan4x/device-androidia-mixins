PRODUCT_PACKAGES += \
    libgnssapi \
	libclientgps \
	liblbstrace \
	lbsd \
    gps.$(TARGET_BOARD_PLATFORM) \

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \

PRODUCT_COPY_FILES += \
    hardware/imc/gnss/lbs/config_files/sf3g/LbsConfig.cfg:system/etc/LbsConfig.cfg
PRODUCT_COPY_FILES += \
    hardware/imc/gnss/lbs/config_files/sf3g/LbsConfig_agnss.cfg:system/etc/LbsConfig_agnss.cfg
PRODUCT_COPY_FILES += \
    hardware/imc/gnss/lbs/config_files/sf3g/LbsLogConfig.cfg:system/etc/LbsLogConfig.cfg
PRODUCT_COPY_FILES += \
    hardware/imc/gnss/lbs/config_files/sf3g/LbsPltConfig.cfg:system/etc/LbsPltConfig.cfg
PRODUCT_COPY_FILES += \
    hardware/imc/gnss/lbs/lbsd.sh:system/bin/lbsd.sh
PRODUCT_COPY_FILES += \
    hardware/imc/gnss/lbs/config_files/sf3g/cacert.txt:system/etc/cacert.txt

