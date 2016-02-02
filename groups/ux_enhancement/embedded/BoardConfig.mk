ifeq ($(INTEL_FEATURE_UX_ENHANCEMENT), true)
UX_MISSCALL_FEATURE := true
UX_CLOCK_FEATURE := true

DEVICE_PACKAGE_OVERLAYS += \
        vendor/intel/ux_enhancement/overlay-screenshot \
        vendor/intel/ux_enhancement/Email/overlay \
        vendor/intel/ux_enhancement/Launcher2_MissedDialerAndMsg/overlay \
        vendor/intel/ux_enhancement/Browser_AddHomePage/overlay \
        device/intel/common/navigationbar/overlay \
        vendor/intel/ux_enhancement/BatteryPercentShow/SystemUI/overlay \
        vendor/intel/ux_enhancement/Keyguard_MissedDialerAndMsg/overlay \
        vendor/intel/ux_enhancement/Music/overlay
ifeq ($(UX_CLOCK_FEATURE)$(UX_MISSCALL_FEATURE), truetrue)
DEVICE_PACKAGE_OVERLAYS += \
        vendor/intel/ux_enhancement/SystemUI/keyguard-system-overlay-merge
else
ifeq ($(UX_CLOCK_FEATURE), true)
DEVICE_PACKAGE_OVERLAYS += \
        vendor/intel/ux_enhancement/SystemUI/systemui-overlay-date-feature
endif
ifeq ($(UX_MISSCALL_FEATURE), true)
DEVICE_PACKAGE_OVERLAYS += \
        vendor/intel/ux_enhancement/Keyguard_MissedDialerAndMsg/overlay-single
endif #UX_MISSCALL_FEATURE eq true
endif #UX_CLOCK_FEATURE eq true && UX_MISSCALL_FEATURE eq true
endif #INTEL_FEATURE_UX_ENHANCEMENT eq true
