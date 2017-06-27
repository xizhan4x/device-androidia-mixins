PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=false \
    ro.telephony.default_network=9,1 \
    ro.spid.telephony.rxdiv=1

PRODUCT_PACKAGES += \
    librpc-ril \
    CellBroadcastReceiver \
    Stk

PRODUCT_PACKAGES += \
    com.msm.android.MSMClientLib \
    com.msm.android.MSMClientLib.xml \
    crm_sofia \
    MSMClient \
    libmsm_library_jni

# Modem Trace Server (MTS)
PRODUCT_PACKAGES += \
    mts

# AMTL : Android Modem Traces and Logs
PRODUCT_PACKAGES_DEBUG += \
    crm_dbg \
    Amtl

#OemTelephony for OEM HOOK API
PRODUCT_PACKAGES += \
    OemTelephonyApp \
    com.intel.internal.telephony.OemTelephony

# AT Proxy
PRODUCT_PACKAGES += \
    proxy

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:vendor/etc/permissions/android.hardware.telephony.gsm.xml \
    device/intel/common/telephony/all/apns-conf.xml:system/etc/apns-conf.xml \
    device/intel/common/telephony/all/old-apns-conf.xml:system/etc/old-apns-conf.xml \
    device/intel/common/telephony/sarconfig_{{{sar_type_id}}}.xml:system/etc/sarconfig.xml

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
        rild.libpath=librpc-ril.so \

$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Autocall
PRODUCT_PACKAGES_DEBUG += \
    Autocall

PRODUCT_PACKAGES_DEBUG += \
    iperf

#SARManager
PRODUCT_PACKAGES += \
    SARManager

PRODUCT_PACKAGES += \
    rpc-daemon

PRODUCT_PROPERTY_OVERRIDES += \
    persist.ril-daemon.disable=dsds\

{{#dsds}}
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.multisim.config=dsds
{{/dsds}}

# unstub CRM only if modem silent reset is enabled
ifeq ($(MODEM_SILENT_RESET_ENABLED),true)
  PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
      persist.sys.crm0.load_stub=false \
      persist.sys.crm1.load_stub=false
endif

ifeq ($(MODEM_SILENT_RESET_ACTIVE),true)
  PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
      persist.sys.crm0.silent_reset=true \
      persist.sys.crm1.silent_reset=true
endif

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
      ro.telephony.tcs.hw_name={{tcs_hw}}
