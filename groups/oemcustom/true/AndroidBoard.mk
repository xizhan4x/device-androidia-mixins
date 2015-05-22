
# Create a mount point for the oem partition
OEM_MOUNT_DIR := $(PRODUCT_OUT)/root/oem

$(OEM_MOUNT_DIR):
	$(hide) mkdir -p $@;

ALL_DEFAULT_INSTALLED_MODULES += $(OEM_MOUNT_DIR)
