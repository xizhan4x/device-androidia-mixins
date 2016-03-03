#Enable Ptest mode for eng and userdebug builds
ifneq ($(TARGET_BUILD_VARIANT),user)
    PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/init.ptest.rc:root/init.ptest.rc

    #gnss: copy init
    PRODUCT_COPY_FILES += \
        device/intel/sofia_lte/ptest/init.gnss.ptest.rc:root/init.gnss.ptest.rc

    #bluetooth: copy init
    PRODUCT_COPY_FILES += \
        device/intel/sofia_lte/ptest/init.bluetooth.ptest.rc:root/init.bluetooth.ptest.rc

    #telephony: copy init
    PRODUCT_COPY_FILES += \
        device/intel/sofia_lte/ptest/init.telephony.ptest.rc:root/init.telephony.ptest.rc

    # SBEE Configuration files
    PRODUCT_COPY_FILES += \
        hardware/imc/gnss/lbs/lbs_core/lbsd/sbee/license/config/MSLConfig.txt:system/etc/MSLConfig.txt
    PRODUCT_COPY_FILES += \
        hardware/imc/gnss/lbs/lbs_core/lbsd/sbee/license/keys/license.key:system/etc/license.key
    PRODUCT_COPY_FILES += \
        hardware/imc/gnss/lbs/lbs_core/lbsd/sbee/license/keys/security.key:system/etc/security.key

    #iwlwifi: copy init.wifi.ptest.rc to root directory.
    PRODUCT_COPY_FILES += \
        device/intel/sofia_lte/ptest/wifi/init.wifi.ptest.rc:root/init.wifi.ptest.rc
endif
