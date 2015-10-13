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
ignore_not_applicable_reset = false
verity_warning = true
txe_bind_root_of_trust = true
