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

RVC_BINARY := \
	rvc \
	media-ctl

copy_rvc: $(RVC_BINARY)
	$(hide) mkdir -p $(PRODUCT_OUT)/root/vendor/bin
	$(hide) for f in $(RVC_BINARY); do \
		find $(TARGET_OUT_VENDOR)/bin -name $$f -exec cp {} $(PRODUCT_OUT)/root/vendor/bin \; ;\
		done

$(PRODUCT_OUT)/ramdisk.img: copy_firmware copy_rvc
{{/enable_rvc}}
