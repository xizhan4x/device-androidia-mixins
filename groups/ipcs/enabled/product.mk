# Inter Process Collaboration Service (IPCS)
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    libipcs \
    libipcservice_tcpip_plugin \
    libipcservice_tty_plugin \
    libipcservice_uds_plugin

# IPCS daemon
PRODUCT_PACKAGES += \
    ipcsd

# IPCS Client program
PRODUCT_PACKAGES += \
    ipcs_client
endif
