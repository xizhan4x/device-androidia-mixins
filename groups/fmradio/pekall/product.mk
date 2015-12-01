PRODUCT_PACKAGES += \
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
ADDITIONAL_DEFAULT_PROPERTIES += \
        persist.fmr.airplane.support=true
