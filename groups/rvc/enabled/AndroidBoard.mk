I915_FIRMWARE_FILES := \
	$(TARGET_OUT_VENDOR)/firmware/i915/bxt_dmc_ver1.bin \
	$(TARGET_OUT_VENDOR)/firmware/i915/bxt_dmc_ver1_04.bin \
	$(TARGET_OUT_VENDOR)/firmware/i915/bxt_guc_ver1.bin \
	$(TARGET_OUT_VENDOR)/firmware/i915/bxt_guc_ver3.bin \
	$(TARGET_OUT_VENDOR)/firmware/i915/bxt_guc_ver8.bin \
	$(TARGET_OUT_VENDOR)/firmware/i915/huc_gen9lp.bin \


copy_i915_firmware: $(I915_FIRMWARE_FILES)
	mkdir -p $(PRODUCT_OUT)/root/vendor/firmware/i915
	for f in $(I915_FIRMWARE_FILES); do \
	    cp $${f} $(PRODUCT_OUT)/root/vendor/firmware/i915 ; \
	done

hwclock: rvc
	@touch $(PRODUCT_OUT)/root/hwc.lock

$(PRODUCT_OUT)/ramdisk.img: copy_i915_firmware hwclock
