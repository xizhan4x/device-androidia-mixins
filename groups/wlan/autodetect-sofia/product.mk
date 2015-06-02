PRODUCT_PACKAGES += \
    hostapd \
    hostapd_cli \
    wpa_supplicant \
    wpa_cli

# iwlwifi USC
PRODUCT_PACKAGES += \
    wifi_intel_usc

#copy iwlwifi wpa config files
PRODUCT_COPY_FILES += \
        device/intel/common/wlan/wpa_supplicant-common.conf:system/etc/wifi/wpa_supplicant.conf \
        device/intel/common/wlan/iwlwifi/wpa_supplicant_overlay_no_tdls.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
        frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
        frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml

PRODUCT_COPY_FILES += \
        device/intel/common/wlan/iwlwifi/load_iwlwifi.sh:system/bin/load_iwlwifi.sh

#
# Copy a620 firwmare and config files to system/vendor/wifi/a620
# It will be bind-mounted by hald upon device discovery
TARGET_OUT_WLAN_FW := $(TARGET_OUT)/system/vendor/wifi/a620/firmware
TARGET_OUT_ETC_WIFI := $(TARGET_OUT)/system/vendor/wifi/a620/etc
LOCAL_IWL_FW_DIR := vendor/intel/fw/iwl

IWL_UCODE_FILES := $(notdir $(wildcard $(LOCAL_IWL_FW_DIR)/*a620*.ucode))
IWL_PAPD_DB_FILES := $(notdir $(shell find $(LOCAL_IWL_FW_DIR)/papd_db -type f))

#copy the nvmData file and all the ucode files to $(TARGET_OUT_WLAN_FW)
# copying nvm to firmware is temporary
PRODUCT_COPY_FILES += \
	$(LOCAL_IWL_FW_DIR)/nvmData/nvmData-a620:$(TARGET_OUT_WLAN_FW)/iwl_nvm.bin \
	$(LOCAL_IWL_FW_DIR)/nvmData/nvmData-a620:$(TARGET_OUT_ETC_WIFI)/nvmDataDefault \
	$(LOCAL_IWL_FW_DIR)/fw_info.txt:$(TARGET_OUT_WLAN_FW)/fw_info.txt \
	$(LOCAL_IWL_FW_DIR)/iwl-dbg-cfg.ini:$(TARGET_OUT_WLAN_FW)/iwl-dbg-cfg.ini \
	$(foreach ucode,$(IWL_UCODE_FILES),\
		$(LOCAL_IWL_FW_DIR)/$(ucode):$(TARGET_OUT_WLAN_FW)/$(ucode)) \
	$(foreach file,$(IWL_PAPD_DB_FILES),\
                $(LOCAL_IWL_FW_DIR)/papd_db/$(file):$(TARGET_OUT_ETC_WIFI)/papd_db/$(file))

# Add Manufacturing tool
PRODUCT_PACKAGES += \
    wlan_intel_restore.sh
