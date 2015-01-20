
PRODUCT_OEM_PROPERTIES = \
	ro.config.wallpaper \
	ro.config.wallpaper_component \
	ro.config.ringtone \
	ro.product.locale.language \
	ro.product.locale.region

PRODUCT_COPY_FILES += \
	device/intel/common/oem/bootanimation.zip:oem/media/bootanimation.zip \
	device/intel/common/oem/oem.img:oem.img

