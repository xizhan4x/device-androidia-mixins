PRODUCT_PACKAGES += \
    rvc \
    media-ctl


$(foreach t, $(patsubst $(LOCAL_PATH)/splash/%.png,%,$(wildcard $(LOCAL_PATH)/splash/intel_*.png)) ,\
$(eval PRODUCT_COPY_FILES += $(LOCAL_PATH)/splash/$(t).png:root/splash/$(t).png ))
PRODUCT_COPY_FILES += $(LOCAL_PATH)/splash/splash.png:root/splash/splash.png
