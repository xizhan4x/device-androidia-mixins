GPS_CHIP_VENDOR := intel
GPS_CHIP := cg2000

GPS_POWER := {{{power}}}
GPS_TRANS := {{{trans}}}
GPS_CLOSE_INACTIVE := {{{uart_close}}}
GPS_UART_PM := {{{uart_pm}}}
GPS_SIMU := {{{simu}}}
GPS_AMIL := {{{amil}}}
GPS_AMIL_IF := MDM
GNSS_PULSAR := {{{pulsar}}}
GPS_LPM := {{{gps_lpm}}}

ifeq ($(GPS_LPM),true)
GNSS_LPM_EN_TCXO := true
else
GNSS_LPM_DIS_TCXO := true
endif

BOARD_SEPOLICY_DIRS += device/intel/sepolicy/gps/cg2k

BOARD_SEPOLICY_M4DEFS += sepolicy_module_gps=cg2k \
    gps_cg2k_trans=/dev/{{{trans}}}
