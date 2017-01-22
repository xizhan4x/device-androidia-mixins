PRODUCT_PACKAGES += \
	fmapp \
	radio.fm.$(TARGET_BOARD_PLATFORM)\
	rds-decoder \
	libfm_jni \
	pekallfmrserver \
	libfmrservice \
	fmr_test \
	fmr_rxmain \
	fmr_rxnvm \
	PekallFMRadio

FM_TYPE := ag620

# Do not turn FM off on airplane mode activation
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
        persist.fmr.airplane.support=true
