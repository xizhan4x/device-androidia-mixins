{{#makefile}}
ff_intermediates := $(call intermediates-dir-for,PACKAGING,flashfiles)

# We need a copy of the flashfiles configuration ini in the
# TFP RADIO/ directory
ff_config := $(ff_intermediates)/flashfiles.ini
$(ff_config): $(FLASHFILES_CONFIG) | $(ACP)
	$(copy-file-to-target)

INSTALLED_RADIOIMAGE_TARGET += $(ff_config)

{{#bts}}
# If needed, we have to generate the btsdata files.
# BTS metadata files are to enable Intel Build Tool Suite to support flashing of devices which support scaling
-include $(TARGET_DEVICE_DIR)/bts/btsdata.mk

{{/bts}}
# We take any required images that can't be derived elsewhere in
# the TFP and put them in RADIO/provdata.zip.
ff_intermediates := $(call intermediates-dir-for,PACKAGING,flashfiles)
provdata_zip := $(ff_intermediates)/provdata.zip
ff_root := $(ff_intermediates)/root

define copy-flashfile
$(hide) $(ACP) $(1) $(2)

endef

define deploy_provdata
$(eval ff_var := $(subst provdata,,$(basename $(notdir $(1)))))
$(hide) rm -f $(1)
$(hide) rm -rf $(ff_intermediates)/root$(ff_var)
$(hide) mkdir -p $(ff_intermediates)/root$(ff_var)
$(foreach pair,$(BOARD_FLASHFILES$(ff_var)), \
	$(call copy-flashfile,$(call word-colon,1,$(pair)),$(ff_intermediates)/root$(ff_var)/$(call word-colon,2,$(pair))))
$(hide) zip -qj $(1) $(ff_intermediates)/root$(ff_var)/*
endef

ifneq ($(FLASHFILE_VARIANTS),)
provdata_zip :=
$(foreach var,$(FLASHFILE_VARIANTS), \
	$(eval provdata_zip += $(ff_intermediates)/provdata_$(var).zip) \
	$(eval BOARD_FLASHFILES_$(var) := $(BOARD_FLASHFILES)) \
	$(eval BOARD_FLASHFILES_$(var) += $(BOARD_FLASHFILES_FIRMWARE_$(var))))
$(info $(BOARD_FLASHFILES))
endif

$(provdata_zip): \
		$(foreach pair,$(BOARD_FLASHFILES),$(call word-colon,1,$(pair))) \
{{#bts}}
		$(BTSDATA_FILES) \
{{/bts}}
		| $(ACP) \

	$(call deploy_provdata,$@)


INSTALLED_RADIOIMAGE_TARGET += $(provdata_zip)

{{/makefile}}
