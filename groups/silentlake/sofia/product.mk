# sl_vmm.efi is the Silent Lake VMM, but it does not need to
# be "built" which is why it is not in the list.
# It is picked up directly bythe  part of the build that constructs
# the ESP partition in the case that silent lake is enabled
PRODUCT_PACKAGES += silentlake_OEM_libs sl_si_service vidt_sign.bin
PRODUCT_PACKAGES += sl_installer
