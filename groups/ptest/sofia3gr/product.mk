# PTEST mode
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.ptest.rc:root/init.ptest.rc

#gnss: copy init
PRODUCT_COPY_FILES += \
    device/intel/sofia3gr/ptest/init.gnss.ptest.rc:root/init.gnss.ptest.rc

#bluetooth: copy init
PRODUCT_COPY_FILES += \
    device/intel/sofia3gr/ptest/init.bluetooth.ptest.rc:root/init.bluetooth.ptest.rc

# SBEE Configuration files
PRODUCT_COPY_FILES += \
    hardware/imc/gnss/lbs/lbs_core/lbsd/sbee/license/config/MSLConfig.txt:system/etc/MSLConfig.txt

PRODUCT_COPY_FILES += \
    hardware/imc/gnss/lbs/lbs_core/lbsd/sbee/license/keys/license.key:system/etc/license.key

PRODUCT_COPY_FILES += \
    hardware/imc/gnss/lbs/lbs_core/lbsd/sbee/license/keys/security.key:system/etc/security.key

#iwlwifi: copy init.wifi.ptest.rc to root directory.
PRODUCT_COPY_FILES += \
    device/intel/sofia3gr/ptest/wifi/init.wifi.ptest.rc:root/init.wifi.ptest.rc

#Copy wlan_nvm_init_ptest.sh and load_iwlwifi_ptest.sh to system/bin/
PRODUCT_COPY_FILES += \
    device/intel/sofia3gr/ptest/wifi/load_iwlwifi_ptest.sh:system/bin/load_iwlwifi_ptest.sh \
    device/intel/sofia3gr/ptest/wifi/wlan_nvm_init_ptest.sh:system/bin/wlan_nvm_init_ptest.sh

