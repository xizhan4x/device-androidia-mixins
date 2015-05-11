
LIBHALCLIENT_DIR ?= hardware/intel/libhalclient/

# Power Profiles
POWER_PROFILE_LIST:
	@echo "Creating symbolic link on power_profile.xml files"
	@mkdir -p $(TARGET_OUT)/etc;
	@ln -sf $(HAL_FUSE_MOUNT_DEFAULT)/power_profile.xml $(TARGET_OUT)/etc;

ALL_DEFAULT_INSTALLED_MODULES += POWER_PROFILE_LIST
