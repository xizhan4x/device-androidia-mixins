GPS_CHIP_VENDOR := intel
GPS_CHIP := cg2000

GPS_POWER := {{{power}}}
GPS_TRANS := {{{trans}}}
GPS_CLOSE_INACTIVE := {{{uart_close}}}
GPS_UART_PM := {{{uart_pm}}}
GPS_LPM := {{{gps_lpm}}}
GPS_SIMU := {{{simu}}}
GNSS_PULSAR := {{{pulsar}}}

{{#rpc_ril}}
GPS_AMIL_RPC := {{{amil}}}
{{/rpc_ril}}
{{^rpc_ril}}
GPS_AMIL := {{{amil}}}
GPS_AMIL_IF := MDM
GPS_AMIL_FA_WITH_GPIO_PIN_CONTROL := {{{fa_gpio}}}
{{/rpc_ril}}

ifeq ($(GPS_LPM),true)
GNSS_LPM_EN_{{{xtal}}} := true
else
GNSS_LPM_DIS_{{{xtal}}} := true
endif

BOARD_SEPOLICY_DIRS += device/intel/sepolicy/gps/cg2k

BOARD_SEPOLICY_M4DEFS += sepolicy_module_gps=cg2k \
    gps_cg2k_trans=/dev/{{{trans}}}

{{#gpp}}
ifeq ($(findstring cws_manu,$(BOARD_SEPOLICY_DIRS)),)
    BOARD_SEPOLICY_DIRS += device/intel/sepolicy/cws_manu
endif
{{/gpp}}

ifneq (, $(filter r2_%, $(TARGET_PRODUCT)))
    ADDITIONAL_DEFAULT_PROPERTIES += ro.gnss.sv.status=true
endif
