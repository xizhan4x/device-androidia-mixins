# This is needed to enable silver art optimizer.
VENDOR_ART_PATH=vendor/intel/art-extension
{{#config_dex2oat}}
ADDITIONAL_DEFAULT_PROPERTIES += dalvik.vm.dex2oat-flags={{{flags}}}
{{/config_dex2oat}}
