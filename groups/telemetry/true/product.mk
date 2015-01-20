#
# Telemetry
PRODUCT_PACKAGES += \
    TelemetrySetup \
    telemetryd tm_record tm_fprobe tm_pstore_probe tm_dmesg_probe

TELEMETRY_SETNAME := all1
TELEMETRY_DOMAIN := tmfe.intel.com
TELEMETRY_KEYPATH := $(LOCAL_PATH)/telemetry/keys

# Telemetry keys need to be installed on device. The zipped archive that
# contains the keys can be found in vendor/intel/telemetry-client/keys. The
# ideal way would be to install the keys from those archives directly.
# Until the best way to do so (see IRDA-298) can be determined we extract
# the keys into LOCAL_PATH/telemetry/keys and install them from here
TELEMETRY_KEY_FILES := $(wildcard $(TELEMETRY_KEYPATH)/all/rsa*aa.x509.pem)
PRODUCT_COPY_FILES += $(foreach file,$(TELEMETRY_KEY_FILES),\
                $(file):system/etc/tm/keys/all/$(notdir $(file)))
TELEMETRY_KEY_FILES := $(wildcard $(TELEMETRY_KEYPATH)/all1/rsa*aa.x509.pem)
PRODUCT_COPY_FILES += $(foreach file,$(TELEMETRY_KEY_FILES),\
                $(file):system/etc/tm/keys/all1/$(notdir $(file)))
TELEMETRY_KEY_FILES := $(wildcard $(TELEMETRY_KEYPATH)/devel/rsa*aa.x509.pem)
PRODUCT_COPY_FILES += $(foreach file,$(TELEMETRY_KEY_FILES),\
                $(file):system/etc/tm/keys/devel/$(notdir $(file)))


PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
        persist.intel.tm.setname=$(TELEMETRY_SETNAME) \
        persist.intel.tm.domain=$(TELEMETRY_DOMAIN) \
        persist.intel.tm.server_name=$(TELEMETRY_SETNAME).$(TELEMETRY_DOMAIN) \
        persist.intel.tm.server_name=all1.tmfe.intel.com \
        persist.intel.tm.server_port=25001 \
        persist.intel.tm.state=disabled \
        persist.intel.tm.noncompliant=0 \
        persist.intel.tm.fprobe_rmfile=0

