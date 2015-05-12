INTEL_AUDIO_HAL := imc
{{#analog_mic}}
AUD_MICROPHONE_TYPE := analog_mic
{{/analog_mic}}
{{#imas}}
IMAS_VERSION := common_imas
{{/imas}}
DEVICE_PACKAGE_OVERLAYS += device/intel/common/audio/overlay
