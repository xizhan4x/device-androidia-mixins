PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/car_core_hardware.xml:system/etc/permissions/car_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.type.automotive.xml:system/etc/permissions/android.hardware.type.automotive.xml \
    frameworks/native/data/etc/android.hardware.screen.landscape.xml:system/etc/permissions/android.hardware.screen.landscape.xml \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:system/etc/permissions/android.software.freeform_window_management.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml

PRODUCT_COPY_FILES += device/generic/car/common/bootanimations/bootanimation-832.zip:system/media/bootanimation.zip

$(call inherit-product, packages/services/Car/car_product/build/car.mk)
PRODUCT_PACKAGE_OVERLAYS += packages/services/Car/car_product/overlay

PRODUCT_PACKAGES += \
    radio.fm.default
