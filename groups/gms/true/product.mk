FLAG_GMS_AVAILABLE ?= true
ifeq ($(FLAG_GMS_AVAILABLE),true)
{{#minimal}}
FLAG_GMS_MINIMAL := true
{{/minimal}}
{{^car}}
$(call inherit-product-if-exists, vendor/google/gms/products/gms.mk)
{{/car}}
{{#car}}
$(call inherit-product-if-exists, vendor/google/gms/products/gas.mk)
{{/car}}
endif
