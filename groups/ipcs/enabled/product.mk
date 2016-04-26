# Inter Process Collaboration Service (IPCS)
PRODUCT_PACKAGES_DEBUG += \
    libipcs \
    libipcservice_tcpip_plugin \
    libipcservice_tty_plugin \
    libipcservice_uds_plugin

# IPCS daemon
PRODUCT_PACKAGES_DEBUG += \
    ipcsd

# IPCS Client program
PRODUCT_PACKAGES_DEBUG += \
    ipcs_client
