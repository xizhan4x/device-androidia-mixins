INTEL_AUDIO_HAL := imc
{{#analog_mic}}
AUD_MICROPHONE_TYPE := analog_mic
{{/analog_mic}}
DEVICE_PACKAGE_OVERLAYS += device/intel/common/audio/overlay
