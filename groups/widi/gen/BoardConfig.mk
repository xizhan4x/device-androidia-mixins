INTEL_WIDI_GEN := true

{{#source}}
# WiDi Source (Transmitter)
INTEL_WIDI := true

BOARD_SEPOLICY_DIRS += device/intel/sepolicy/widi
{{/source}}

{{#sink}}
# WiDi Sink (Receiver)
INTEL_WIDI_SINK := true

# sepolicy rules enhancement for dnsmasq for widi sink.
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/widi/sink
{{/sink}}
