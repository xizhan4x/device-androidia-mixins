TARGET_USE_TRUSTY := true
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/trusty

TRUSTY_ENV_VAR += RUNTIME_MEM_BASE={{runtime_mem_base}}
TRUSTY_ENV_VAR += LOAD_MEM_BASE={{load_mem_base}}
TRUSTY_ENV_VAR += LK_CORE_NUM={{lk_core_num}}
#Using same toolchain as android kernel
TRUSTY_ENV_VAR += COMPILE_TOOLCHAIN=$(YOCTO_CROSSCOMPILE)
TRUSTY_ENV_VAR += TARGET_PRODUCT=$(TARGET_PRODUCT)

#Workaround CPU lost issue on SIMICS, will remove this line below
#after PO.
BOARD_KERNEL_CMDLINE += cpu_init_udelay=500000
