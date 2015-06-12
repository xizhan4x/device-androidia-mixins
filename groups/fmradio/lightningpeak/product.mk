PRODUCT_PACKAGES += \
	IntelFmRadio \
	libv4l2rds \
	fmr_rxmain \
	fmr_rxnvm \

ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += IntelFMStackTestApp
endif
