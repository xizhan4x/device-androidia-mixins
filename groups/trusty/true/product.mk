PRODUCT_PACKAGES += \
	keystore.${TARGET_BOARD_PLATFORM} \
	libtrusty \
	intelstorageproxyd \
	libinteltrustystorage \
	libinteltrustystorageinterface \
	gatekeeper.trusty \

PRODUCT_PACKAGES_DEBUG += \
	intel-secure-storage-unit-test \
	gatekeeper-unit-tests \
	libscrypt_static \
	scrypt_test \
