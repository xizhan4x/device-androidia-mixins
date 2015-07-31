{{^useprebuilt}}
ifeq ($(TARGET_PREBUILT_KERNEL),)

LOCAL_KERNEL_PATH := $(PRODUCT_OUT)/obj/kernel
KERNEL_BUILD_OUTPUT := ../../$(LOCAL_KERNEL_PATH)
KERNEL_INSTALL_MOD_PATH := .
LOCAL_KERNEL := $(LOCAL_KERNEL_PATH)/arch/x86/boot/{{{binary_name}}}
LOCAL_KERNEL_MODULE_TREE_PATH := $(LOCAL_KERNEL_PATH)/lib/modules
{{#build_dtbs}}
BOARD_DTB := $(LOCAL_KERNEL_PATH)/{{{board_dtb}}}
{{/build_dtbs}}
LOCAL_KERNEL_SRC := {{{src_path}}}
EXTERNAL_MODULES := {{{external_modules}}} {{{debug_modules}}}
EXTMOD_SRC := ../modules
{{#use_iwlwifi}}
IWL_DEFCONFIG := {{{iwl_defconfig}}}
ifeq ($(IWL_DEFCONFIG), )
IWL_DEFCONFIG := iwlwifi-public
endif
{{/use_iwlwifi}}

ifeq ($(TARGET_BUILD_VARIANT), user)
KERNEL_DEFCONFIG := $(TARGET_KERNEL_ARCH)_defconfig
else
KERNEL_DEFCONFIG := $(TARGET_KERNEL_ARCH)_debug_defconfig
endif

KERNEL_MAKE_OPTIONS := \
    -C $(LOCAL_KERNEL_SRC) \
    O=$(KERNEL_BUILD_OUTPUT) \
    ARCH=$(TARGET_KERNEL_ARCH) \
    INSTALL_MOD_PATH=$(KERNEL_INSTALL_MOD_PATH)

{{#use_iwlwifi}}
KERNEL_MAKE_OPTIONS_IWLWIFI := \
    -C kernel/modules/iwlwifi/{{{extmod_platform}}} \
    ARCH=$(TARGET_KERNEL_ARCH) \
    INSTALL_MOD_PATH=$(KERNEL_INSTALL_MOD_PATH) \
    KLIB_BUILD=../../../../$(LOCAL_KERNEL_PATH) \
    O=../../../../$(LOCAL_KERNEL_PATH)
{{/use_iwlwifi}}

$(PRODUCT_OUT)/kernel: $(LOCAL_KERNEL) copy_modules
	cp $(LOCAL_KERNEL) $@

# Copy modules in directory pointed by $(KERNEL_MODULES_ROOT)
# First copy modules keeping directory hierarchy lib/modules/`uname-r`for libkmod
# Second, create flat hierarchy for insmod linking to previous hierarchy
copy_modules: $(LOCAL_KERNEL)
	@echo Copy modules from $(LOCAL_KERNEL_PATH)/lib/modules into $(ANDROID_PRODUCT_OUT)/$(KERNEL_MODULES_ROOT)
	$(hide) mkdir -p $(ANDROID_PRODUCT_OUT)/$(KERNEL_MODULES_ROOT)
	$(hide) cd $(LOCAL_KERNEL_PATH)/lib/modules/ && for f in `find . -name '*.ko'`; do \
		mkdir -p $(ANDROID_PRODUCT_OUT)/$(KERNEL_MODULES_ROOT)/$$(dirname $$f) ; \
		cp $$f $(ANDROID_PRODUCT_OUT)/$(KERNEL_MODULES_ROOT)/$$(dirname $$f) ; \
		done
	$(hide) cd $(LOCAL_KERNEL_PATH)/lib/modules/ && for f in `find . -name 'modules.*'`; do \
		mkdir -p $(ANDROID_PRODUCT_OUT)/$(KERNEL_MODULES_ROOT)/$$(dirname $$f) ; \
		cp $$f $(ANDROID_PRODUCT_OUT)/$(KERNEL_MODULES_ROOT)/$$(dirname $$f) ; \
		done
	$(hide) cd $(ANDROID_PRODUCT_OUT)/$(KERNEL_MODULES_ROOT) && for f in `find . -name '*.ko'` ; do ln -sf $$f; done
	$(hide) cd $(ANDROID_PRODUCT_OUT)/$(KERNEL_MODULES_ROOT) && for f in `find . -name 'modules.*'` ; do ln -sf $$f; done

$(LOCAL_KERNEL): yoctotoolchain $(MINIGZIP) $(LOCAL_KERNEL_PATH)/.config $(BOARD_DTB)
	$(MAKE) $(KERNEL_MAKE_OPTIONS) $(YOCTO_CROSSCOMPILE)
	$(MAKE) $(KERNEL_MAKE_OPTIONS) $(YOCTO_CROSSCOMPILE) modules
	$(MAKE) $(KERNEL_MAKE_OPTIONS) $(YOCTO_CROSSCOMPILE) INSTALL_MOD_STRIP=1 modules_install
	for dir in $(EXTERNAL_MODULES) ; do \
		$(MAKE) $(KERNEL_MAKE_OPTIONS) $(YOCTO_CROSSCOMPILE) M=$(EXTMOD_SRC)/$$dir modules;\
		$(MAKE) $(KERNEL_MAKE_OPTIONS) $(YOCTO_CROSSCOMPILE) M=$(EXTMOD_SRC)/$$dir INSTALL_MOD_STRIP=1 modules_install ;\
	done
{{#build_dtbs}}
	cp $(LOCAL_KERNEL_PATH)/scripts/dtc/dtc $(LOCAL_KERNEL_PATH)
{{/build_dtbs}}
{{#use_iwlwifi}}
	$(MAKE) $(KERNEL_MAKE_OPTIONS_IWLWIFI) $(YOCTO_CROSSCOMPILE) clean
	$(MAKE) $(KERNEL_MAKE_OPTIONS_IWLWIFI) $(YOCTO_CROSSCOMPILE) defconfig-$(IWL_DEFCONFIG)
	$(MAKE) $(KERNEL_MAKE_OPTIONS_IWLWIFI) $(YOCTO_CROSSCOMPILE) modules
	-$(MAKE) $(KERNEL_MAKE_OPTIONS_IWLWIFI) $(YOCTO_CROSSCOMPILE) INSTALL_MOD_STRIP=1 modules_install
{{/use_iwlwifi}}
{{#use_bcmdhd}}
	$(MAKE) $(KERNEL_MAKE_OPTIONS) $(YOCTO_CROSSCOMPILE) M=$(EXTMOD_SRC)/bcm43xx/{{{extmod_platform}}} CONFIG_BCMDHD=m CONFIG_BCMDHD_PCIE=y CONFIG_BCMDHD_SDIO= modules
	$(MAKE) $(KERNEL_MAKE_OPTIONS) $(YOCTO_CROSSCOMPILE) M=$(EXTMOD_SRC)/bcm43xx/{{{extmod_platform}}} CONFIG_BCMDHD=m CONFIG_BCMDHD_PCIE=y CONFIG_BCMDHD_SDIO= INSTALL_MOD_STRIP=1 modules_install
	$(MAKE) $(KERNEL_MAKE_OPTIONS) $(YOCTO_CROSSCOMPILE) M=$(EXTMOD_SRC)/bcm43xx/{{{extmod_platform}}} CONFIG_BCMDHD=m CONFIG_BCMDHD_PCIE=  CONFIG_BCMDHD_SDIO=y  modules
	$(MAKE) $(KERNEL_MAKE_OPTIONS) $(YOCTO_CROSSCOMPILE) M=$(EXTMOD_SRC)/bcm43xx/{{{extmod_platform}}} CONFIG_BCMDHD=m CONFIG_BCMDHD_PCIE=  CONFIG_BCMDHD_SDIO=y INSTALL_MOD_STRIP=1 modules_install
{{/use_bcmdhd}}

{{#build_dtbs}}
$(BOARD_DTB): yoctotoolchain $(LOCAL_KERNEL_PATH)/.config
	$(MAKE) $(KERNEL_MAKE_OPTIONS) $(YOCTO_CROSSCOMPILE) dtbs
	cp $(LOCAL_KERNEL_PATH)/arch/x86/boot/dts/{{{board_dtb}}} $(LOCAL_KERNEL_PATH)
{{/build_dtbs}}

$(LOCAL_KERNEL_PATH)/.config: yoctotoolchain $(LOCAL_KERNEL_SRC)/arch/x86/configs/$(KERNEL_DEFCONFIG)
	$(hide) mkdir -p $(LOCAL_KERNEL_PATH)
	$(MAKE) $(KERNEL_MAKE_OPTIONS) $(YOCTO_CROSSCOMPILE) KBUILD_DEFCONFIG=$(KERNEL_DEFCONFIG) defconfig

endif
{{/useprebuilt}}
