[mixinfo]
# fstab is using shortcut /dev/block/by-name that is created by
# disk-bus mixin.
deps = disk-bus

[defaults]
data_encryption = true
verity_warning = true
verity_mode = true
watchdog_parameters = false
run_tco_on_shutdown = false
hung_task_timeout_secs = 120
vendor-partition = false
system_fs = ext4
ifwi_debug = false
config = gr_mrb
