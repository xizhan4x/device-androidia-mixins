TARGET_USE_TRUSTY := true

ifeq ({{boot-arch}}, abl)
TARGET_USE_MULTIBOOT := true
endif

{{#enable_hw_sec}}
BOARD_USES_TRUSTY := true
BOARD_USES_KEYMASTER1 := true
{{/enable_hw_sec}}
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/trusty
BOARD_SEPOLICY_M4DEFS += module_trusty=true

LKBUILD_TOOLCHAIN_ROOT = $(PWD)/vendor/intel/external/prebuilts/elf/
LKBUILD_X86_TOOLCHAIN = $(LKBUILD_TOOLCHAIN_ROOT)i386-elf-4.9.1-Linux-x86_64/bin
LKBUILD_X64_TOOLCHAIN = $(LKBUILD_TOOLCHAIN_ROOT)x86_64-elf-4.9.1-Linux-x86_64/bin
TRUSTY_BUILDROOT = $(PWD)/$(PRODUCT_OUT)/obj/trusty/

TRUSTY_ENV_VAR += LK_CORE_NUM={{lk_core_num}}
TRUSTY_ENV_VAR += TARGET_PRODUCT=$(TARGET_PRODUCT)

#for trusty lk
TRUSTY_ENV_VAR += BUILDROOT=$(TRUSTY_BUILDROOT)
TRUSTY_ENV_VAR += PATH=$(PATH):$(LKBUILD_X86_TOOLCHAIN):$(LKBUILD_X64_TOOLCHAIN)

#for trusty vmm
# use same toolchain as android kernel
TRUSTY_ENV_VAR += COMPILE_TOOLCHAIN=$(YOCTO_CROSSCOMPILE)

# output build dir to android out folder
TRUSTY_ENV_VAR += BUILD_DIR=$(TRUSTY_BUILDROOT)
TRUSTY_ENV_VAR += LKBIN_DIR=$(TRUSTY_BUILDROOT)/build-{{{lk_project}}}/

#Fix the cpu hotplug fail due to the trusty.
#Trusty will introduce some delay for cpu_up().
#Experiment show need wait at least 60us after
#apic_icr_write(APIC_DM_STARTUP | (start_eip >> 12), phys_apicid);
#So here override the cpu_init_udelay to have the cpu wait for 300us
#to guarantee the cpu_up success.
BOARD_KERNEL_CMDLINE += cpu_init_udelay=10
