GPS_CHIP_VENDOR := intel
GPS_CHIP := cg2000

GPS_POWER := {{{power}}}
GPS_TRANS := {{{trans}}}
GPS_CLOSE_INACTIVE := {{{uart_close}}}
GPS_UART_PM := {{{uart_pm}}}
GPS_LPM := {{{gps_lpm}}}
GPS_SIMU := {{{simu}}}
GPS_AMIL := {{{amil}}}
GPS_AMIL_IF := MDM

GNSS_LPM_EN_TCXO := true

BOARD_SEPOLICY_DIRS += \
		device/intel/sepolicy/gps/common \
		device/intel/sepolicy/gps/cg2k
