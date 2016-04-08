TARGET_USE_TESTOS := true

TARGET_TESTOS_ALL_FROM_SYSTEM_PATHS := \
    etc/firmware

TARGET_TESTOS_ALL_FROM_VENDOR_PATHS := \
    firmware

# boot image is too small to include modem fw files
TESTOS_CLEANUP_LIST := \
    vendor/firmware/telephony/*.fls

-include device/intel/selftest/conf/{{device}}.mk
