BOARD_SEPOLICY_DIRS += device/intel/sepolicy/ipcs/common
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/ipcs/sofia

{{#modem_manager_supp}}
# Enable -MODEM_MANAGER_SUPPORT
MODEM_MANAGER_SUPPORT := true
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/ipcs/mmgr
{{/modem_manager_supp}}
