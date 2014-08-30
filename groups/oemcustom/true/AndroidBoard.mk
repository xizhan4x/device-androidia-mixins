
# Create a mount point for the oem partition
CREATE_OEM_MOUNT_DIR:
	$(hide) mkdir -p $(PRODUCT_OUT)/root/oem;


ALL_DEFAULT_INSTALLED_MODULES += CREATE_OEM_MOUNT_DIR
