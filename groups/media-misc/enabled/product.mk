# Decoding MPEG4-ASP/H263
PRODUCT_PACKAGES += \
	libmixvbp \
	libmixvbp_mpeg4 \
	libva_videodecoder \
	libOMXVideoDecoderMPEG4 \
	libOMXVideoDecoderH263 \
	libva_videoencoder \
	libOMXVideoEncoderMPEG4 \
	libOMXVideoEncoderH263 \
	libintelmetadatabuffer \
	libwrs_omxil_core_pvwrapped \
	libwrs_omxil_base

# Copy config files to system
PRODUCT_COPY_FILES += device/intel/common/media/wrs_omxil_components.list:system/etc/wrs_omxil_components.list
