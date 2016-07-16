# Create the symbolic link /system/etc/camera3_profiles.xml pointing to
# /system/rt/hal_fuse/camera3_profiles.xml. The symink uses a relative
# path to point to its target and a fake file is created into the
# target folder so the link is valid in both the build tree and the device
# tree.

CAMERA3_PROFILES_LINK := $(PRODUCT_OUT)/system/etc/camera3_profiles.xml
CAMERA3_PROFILES_TARGET := ../rt/hal_fuse/camera3_profiles.xml

$(CAMERA3_PROFILES_LINK):
	$(hide) echo "Creating symbolic link on $(notdir $@)"
	$(eval PRV_TARGET := $(call word-colon, 2, $(filter $@:%, $(AUTODETECT_LINK_PAIRS))))
	$(hide) mkdir -p $(dir $@)
	$(hide) mkdir -p $(dir $(dir $@)$(CAMERA3_PROFILES_TARGET))
	$(hide) touch $(dir $@)$(CAMERA3_PROFILES_TARGET)
	$(hide) ln -sf $(CAMERA3_PROFILES_TARGET) $@

ALL_DEFAULT_INSTALLED_MODULES += $(CAMERA3_PROFILES_LINK)
