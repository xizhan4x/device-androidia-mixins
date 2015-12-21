BOARD_USE_VPU_VERISILICON := true
INTEL_STAGEFRIGHT := true
INTEL_VPU_FEATURES := FEAT_INCLUDE_LIBS

ifeq ($(TARGET_BOARD_PLATFORM), $(filter $(TARGET_BOARD_PLATFORM), sofia_lte))
PRODUCT_FEAT_VPU_G1V6_H1V6 :=true
BOARD_USE_MALI_IMC_GFX := true
endif

BOARD_SEPOLICY_DIRS += \
        device/intel/sepolicy/media \
        device/intel/sepolicy/media/verisilicon
