# Create a mount point for the content partition
CREATE_CONTENT_MOUNT_DIR:
	$(hide) mkdir -p $(PRODUCT_OUT)/root/content;

ALL_DEFAULT_INSTALLED_MODULES += CREATE_CONTENT_MOUNT_DIR
