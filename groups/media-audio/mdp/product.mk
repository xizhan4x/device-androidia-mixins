# libstagefrighthw
PRODUCT_PACKAGES += \
    libstagefrighthw

# Build OMX wrapper codecs
PRODUCT_PACKAGES += \
    libmdp_omx_core \
    libstagefright_soft_mp3dec_mdp \
    libstagefright_soft_aacdec_mdp \
    libstagefright_soft_aacenc_mdp \
    libstagefright_soft_vorbisdec_mdp \
    libstagefright_soft_amrenc_mdp \
    libstagefright_soft_amrdec_mdp

{{#wma}}
#Build OMX wrapper codecs for wma
PRODUCT_PACKAGES += \
    libstagefright_soft_wmadec_mdp

{{/wma}}
