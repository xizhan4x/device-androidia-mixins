{{#video_enc_allegro_al5r}}
#Add allegro al5r video encoder
BOARD_VIDEO_ENC_ALLEGRO_AL5R := true
PRODUCT_FEAT_VPU_ALLEGRO := true
{{^video_dec_verisilicon_g1v6}}
{{^image_dec_verisilicon_g1v6}}
{{^video_dec_verisilicon_g2v1}}

#use intel lib stagefright hw loader to load the codecs
INTEL_STAGEFRIGHT := true

{{/video_dec_verisilicon_g2v1}}
{{/image_dec_verisilicon_g1v6}}
{{/video_dec_verisilicon_g1v6}}
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/media/configurable/allegro_al5r
{{/video_enc_allegro_al5r}}

{{#video_dec_verisilicon_g2v1}}
#Add verisilicon g2v1 video decoder
BOARD_VIDEO_DEC_VERISILICON_G2V1 := true
{{^video_dec_verisilicon_g1v6}}
{{^image_dec_verisilicon_g1v6}}

#verisilicon codec is used
PRODUCT_FEAT_VPU_VERISILICON := true

#use intel lib stagefright hw loader to load the codecs
INTEL_STAGEFRIGHT := true

#use ion memory
BOARD_USE_MALI_IMC_GFX := true

{{/image_dec_verisilicon_g1v6}}
{{/video_dec_verisilicon_g1v6}}
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/media/configurable/verisilicon_g2v1
{{/video_dec_verisilicon_g2v1}}

{{#video_enc_verisilicon_h1v6}}
#Add verisilicon h1v6 video encoder
BOARD_VIDEO_ENC_VERISILICON_H1V6 := true
{{^video_dec_verisilicon_g1v6}}
{{^image_dec_verisilicon_g1v6}}
{{^video_dec_verisilicon_g2v1}}

#verisilicon codec is used
PRODUCT_FEAT_VPU_VERISILICON := true

#use intel lib stagefright hw loader to load the codecs
INTEL_STAGEFRIGHT := true

#use ion memory
BOARD_USE_MALI_IMC_GFX := true

{{/video_dec_verisilicon_g2v1}}
{{/image_dec_verisilicon_g1v6}}
{{/video_dec_verisilicon_g1v6}}
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/media/configurable/verisilicon_h1v6
{{/video_enc_verisilicon_h1v6}}

{{#image_dec_verisilicon_g1v6}}
#Add verisilicon g1v6 image decoder
BOARD_IMAGE_DEC_VERISILICON_G1V6 := true
{{^video_dec_verisilicon_g1v6}}

#verisilicon codec is used
PRODUCT_FEAT_VPU_VERISILICON := true

#use intel lib stagefright hw loader to load the codecs
INTEL_STAGEFRIGHT := true

#use ion memory
BOARD_USE_MALI_IMC_GFX := true

BOARD_SEPOLICY_DIRS += device/intel/sepolicy/media/configurable/verisilicon_g1v6
{{/video_dec_verisilicon_g1v6}}

{{/image_dec_verisilicon_g1v6}}

{{#video_dec_verisilicon_g1v6}}
#Add verisilicon g1v6 video decoder
BOARD_VIDEO_DEC_VERISILICON_G1V6 := true

#verisilicon codec is used
PRODUCT_FEAT_VPU_VERISILICON := true

#use intel lib stagefright hw loader to load the codecs
INTEL_STAGEFRIGHT := true

#use ion memory
BOARD_USE_MALI_IMC_GFX := true

BOARD_SEPOLICY_DIRS += device/intel/sepolicy/media/configurable/verisilicon_g1v6
{{/video_dec_verisilicon_g1v6}}
