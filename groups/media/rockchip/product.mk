#Video codecs
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libgralloc_priv_omx \
    libvpu \
    libOMX_Core \
    libomxvpu_dec \
    libomxvpu_enc \
    librk_vpuapi \
    librk_hevcdev \
    librk_demux \
    librk_audio \
    libRkOMX_Resourcemanager \
    libjpeghwdec \
    libjpeghwenc \
    libapedec

ifeq ($(SECURE_PLAYBACK_ENABLE),true)
PRODUCT_PACKAGES += \
    libcodec_intel_sec \
    libsecmem_intel
endif
