{{^useprebuilt}}
ifeq ($(TARGET_PREBUILT_KERNEL),)

LOCAL_KERNEL_PATH := $(abspath $(PRODUCT_OUT)/obj/kernel)
KERNEL_INSTALL_MOD_PATH := .
LOCAL_KERNEL := $(LOCAL_KERNEL_PATH)/arch/x86/boot/{{{binary_name}}}
LOCAL_KERNEL_MODULE_TREE_PATH := $(LOCAL_KERNEL_PATH)/lib/modules
KERNELRELEASE = $(shell cat $(LOCAL_KERNEL_PATH)/include/config/kernel.release)

KERNEL_CCACHE := $(realpath $(CC_WRAPPER))

#remove time_macros from ccache options, it breaks signing process
KERNEL_CCSLOP := $(filter-out time_macros,$(subst $(comma), ,$(CCACHE_SLOPPINESS)))
KERNEL_CCSLOP := $(subst $(space),$(comma),$(KERNEL_CCSLOP))

{{#build_dtbs}}
BUILD_DTBS := true
BOARD_DTB := $(LOCAL_KERNEL_PATH)/{{{board_dtb}}}
DTB ?= $(BOARD_DTB)
{{/build_dtbs}}
LOCAL_KERNEL_SRC := {{{src_path}}}
EXTERNAL_MODULES := {{{external_modules}}}
EXTMOD_SRC := ../modules


KERNEL_DEFCONFIG := $(LOCAL_KERNEL_SRC)/arch/x86/configs/$(TARGET_KERNEL_ARCH)_{{{kdefconfig}}}defconfig
ifneq ($(TARGET_BUILD_VARIANT), user)
KERNEL_DEBUG_DIFFCONFIG += $(wildcard $(LOCAL_KERNEL_SRC)/arch/x86/configs/debug_diffconfig)
ifneq ($(KERNEL_DEBUG_DIFFCONFIG),)
KERNEL_DIFFCONFIG += $(KERNEL_DEBUG_DIFFCONFIG)
else
KERNEL_DEFCONFIG := $(LOCAL_KERNEL_SRC)/arch/x86/configs/$(TARGET_KERNEL_ARCH)_{{{kdefconfig}}}debug_defconfig
endif
EXTERNAL_MODULES += {{{debug_modules}}}
endif # variant not eq user
KERNEL_CONFIG := $(LOCAL_KERNEL_PATH)/.config

KERNEL_MAKE_OPTIONS = \
    SHELL=/bin/bash \
    -C $(LOCAL_KERNEL_SRC) \
    O=$(LOCAL_KERNEL_PATH) \
    ARCH=$(TARGET_KERNEL_ARCH) \
    INSTALL_MOD_PATH=$(KERNEL_INSTALL_MOD_PATH) \
    CROSS_COMPILE="$(KERNEL_CCACHE) $(YOCTO_CROSSCOMPILE)" \
    CCACHE_SLOPPINESS=$(KERNEL_CCSLOP)


KERNEL_CONFIG_DEPS := $(strip $(KERNEL_DEFCONFIG) $(KERNEL_DIFFCONFIG))
KERNEL_CONFIG_MK := $(LOCAL_KERNEL_PATH)/config.mk
-include $(KERNEL_CONFIG_MK)

ifneq ($(KERNEL_CONFIG_DEPS),$(KERNEL_CONFIG_PREV_DEPS))
.PHONY: $(KERNEL_CONFIG)
endif

CHECK_CONFIG_SCRIPT := $(LOCAL_KERNEL_SRC)/scripts/diffconfig
CHECK_CONFIG_LOG :=  $(LOCAL_KERNEL_PATH)/.config.check

# Before building final defconfig with debug diffconfigs
# Check that base defconfig is correct. Check is performed
# by comparing generated .config with .config.old
# If differences are observed, display a help message
# and stop kernel build.
# If a .config is already present, save it before processing
# the check and restore it at the end
checkdefconfig: $(KERNEL_DEFCONFIG)
	$(hide) dirname $(KERNEL_CONFIG) | xargs mkdir -p
	$(hide) if [[ -e $(KERNEL_CONFIG) ]] ; then mv -f $(KERNEL_CONFIG) $(KERNEL_CONFIG).save; fi
	$(hide) cat $^ > $(KERNEL_CONFIG)
	$(MAKE) $(KERNEL_MAKE_OPTIONS) olddefconfig
	$(hide) $(CHECK_CONFIG_SCRIPT) $(KERNEL_CONFIG).old $(KERNEL_CONFIG) > $(CHECK_CONFIG_LOG)
	$(hide) if [[ -e $(KERNEL_CONFIG).save ]] ; then mv -f $(KERNEL_CONFIG).save $(KERNEL_CONFIG); fi
	$(hide) if [[ -s $(CHECK_CONFIG_LOG) ]] ; then \
	  echo "CHECK KERNEL DEFCONFIG FATAL ERROR :" ; \
	  echo "Kernel config copied from $(KERNEL_DEFCONFIG) has some config issue." ; \
	  echo "Final '.config' and '.config.old' differ. This should never happen." ; \
	  echo "Observed diffs are :" ; \
	  cat $(CHECK_CONFIG_LOG) ; \
	  echo "Root cause is probably that a dependancy declared in Kconfig is not respected" ; \
	  echo "or config was added in Kconfig but value not explicitly added to defconfig." ; \
	  echo "Recommanded method to generate defconfig is menuconfig tool instead of manual edit." ; \
	  exit 1;  fi;

$(KERNEL_CONFIG): $(KERNEL_CONFIG_DEPS) | yoctotoolchain checkdefconfig
	$(hide) echo "KERNEL_CONFIG_PREV_DEPS := $^" > $(KERNEL_CONFIG_MK)
	$(hide) cat $^ > $@
	@echo "Generating Kernel configuration, using $^"
	$(MAKE) $(KERNEL_MAKE_OPTIONS) oldconfig

$(PRODUCT_OUT)/kernel: $(LOCAL_KERNEL) copy_modules
	cp $(LOCAL_KERNEL) $@

{{#modules_in_bootimg}}
# kernel modules must be copied before ramdisk is generated
$(PRODUCT_OUT)/ramdisk.img: copy_modules
{{/modules_in_bootimg}}
{{^modules_in_bootimg}}
# kernel modules must be copied before systemimage is generated
$(PRODUCT_OUT)/system.img: copy_modules
{{/modules_in_bootimg}}

# Copy modules in directory pointed by $(KERNEL_MODULES_ROOT)
# First copy modules keeping directory hierarchy lib/modules/`uname-r`for libkmod
# Second, create flat hierarchy for insmod linking to previous hierarchy
copy_modules: $(LOCAL_KERNEL) build_external_modules
	@echo Copy modules from $(LOCAL_KERNEL_PATH)/lib/modules/$(KERNELRELEASE) into $(ANDROID_PRODUCT_OUT)/$(KERNEL_MODULES_ROOT)
	$(hide) rm -rf $(ANDROID_PRODUCT_OUT)/$(KERNEL_MODULES_ROOT)
	$(hide) rm -rf $(TARGET_RECOVERY_OUT)/$(KERNEL_MODULES_ROOT)
	$(hide) mkdir -p $(ANDROID_PRODUCT_OUT)/$(KERNEL_MODULES_ROOT)
	$(hide) cd $(LOCAL_KERNEL_PATH)/lib/modules/$(KERNELRELEASE) && for f in `find . -name '*.ko' -or -name 'modules.*'`; do \
		cp $$f $(ANDROID_PRODUCT_OUT)/$(KERNEL_MODULES_ROOT)/$$(basename $$f) || exit 1; \
		mkdir -p $(ANDROID_PRODUCT_OUT)/$(KERNEL_MODULES_ROOT)/$(KERNELRELEASE)/$$(dirname $$f) ; \
		ln -s /$(KERNEL_MODULES_ROOT_PATH)/$$(basename $$f) $(ANDROID_PRODUCT_OUT)/$(KERNEL_MODULES_ROOT)/$(KERNELRELEASE)/$$f || exit 1; \
		done
{{#camera_cos_hack}}
ifeq ($(KERNEL_MODULES_ROOT),system/lib/modules)
	$(hide) mkdir -p $(PRODUCT_OUT)/root/system/lib/modules/
	$(hide) for f in atomisp-css2401a0_v21.ko videobuf-core.ko videobuf-vmalloc.ko; do \
		find $(LOCAL_KERNEL_PATH)/lib/modules/ -name $$f -exec cp {} $(PRODUCT_OUT)/root/system/lib/modules/ \; ;\
		done

$(PRODUCT_OUT)/ramdisk.img: copy_modules
endif
{{/camera_cos_hack}}

$(LOCAL_KERNEL): yoctotoolchain $(MINIGZIP) $(KERNEL_CONFIG) $(BOARD_DTB)
	$(MAKE) $(KERNEL_MAKE_OPTIONS)
	$(MAKE) $(KERNEL_MAKE_OPTIONS) modules
	$(MAKE) $(KERNEL_MAKE_OPTIONS) INSTALL_MOD_STRIP=1 modules_install
{{#build_dtbs}}
	cp $(LOCAL_KERNEL_PATH)/scripts/dtc/dtc $(LOCAL_KERNEL_PATH)
{{/build_dtbs}}


# modules can be built in parallel, but due to depmod
# they should be installed one at a time.

PREVIOUS_KERNEL_MODULE := $(LOCAL_KERNEL)

define bld_external_module
build_$(1): $(LOCAL_KERNEL)
	@echo BUILDING $(1)
	@mkdir -p $(LOCAL_KERNEL_PATH)/../modules/$(1) ;
	+$(MAKE) $(KERNEL_MAKE_OPTIONS) M=$(EXTMOD_SRC)/$(1) $(ADDITIONAL_ARGS_$(subst /,_,$(1))) modules

install_$(1): build_$(1) $(PREVIOUS_KERNEL_MODULE)
	@echo INSTALLING $(1)
	+$(MAKE) $(KERNEL_MAKE_OPTIONS) M=$(EXTMOD_SRC)/$(1) INSTALL_MOD_STRIP=1 modules_install

build_external_modules: install_$(1)

$(eval PREVIOUS_KERNEL_MODULE := install_$(1))
endef

{{#use_bcmdhd}}
EXTERNAL_MODULES += bcm43xx/{{{extmod_platform}}} bcm43xx/{{{extmod_platform}}}_pcie
ADDITIONAL_ARGS_bcm43xx_{{{extmod_platform}}} := CONFIG_BCM43241=m CONFIG_BCMDHD=m CONFIG_BCMDHD_PCIE=  CONFIG_BCMDHD_SDIO=y
ADDITIONAL_ARGS_bcm43xx_{{{extmod_platform}}}_pcie := CONFIG_BCM4356=m CONFIG_BCMDHD=m CONFIG_BCMDHD_PCIE=y CONFIG_BCMDHD_SDIO=
{{/use_bcmdhd}}

$(foreach m,$(EXTERNAL_MODULES),$(eval $(call bld_external_module,$(m))))

build_external_modules: $(LOCAL_KERNEL)

{{#build_dtbs}}
$(BOARD_DTB): yoctotoolchain $(KERNEL_CONFIG)
	$(MAKE) $(KERNEL_MAKE_OPTIONS) dtbs
	cp $(LOCAL_KERNEL_PATH)/arch/x86/boot/dts/{{{board_dtb}}} $@
{{/build_dtbs}}

{{#build_dtbs}}
define board_dtb_per_variant
BOARD_DTB.$(1) := $(LOCAL_KERNEL_PATH)/$$(BOARD_DTB_FILE.$(1))

ifneq ({{{board_dtb}}}, $$(BOARD_DTB_FILE.$(1)))
$$(BOARD_DTB.$(1)): $(BOARD_DTB)
	cp $(LOCAL_KERNEL_PATH)/arch/x86/boot/dts/$$(BOARD_DTB_FILE.$(1)) $$@
endif
endef

$(foreach v,$(BOARD_DTB_VARIANTS),$(eval $(call board_dtb_per_variant,$(v))))
{{/build_dtbs}}

# Add a kernel target, so "make kernel" will build the kernel
.PHONY: kernel
kernel: copy_modules $(PRODUCT_OUT)/kernel

endif
{{/useprebuilt}}
