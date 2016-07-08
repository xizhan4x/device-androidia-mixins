#Media codecs
{{#video_enc_allegro_al5r}}

#Allegro al5r video encoder
PRODUCT_PACKAGES += libOMX.allegro.video_encoder \
                    liballegro_encoder-shared
PRODUCT_PACKAGES += libOMX.allegro.core
{{^video_dec_verisilicon_g1v6}}
{{^image_dec_verisilicon_g1v6}}
{{^video_dec_verisilicon_g2v1}}
{{^video_enc_verisilicon_h1v6}}
PRODUCT_PACKAGES += libstagefrighthw
{{/video_enc_verisilicon_h1v6}}
{{/video_dec_verisilicon_g2v1}}
{{/image_dec_verisilicon_g1v6}}
{{/video_dec_verisilicon_g1v6}}
{{/video_enc_allegro_al5r}}
{{#video_enc_verisilicon_h1v6}}

#Verisilicon H1 video encoder
PRODUCT_PACKAGES += libOMX.hantro.H1.video.encoder
{{^video_dec_verisilicon_g1v6}}
{{^image_dec_verisilicon_g1v6}}
{{^video_dec_verisilicon_g2v1}}
PRODUCT_PACKAGES += libstagefrighthw
PRODUCT_PACKAGES += libhantro_omx_core
PRODUCT_PACKAGES += libion
{{/video_dec_verisilicon_g2v1}}
{{/image_dec_verisilicon_g1v6}}
{{/video_dec_verisilicon_g1v6}}
{{/video_enc_verisilicon_h1v6}}
{{#video_dec_verisilicon_g2v1}}

#Verisilicon G2 video decoder
PRODUCT_PACKAGES += libOMX.hantro.G2.video.decoder
{{^video_dec_verisilicon_g1v6}}
{{^image_dec_verisilicon_g1v6}}
PRODUCT_PACKAGES += libstagefrighthw
PRODUCT_PACKAGES += libhantro_omx_core
PRODUCT_PACKAGES += libion
{{/image_dec_verisilicon_g1v6}}
{{/video_dec_verisilicon_g1v6}}
{{/video_dec_verisilicon_g2v1}}
{{#image_dec_verisilicon_g1v6}}

#Verisilicon G1 image decoder
PRODUCT_PACKAGES += libOMX.hantro.G1.image.encoder
{{^video_dec_verisilicon_g1v6}}
PRODUCT_PACKAGES += libstagefrighthw
PRODUCT_PACKAGES += libhantro_omx_core
PRODUCT_PACKAGES += libion
{{/video_dec_verisilicon_g1v6}}
{{/image_dec_verisilicon_g1v6}}
{{#video_dec_verisilicon_g1v6}}

#Verisilicon G1 video decoder
PRODUCT_PACKAGES += libOMX.hantro.G1.video.decoder
PRODUCT_PACKAGES += libstagefrighthw
PRODUCT_PACKAGES += libhantro_omx_core
PRODUCT_PACKAGES += libion
{{/video_dec_verisilicon_g1v6}}
#use the configurable media_codec.xml media_codecs_performance.xml and media_profiles.xml
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml
