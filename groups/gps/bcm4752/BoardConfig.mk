GPS_CHIP_VENDOR := bcm
GPS_CHIP := 4752

BOARD_SEPOLICY_DIRS += device/intel/sepolicy/gps/bcm4752
BOARD_SEPOLICY_M4DEFS += gps_bcm4752_tty=/dev/{{{tty}}}
{{#gnss_sv_status}}
ADDITIONAL_DEFAULT_PROPERTIES += ro.gnss.sv.status=true
{{/gnss_sv_status}}
