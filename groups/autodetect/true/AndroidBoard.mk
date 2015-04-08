
LIBHALCLIENT_DIR ?= hardware/intel/libhalclient/
#
# AUDIO
#
ifeq ($(HAL_BIND_MOUNT), true)
AUDIO_FILES:
	@echo "Creating symbolic link for audio files"
	@mkdir -p $(TARGET_OUT)/etc;
	@ln -sf $(HAL_FUSE_MOUNT_DEFAULT)/mixer_paths.xml $(TARGET_OUT)/etc/;
	@ln -sf $(HAL_FUSE_MOUNT_DEFAULT)/audio_hw.xml $(TARGET_OUT)/etc/;

ALL_DEFAULT_INSTALLED_MODULES += AUDIO_FILES
endif

#
# MEDIA
#
ifeq ($(HAL_BIND_MOUNT), true)

# Create symbolic links for media codecs
MEDIA_CODECS_LIST:
	@echo "Creating symbolic link on media_codecs.xml"
	@mkdir -p $(TARGET_OUT)/etc;
	@ln -sf $(HAL_BM_TARGET_MEDIA)/etc/media_codecs.xml $(TARGET_OUT)/etc/;
	@ln -sf $(HAL_BM_TARGET_MEDIA)/etc/media_codecs_google_audio.xml $(TARGET_OUT)/etc/;
	@ln -sf $(HAL_BM_TARGET_MEDIA)/etc/media_codecs_google_video.xml $(TARGET_OUT)/etc/;

ALL_DEFAULT_INSTALLED_MODULES += MEDIA_CODECS_LIST

# Create symbolic links for media_profiles and camera_profiles
MEDIA_PROFILE_LIST:
	@echo "Creating symbolic link on media_profile templates & config xml files"
	@mkdir -p $(TARGET_OUT)/etc/permissions;
	@ln -sf $(HAL_BM_TARGET_MEDIA)/etc/media_profiles_template.xml $(TARGET_OUT)/etc/;
	@ln -sf $(HAL_BM_TARGET_MEDIA)/etc/media_profiles_config.xml $(TARGET_OUT)/etc/;
	@ln -sf $(HAL_BM_TARGET_MEDIA)/etc/camera_profiles_config.xml $(TARGET_OUT)/etc/;
	@ln -sf $(HAL_FUSE_MOUNT_DEFAULT)/media_profiles.xml $(TARGET_OUT)/etc/;
	@ln -sf $(HAL_FUSE_MOUNT_DEFAULT)/camera3_profiles.xml $(TARGET_OUT)/etc/;

ALL_DEFAULT_INSTALLED_MODULES += MEDIA_PROFILE_LIST
endif

# Power Profiles
POWER_PROFILE_LIST:
	@echo "Creating symbolic link on power_profile.xml files"
	@mkdir -p $(TARGET_OUT)/etc;
	@ln -sf $(HAL_FUSE_MOUNT_DEFAULT)/power_profile.xml $(TARGET_OUT)/etc;

ALL_DEFAULT_INSTALLED_MODULES += POWER_PROFILE_LIST
