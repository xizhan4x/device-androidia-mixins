# DPTF
{{#intel_modem}}
INTEL_MODEM_CTL := true
{{/intel_modem}}
PRODUCT_PACKAGES += esif_ufd dsp.dv dptf.dv libc++_shared.so \
    Dptf DptfPolicyCritical DptfPolicyPassive2 \
    DptfPolicyVirtualSensor upe_java jhs
{{#thermal_lite}}
PRODUCT_PACKAGES += thermal_lite
{{/thermal_lite}}
