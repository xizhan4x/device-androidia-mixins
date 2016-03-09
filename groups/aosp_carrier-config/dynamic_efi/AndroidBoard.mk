ifeq ($(TARGET_BUILD_VARIANT),user)
# For security concerns, the software scalability based on EFI
# variable is disabled on USER build.  Device MUST statically choose
# its configuration.
else
$(OEMVARS_OUT)/oemvars-aosp-carrier-%.txt: $(AOSP_CARRIER_PROP_DIR)/%.prop
	$(hide) mkdir -p $(PRODUCT_OUT)/oemvars
	$(hide) echo -e "GUID = fb7e31f5-21de-4c4c-9eb7-163051bb06db\n" > $@
	$(hide) echo -n "AospCarrierConfig    " >> $@
	$(hide) $(foreach line,`cat $<`, \
		echo -n "$(line)%0A" >> $@;)
endif

