[mixinfo]
# fstab is using shortcut /dev/block/by-name that is created by
# disk-bus mixin.
deps = disk-bus

[defaults]
uefi_arch = x86_64
fastbootefi = true
acpi_permissive = false
use_power_button = false
disable_watchdog = false
watchdog_parameters = false
use_charging_applet = false
ignore_rsci = false
tdos = false
magic_key_timeout = false
bios_variant = release
data_encryption = true
bootloader_policy = false
blpolicy_use_efi_var = true
ignore_not_applicable_reset = false
verity_warning = true
txe_bind_root_of_trust = true
run_tco_on_shutdown = false
hung_task_timeout_secs = 120
bootloader_block_size = 512
vendor = false
