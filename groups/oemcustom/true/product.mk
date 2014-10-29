
PRODUCT_OEM_PROPERTIES = \
	ro.config.wallpaper \
	ro.config.wallpaper_component \
	ro.config.ringtone \
	ro.product.locale.language \
	ro.product.locale.region

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/bootanimation.zip:oem/media/bootanimation.zip \
	$(LOCAL_PATH)/oem/oem.img:oem.img

