PRODUCT_PACKAGES += AndroidAutoService \
		AndroidAutoSample \
		CarPlayCoreService \
		IPod2Service \
		CarPlaySample \
		cpserver \
		libwrs-carplay-ipod-usb-host \
		libCarPlayAudio

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.iap2=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.carplay=true
