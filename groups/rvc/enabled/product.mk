PRODUCT_PACKAGES += \
    rvc \
    media-ctl \
    RvcApp

PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.nobootanimation=1

$(foreach t, $(patsubst $(LOCAL_PATH)/splash/%.png,%,$(wildcard $(LOCAL_PATH)/splash/intel_*.png)) ,\
$(eval PRODUCT_COPY_FILES += $(LOCAL_PATH)/splash/$(t).png:vendor/splash/$(t).png ))
PRODUCT_COPY_FILES += $(LOCAL_PATH)/splash/splash.png:root/splash/splash.png
