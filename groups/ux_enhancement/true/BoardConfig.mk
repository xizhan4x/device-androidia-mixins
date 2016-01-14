UX_MISSCALL_FEATURE := true

DEVICE_PACKAGE_OVERLAYS += \
        vendor/intel/ux_enhancement/overlay-screenshot \
        vendor/intel/ux_enhancement/Email/overlay \
        vendor/intel/ux_enhancement/Launcher2_MissedDialerAndMsg/overlay \
        vendor/intel/ux_enhancement/Browser_AddHomePage/overlay \
        device/intel/common/navigationbar/overlay \
        vendor/intel/ux_enhancement/BatteryPercentShow/SystemUI/overlay \
        vendor/intel/ux_enhancement/Keyguard_MissedDialerAndMsg/overlay

ifneq ($(UX_CLOCK_FEATURE), true)
DEVICE_PACKAGE_OVERLAYS += \
        vendor/intel/ux_enhancement/Keyguard_MissedDialerAndMsg/overlay-single
endif
