BUILD_BOOTCORE_FROM_SRC := true
BUILD_SECVM_FROM_SRC := true
BUILD_VMM_FROM_SRC := true
GEN_ANDROID_FLS_FILES := true
GEN_VMM_FLS_FILES := true
MODEM_PLATFORM := {{{modem_platform}}}
MODEM_PROJECTNAME := {{{modem_projectname}}}
MV_CONFIG_BITNESS := {{{bitness}}}
MV_CONFIG_CHIP_VER := {{{mv_config_chip_ver}}}

BUILT_MODEM := modem/prebuilt/$(MODEM_PLATFORM)/$(MODEM_PROJECTNAME).ihex

NON_IMC_BUILD := true
export NON_IMC_BUILD

include device/intel/common/boot/sofia/sofia-base.mk
