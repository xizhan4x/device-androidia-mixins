{{^fls_prebuilts}}
BUILD_BOOTCORE_FROM_SRC := true
BUILD_SECVM_FROM_SRC := true
BUILD_VMM_FROM_SRC := true
GEN_VMM_FLS_FILES := true
SOFIA_FW_SRC_BASE := {{{firmware_src_path}}}
{{/fls_prebuilts}}
{{#fls_prebuilts}}
BUILD_BOOTCORE_FROM_SRC := false
BUILD_SECVM_FROM_SRC := false
BUILD_VMM_FROM_SRC := false
GEN_VMM_FLS_FILES := false
MV_CONFIG_DEFAULT_TYPE := smp
{{/fls_prebuilts}}
