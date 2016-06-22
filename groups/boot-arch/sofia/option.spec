[mixinfo]
# fstab is using shortcut /dev/block/by-name that is created by
# disk-bus mixin.
deps = disk-bus

[defaults]
throttle_cpu_during_boot = false
num_cpus=4
mv_config_paddr=0x3F000000
msm=true
forceencrypt=true
encryptable=false
watchdog_parameters = 60
watchdog_node = vmm_scu_wdt_enable
persistent_part=15
metadata_part=9
no_watchdog=true
dm_verity=
verity_warning = false
lte_interactive_fastboot_ui_feature=false
use_lte_sepolicy=false
lte_gvb_feature=false
system_partition_size = 2048
userdata_partition_size = 4358
mrd_variant=false
wv_level3=false
enc1080p=true
vp_build = false
ifwi_debug = false
