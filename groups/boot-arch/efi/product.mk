TARGET_UEFI_ARCH := {{{uefi_arch}}}
BIOS_VARIANT := {{{bios_variant}}}

$(call inherit-product,build/target/product/verity.mk)

PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/by-name/android_system

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.verified_boot.xml:system/etc/permissions/android.software.verified_boot.xml

{{#acpi_permissive}}
# Kernelflinger won't check the ACPI table oem_id, oem_table_id and
# revision fields
KERNELFLINGER_ALLOW_UNSUPPORTED_ACPI_TABLE := true
{{/acpi_permissive}}
{{#use_power_button}}
# Allow Kernelflinger to use the power key as an input source.
# Doesn't work on most boards.
KERNELFLINGER_USE_POWER_BUTTON := true
{{/use_power_button}}
{{^disable_watchdog}}
# Allow Kernelflinger to start watchdog prior to boot the kernel
KERNELFLINGER_USE_WATCHDOG := true
{{/disable_watchdog}}
{{#use_charging_applet}}
# Allow Kernelflinger to use the non-standard ChargingApplet protocol
# to get battery and charger status and modify the boot flow in
# consequence.
KERNELFLINGER_USE_CHARGING_APPLET := true
{{/use_charging_applet}}
{{#ignore_rsci}}
# Allow Kernelflinger to ignore the non-standard RSCI ACPI table
# to get reset and wake source from PMIC for bringup phase if
# the table reports incorrect data
KERNELFLINGER_IGNORE_RSCI := true
{{/ignore_rsci}}
{{#tdos}}
# TDOS design requires that the device can't be unlocked
# as that would defeat it.
TARGET_NO_DEVICE_UNLOCK := true
{{/tdos}}
{{#bootloader_policy}}
# It activates the Bootloader policy and RMA refurbishing
# features. TARGET_BOOTLOADER_POLICY is the desired bitmask for this
# device.
# * bit 0:
#   - 0: GVB class B.
#   - 1: GVB class A.  Device unlock is not permitted.  The only way
#     to unlock is to use the secured force-unlock mechanism.
# * bit 1 and 2 defines the minimal boot state required to boot the
#   device:
#   - 0x0: BOOT_STATE_RED (GVB default behavior)
#   - 0x1: BOOT_STATE_ORANGE
#   - 0x2: BOOT_STATE_YELLOW
#   - 0x3: BOOT_STATE_GREEN
# If TARGET_BOOTLOADER_POLICY is equal to 'static' the bootloader
# policy is not built but is provided statically in the repository.
# If TARGET_BOOTLOADER_POLICY is equal to 'external' the bootloader
# policy OEMVARS should be installed manually in
# $(BOOTLOADER_POLICY_OEMVARS).
TARGET_BOOTLOADER_POLICY := {{bootloader_policy}}
# If the following variable is set to false, the bootloader policy and
# RMA refurbishing features does not use time-based authenticated EFI
# variables to store the BPM and OAK values.  The BPM value is defined
# compilation time by the TARGET_BOOTLOADER_POLICY variable.
# userfastboot retrieves the OAK SHA256 value from the fastboot.img
# ramdisk.
TARGET_BOOTLOADER_POLICY_USE_EFI_VAR := {{blpolicy_use_efi_var}}
{{/bootloader_policy}}
{{^fastbootefi}}
TARGET_STAGE_USERFASTBOOT := true
TARGET_USE_USERFASTBOOT := true
{{/fastbootefi}}
{{#ignore_not_applicable_reset}}
# Allow Kernelflinger to ignore the RSCI reset source "not_applicable"
# when setting the bootreason
KERNELFLINGER_IGNORE_NOT_APPLICABLE_RESET := true
{{/ignore_not_applicable_reset}}
{{#verity_warning}}
PRODUCT_PACKAGES += \
	slideshow \
	verity_warning_images
{{/verity_warning}}
{{#txe_bind_root_of_trust}}
# It makes kernelflinger bind the device state to the root of trust
# using the TXE.
KERNELFLINGER_TXE_BIND_ROOT_TRUST := true
{{/txe_bind_root_of_trust}}
