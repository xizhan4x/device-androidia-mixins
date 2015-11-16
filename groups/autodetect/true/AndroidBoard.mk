
LIBHALCLIENT_DIR ?= hardware/intel/libhalclient/

ifeq ($(HAL_BIND_MOUNT), true)

# Create symbolic links of various configuration files in /system/etc/
# pointing to bind-mounted or fused files through hald.
#
# AUTODETECT_LINK_PAIRS contains a list of link:target pairs:
#       /path/to/symlink1:/path/to/link_target1 \
#       /path/to/symlink2:/path/to/link_target2 \
#       ...
# Both link and target paths must be absolute in the device root file system.
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
	/system/etc/mixer_paths.xml:$(HAL_FUSE_MOUNT_DEFAULT)/mixer_paths.xml \
	/system/etc/audio_hw.xml:$(HAL_FUSE_MOUNT_DEFAULT)/audio_hw.xml \

# Media bind-mounted files
AUTODETECT_LINK_PAIRS += \
	/system/etc/media_codecs.xml:$(HAL_BM_TARGET_MEDIA)/etc/media_codecs.xml \
	/system/etc/media_codecs_google_audio.xml:$(HAL_BM_TARGET_MEDIA)/etc/media_codecs_google_audio.xml \
	/system/etc/media_codecs_google_video.xml:$(HAL_BM_TARGET_MEDIA)/etc/media_codecs_google_video.xml \
	/system/etc/media_codecs_performance.xml:$(HAL_BM_TARGET_MEDIA)/etc/media_codecs_performance.xml \
	/system/etc/media_profiles_template.xml:$(HAL_BM_TARGET_MEDIA)/etc/media_profiles_template.xml \
	/system/etc/media_profiles_config.xml:$(HAL_BM_TARGET_MEDIA)/etc/media_profiles_config.xml \
	/system/etc/camera_profiles_config.xml:$(HAL_BM_TARGET_MEDIA)/etc/camera_profiles_config.xml \

# Media fused files
AUTODETECT_LINK_PAIRS += \
	/system/etc/media_profiles.xml:$(HAL_FUSE_MOUNT_DEFAULT)/media_profiles.xml \
	/system/etc/camera3_profiles.xml:$(HAL_FUSE_MOUNT_DEFAULT)/camera3_profiles.xml \

# Power profiles
AUTODETECT_LINK_PAIRS += \
	/system/etc/power_profile.xml:$(HAL_FUSE_MOUNT_DEFAULT)/power_profile.xml \

# Realtek bt config
AUTODETECT_LINK_PAIRS += \
	/system/etc/firmware/bt/rtlbt_config:$(HAL_FUSE_MOUNT_DEFAULT)/rtlbt_config \

# Create a list of symlinks from the 1st item in AUTODETECT_LINK_PAIRS
# concatenated to PRODUCT_OUT. We obtain a list of make targets.
AUTODETECT_LINKS := \
	$(foreach item, $(AUTODETECT_LINK_PAIRS), $(call word-colon, 1, $(PRODUCT_OUT)$(item)))

# relative_path
#
# Return the relative path of the passed file up to the filesystem root.
# $(call relative_path /system/etc/camera3_profiles.xml) returns ../..
spc :=
define relative_path
$(eval rel:=)$(subst $(spc) $(spc),/,$(strip $(foreach ,$(subst /, ,$(dir $(1))),$(eval rel := $(rel) ..)) $(rel)))
endef

$(AUTODETECT_LINKS):
	$(hide) echo "Creating symbolic link on $(notdir $@)"
	$(eval PRV_LINK := $(patsubst $(PRODUCT_OUT)%,%,$@))
	$(eval PRV_TARGET := $(call word-colon, 2, $(filter $(PRV_LINK):%, $(AUTODETECT_LINK_PAIRS))))
	$(hide) mkdir -p $(dir $@)
	$(hide) mkdir -p $(dir $(PRODUCT_OUT)$(PRV_TARGET))
	$(hide) touch $(PRODUCT_OUT)$(PRV_TARGET)
	$(eval REL_PATH := $(call relative_path,$(PRV_LINK)))
	$(hide) ln -sf $(REL_PATH)$(PRV_TARGET) $@

ALL_DEFAULT_INSTALLED_MODULES += $(AUTODETECT_LINKS)

endif
