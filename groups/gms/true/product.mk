FLAG_GMS_AVAILABLE ?= true
ifeq ($(FLAG_GMS_AVAILABLE),true)
{{#minimal}}
FLAG_GMS_MINIMAL := true
{{/minimal}}
{{#googlecamera}}
FLAG_GMS_WITH_GOOGLECAMERA := true
{{/googlecamera}}
{{#new_googlecamera}}
FLAG_GMS_WITH_NEW_GOOGLECAMERA := true
{{/new_googlecamera}}
{{#stub_apps}}
FLAG_GMS_WITH_STUB_APPS := true
{{/stub_apps}}
{{#force_bugle}}
FLAG_GMS_WITH_BUGLE_FORCE := true
{{/force_bugle}}
{{^car}}
$(call inherit-product-if-exists, vendor/google/gms/products/intel_gms.mk)
{{/car}}
{{#car}}
PRODUCT_PACKAGES += Launcher3
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-intel
# GMS required only on Android car
ANDROID_PARTNER_GMS_HOME := vendor/google/gms
# GMS mandatory core packages
PRODUCT_PACKAGES += \
    ConfigUpdater \
    GoogleBackupTransport \
    GoogleExtServices \
    GoogleExtShared \
    GoogleFeedback \
    GoogleLoginService \
    GoogleOneTimeInitializer \
    GooglePackageInstaller \
    GooglePartnerSetup \
    GooglePrintRecommendationService \
    GoogleServicesFramework \
    GoogleCalendarSyncAdapter \
    GoogleContactsSyncAdapter \
    GoogleTTS \
    GmsCore \
    Phonesky \
    SetupWizard \
    WebViewGoogle

# GMS mandatory libraries
PRODUCT_PACKAGES += \
    com.google.android.maps.jar \
    com.google.android.media.effects.jar

# Overlay For GMS devices
$(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product, device/sample/products/location_overlay.mk)
PRODUCT_PACKAGE_OVERLAYS += $(ANDROID_PARTNER_GMS_HOME)/products/gms_overlay

# Configuration files for GMS apps
PRODUCT_COPY_FILES += \
    $(ANDROID_PARTNER_GMS_HOME)/etc/preferred-apps/google.xml:system/etc/preferred-apps/google.xml \
    $(ANDROID_PARTNER_GMS_HOME)/etc/sysconfig/google.xml:system/etc/sysconfig/google.xml

# GMS mandatory application packages
PRODUCT_PACKAGES += \
    Maps \
    Music2 \
    Photos

# GMS optional application packages
PRODUCT_PACKAGES += \
    DeskClockGoogle

# Overrides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.require_network=any \
    ro.setupwizard.mode=OPTIONAL \
    ro.com.google.gmsversion=N_preview
{{/car}}
endif
