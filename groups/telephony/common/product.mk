# product.mk common to all Telephony platforms
PRODUCT_COPY_FILES += \
    device/intel/common/telephony/all/apns-conf.xml:system/etc/apns-conf.xml \
    device/intel/common/telephony/all/old-apns-conf.xml:system/etc/old-apns-conf.xml

# Inherit from common Open Source Telephony product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# copy atproxy_usbreset
PRODUCT_COPY_FILES += \
    device/intel/common/telephony/atproxy_usbreset:system/bin/atproxy_usbreset


{{#use_crm}}
{{#pcie}}
PRODUCT_PACKAGES += \
    crm_pcie
{{/pcie}}

PRODUCT_PACKAGES_DEBUG += \
    crm_dbg
{{/use_crm}}

{{^use_crm}}
{{^use_mcm}}
PRODUCT_PACKAGES += \
    mmgr \
    libmdmcli_mmgr \
    libmdmcli_jni \
    libmdmcli_stub \
    mdm_fw_pkg \
    libmodemupdate{{#m2}} \
    fwswitching{{/m2}}

PRODUCT_PACKAGES_DEBUG += \
    mmgr-test \
    ModemClientJavaTest
{{/use_mcm}}
{{/use_crm}}

{{#use_mcm}}
PRODUCT_COPY_FILES += \
    vendor/intel/modem_control/core/fls/{{{modem_bin}}}.fls:system/vendor/{{{modem_bin}}}.fls

PRODUCT_PACKAGES += \
    ModemControlManager \
    GetModemProp \
    at-manager \
    at-terminal \
    at-proxy \
    nvm-manager \
    mcm_custom \
    mcm_coredump \
    {{{mcm_json}}}.json \
    ModemDetection.sh \
    FlsTool \
    DownloadTool
{{/use_mcm}}

PRODUCT_PACKAGES += \
{{^use_mcm}}
    proxy \
{{/use_mcm}}
    mts \
    librapid-ril-core \
    librapid-ril-util \
    Stk

PRODUCT_PACKAGES_DEBUG += \
    miu-app \
    run_test_ipc.sh \
    mcd-test \
    ipcbox \
    Autocall

