PRODUCT_PACKAGES += \
    hostapd \
    hostapd_cli \
    wpa_supplicant \
    wpa_cli

# iwlwifi USC
PRODUCT_PACKAGES += \
    wifi_intel_usc

#copy modules configuration
PRODUCT_COPY_FILES += \
        device/intel/common/wlan/iwlwifi/iwl_3gr.conf:/system/etc/hald/fuse/modprobe.d/iwl_3gr.conf

#copy iwlwifi wpa config files
PRODUCT_COPY_FILES += \
        device/intel/common/wlan/wpa_supplicant-common.conf:system/etc/wifi/wpa_supplicant.conf \
        device/intel/common/wlan/iwlwifi/wpa_supplicant_overlay_no_tdls.conf:system/etc/hald/fuse/default/wpa_supplicant_overlay_no_tdls.conf \
        device/intel/common/wlan/iwlwifi/wpa_supplicant_overlay.conf:system/etc/hald/fuse/default/wpa_supplicant_overlay_tdls.conf \
        frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
        frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml

# Firmwares with device-specific file names can go to standard firmware folder
TARGET_OUT_WLAN_FW_COMMON := $(TARGET_OUT)/system/vendor/firmware

#
# Copy a620 firwmare and config files to system/vendor/wifi/a620
# It will be bind-mounted by hald upon device discovery
TARGET_OUT_WLAN_FW := $(TARGET_OUT)/system/vendor/wifi/a620/firmware
TARGET_OUT_ETC_WIFI := $(TARGET_OUT)/system/vendor/wifi/a620/etc
LOCAL_IWL_FW_DIR := vendor/intel/fw/iwl/sofia/3gr

IWL_UCODE_FILES := $(notdir $(wildcard $(LOCAL_IWL_FW_DIR)/*a620*.ucode))
IWL_PAPD_DB_FILES := $(notdir $(shell find $(LOCAL_IWL_FW_DIR)/papd_db -type f))

# Copy ucode firmwares with device-specific file names to $(TARGET_OUT_WLAN_FW_COMMON)
# Others firmware files are copied to $(TARGET_OUT_WLAN_FW) and $(TARGET_OUT_ETC_WIFI)
# copying nvm to firmware is temporary
PRODUCT_COPY_FILES += \
	$(LOCAL_IWL_FW_DIR)/nvmData/nvmData-a620:$(TARGET_OUT_WLAN_FW)/iwl_nvm.bin \
	$(LOCAL_IWL_FW_DIR)/nvmData/nvmData-a620:$(TARGET_OUT_ETC_WIFI)/nvmDataDefault \
	$(LOCAL_IWL_FW_DIR)/fw_info.txt:$(TARGET_OUT_WLAN_FW)/fw_info.txt \
	$(LOCAL_IWL_FW_DIR)/iwl-dbg-cfg.ini:$(TARGET_OUT_WLAN_FW)/iwl-dbg-cfg.ini \
	$(LOCAL_IWL_FW_DIR)/softap-dummy-ucode:$(TARGET_OUT_WLAN_FW)/iwlwifi-softap-dummy.ucode \
	$(foreach ucode,$(IWL_UCODE_FILES),\
		$(LOCAL_IWL_FW_DIR)/$(ucode):$(TARGET_OUT_WLAN_FW_COMMON)/$(ucode)) \
	$(foreach file,$(IWL_PAPD_DB_FILES),\
                $(LOCAL_IWL_FW_DIR)/papd_db/$(file):$(TARGET_OUT_ETC_WIFI)/papd_db/$(file))

# Add Manufacturing tool
PRODUCT_PACKAGES += \
    wlan_intel_restore.sh
