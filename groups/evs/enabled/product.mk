PRODUCT_COPY_FILES += \
    hardware/intel/evs/app/1.0/evs.json:vendor/etc/evs.json

PRODUCT_PACKAGES += media-ctl-evs \
    android.hardware.automotive.evs.$(TARGET_BOARD_PLATFORM)@1.0-service \
	android.automotive.evs.manager.$(TARGET_BOARD_PLATFORM)@1.0 \
	evs_$(TARGET_BOARD_PLATFORM)_app
