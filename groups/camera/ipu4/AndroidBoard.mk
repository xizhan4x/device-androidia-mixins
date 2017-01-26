{{#enable_rvc}}
#Camera isys firmware
CAMERA_FIRMWARE := \
    ipu4_isys_bxt_fw_b0.bin

#Camera psys firmware
CAMERA_FIRMWARE += \
    ipu4_psys_bxt_fw_b0.bin

#Camera cpd file
CAMERA_FIRMWARE += \
    ipu4_cpd_b0.bin

copy_firmware: $(CAMERA_FIRMWARE)
	$(hide) mkdir -p $(PRODUCT_OUT)/root/vendor/firmware
	$(hide) for f in $(CAMERA_FIRMWARE); do \
		find $(TARGET_OUT_VENDOR)/firmware -name $$f -exec cp {} $(PRODUCT_OUT)/root/vendor/firmware \; ;\
		done

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

$(PRODUCT_OUT)/ramdisk.img: copy_firmware copy_i915_firmware
{{/enable_rvc}}
