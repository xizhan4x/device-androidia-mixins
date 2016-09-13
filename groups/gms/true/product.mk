FLAG_GMS_AVAILABLE ?= true
ifeq ($(FLAG_GMS_AVAILABLE),true)
{{#minimal}}
FLAG_GMS_MINIMAL := true
{{/minimal}}
{{#googlecamera}}
FLAG_GMS_WITH_GOOGLECAMERA := true
{{/googlecamera}}
{{#new_googlecamera}}
FLAG_GMS_WITH_NEW_GOOGLECAMERA := true
{{/new_googlecamera}}
{{#stub_apps}}
FLAG_GMS_WITH_STUB_APPS := true
{{/stub_apps}}
{{#force_bugle}}
FLAG_GMS_WITH_BUGLE_FORCE := true
{{/force_bugle}}
{{^car}}
$(call inherit-product-if-exists, vendor/google/gms/products/intel_gms.mk)
{{/car}}
{{#car}}
$(call inherit-product-if-exists, vendor/google/gms/products/gms_car.mk)
{{/car}}
endif
