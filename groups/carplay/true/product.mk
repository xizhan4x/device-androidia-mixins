PRODUCT_PACKAGES += AndroidAutoService \
		AndroidAutoSample \
		CarPlayCoreService \
		IPod2Service \
		CarPlaySample \
		cpserver \
		libwrs-carplay-ipod-usb-host \
		libCarPlayAudio

ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.iap2=true
ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.carplay=true
