{{#source}}
# WiDi Source (Transmitter)
PRODUCT_PACKAGES += widi
{{/source}}

{{#sink}}
# WiDi Sink (Receiver)
PRODUCT_PACKAGES += widi_sink

# Script required when WiDi SINK is P2P Group Owner.
PRODUCT_PACKAGES += dhcp_lease_evt.sh
{{/sink}}
