ifneq ($(wildcard vendor/intel/PRIVATE/cert/testkey*),)
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/intel/PRIVATE/cert/testkey
endif
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/libiha
