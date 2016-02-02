# Default value for INTEL_FEATURE_UX_ENHANCEMENT
# This flag can be overriden by make command line
INTEL_FEATURE_UX_ENHANCEMENT := {{{activated}}}
ifeq ($(INTEL_FEATURE_UX_ENHANCEMENT), true)
INTEL_FEATURE_DATA_TRAFFIC := true
INTEL_FEATURE_ENHANCED_CALL := true
INTEL_FEATURE_CONTACTS := true

# Packages
PRODUCT_PACKAGES += \
        StorageManagerEx \
        VideoLive \
        AudioProfile \
        FileManager
ifeq ($(INTEL_FEATURE_DATA_TRAFFIC), true)
PRODUCT_PACKAGES += \
        SystemUIDataarrowOverlay
endif
ifeq ($(INTEL_FEATURE_ENHANCED_CALL), true)
PRODUCT_PACKAGES += \
        VoiceCallRecordOverlay \
        DialerOverlay
endif
ifeq ($(INTEL_FEATURE_CONTACTS), true)
PRODUCT_PACKAGES += \
        ContactsSim \
        ContactsProviderOverlay \
        ContactsSimService
endif #INTEL_FEATURE_CONTACTS eq true
endif #INTEL_FEATURE_UX_ENHANCEMENT eq true
