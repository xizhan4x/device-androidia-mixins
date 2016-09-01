PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml
PRODUCT_COPY_FILES += \
    device/generic/car/common/bootanimations/bootanimation-832.zip:system/media/bootanimation.zip

$(call inherit-product, packages/services/Car/car_product/build/car.mk)
PRODUCT_PACKAGE_OVERLAYS += packages/services/Car/car_product/overlay

PRODUCT_PACKAGES += \
    vehicle.default

PRODUCT_PACKAGES += \
    radio.fm.default

# Replace framework versions with dummy one, which is essentially
# the same as removing the xml. Needs this as there is no easy
# way to remove PRODUCT_COPY_FILES from inherited products.
PRODUCT_COPY_FILES += \
    packages/services/Car/car_product/init/init.car.rc:root/init.car.rc \
    packages/services/Car/car_product/init/init.bootstat.rc:root/init.bootstat.rc

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.type.automotive.xml:system/etc/permissions/android.hardware.type.automotive.xml \
    frameworks/native/data/etc/android.hardware.screen.portrait.xml:system/etc/permissions/android.hardware.screen.portrait.xml \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:system/etc/permissions/android.software.freeform_window_management.xml

# Car apps
PRODUCT_PACKAGES += \
    CarLatinIME \
    CarMediaApp \
    CarDialerApp \
    CarLensPickerApp \
    CarTrustAgentService \
    CarHvacApp \
    CarRadioApp \
    SystemUpdater \
    UniversalMusicPlayer

