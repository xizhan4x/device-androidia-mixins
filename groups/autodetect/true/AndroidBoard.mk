
LIBHALCLIENT_DIR ?= hardware/intel/libhalclient/

ifeq ($(HAL_BIND_MOUNT), true)

# Create symbolic links of various configuration files in /system/etc/
# pointing to bind-mounted or fused files through hald.
#
# AUTODETECT_LINK_PAIRS contains a list of link:target pairs:
#       path/to/symlink1:../../relative/path/to/link_target1 \
#       path/to/symlink2:../relative/path/to/link_target2 \
#       ...
#
# AUTODETECT_LINKS contains the symbolic link files extracted from
# AUTODETECT_LINK_PAIRS
#
# Then a rule for all symbolic links creates them. This rule also creates a
# fake target file (using touch) so the link, that points to its target using
# a relative path, is valid in both the device tree and the build tree (so the
# link is not created again by subsequent make invocations). These fake files
# get overridden by bind-mount or fuse.

# Audio
AUTODETECT_LINK_PAIRS := \
	$(PRODUCT_OUT)/system/etc/mixer_paths.xml:../..$(HAL_FUSE_MOUNT_DEFAULT)/mixer_paths.xml \
	$(PRODUCT_OUT)/system/etc/audio_hw.xml:../..$(HAL_FUSE_MOUNT_DEFAULT)/audio_hw.xml

# Media bind-mounted files
AUTODETECT_LINK_PAIRS += \
	$(PRODUCT_OUT)/system/etc/media_codecs.xml:../..$(HAL_BM_TARGET_MEDIA)/etc/media_codecs.xml \
	$(PRODUCT_OUT)/system/etc/media_codecs_google_audio.xml:../..$(HAL_BM_TARGET_MEDIA)/etc/media_codecs_google_audio.xml \
	$(PRODUCT_OUT)/system/etc/media_codecs_google_video.xml:../..$(HAL_BM_TARGET_MEDIA)/etc/media_codecs_google_video.xml \
	$(PRODUCT_OUT)/system/etc/media_profiles_template.xml:../..$(HAL_BM_TARGET_MEDIA)/etc/media_profiles_template.xml \
	$(PRODUCT_OUT)/system/etc/media_profiles_config.xml:../..$(HAL_BM_TARGET_MEDIA)/etc/media_profiles_config.xml \
	$(PRODUCT_OUT)/system/etc/camera_profiles_config.xml:../..$(HAL_BM_TARGET_MEDIA)/etc/camera_profiles_config.xml

# Media fused files
AUTODETECT_LINK_PAIRS += \
	$(PRODUCT_OUT)/system/etc/media_profiles.xml:../..$(HAL_FUSE_MOUNT_DEFAULT)/media_profiles.xml \
	$(PRODUCT_OUT)/system/etc/camera3_profiles.xml:../..$(HAL_FUSE_MOUNT_DEFAULT)/camera3_profiles.xml

# Power profiles
AUTODETECT_LINK_PAIRS += \
	$(PRODUCT_OUT)/system/etc/power_profile.xml:../..$(HAL_FUSE_MOUNT_DEFAULT)/power_profile.xml

AUTODETECT_LINKS := \
	$(foreach item, $(AUTODETECT_LINK_PAIRS), $(call word-colon, 1, $(item)))

$(AUTODETECT_LINKS):
	$(hide) echo "Creating symbolic link on $(notdir $@)"
	$(eval PRV_TARGET := $(call word-colon, 2, $(filter $@:%, $(AUTODETECT_LINK_PAIRS))))
	$(hide) mkdir -p $(dir $@)
	$(hide) mkdir -p $(dir $(dir $@)$(PRV_TARGET))
	$(hide) touch $(dir $@)$(PRV_TARGET)
	$(hide) ln -sf $(PRV_TARGET) $@

ALL_DEFAULT_INSTALLED_MODULES += $(AUTODETECT_LINKS)

endif
