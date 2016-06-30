TARGET_USE_TRUSTY := true
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/trusty

TRUSTY_ENV_VAR += RUNTIME_MEM_BASE={{runtime_mem_base}}
TRUSTY_ENV_VAR += LOAD_MEM_BASE={{load_mem_base}}
TRUSTY_ENV_VAR += LK_CORE_NUM={{lk_core_num}}
#Using same toolchain as android kernel
TRUSTY_ENV_VAR += COMPILE_TOOLCHAIN=$(YOCTO_CROSSCOMPILE)
