PRODUCT_PACKAGES += \
    daemon_cl \
    avb_streamhandler_app \
    avb_streamhandler_client_app \
    pluginias-media_transport-avb_configuration_gp_mrb \
    libias-audio-smartx \
    libias-audio-modules \
    libsmartx-subsystem \
    libavbcontrol-subsystem \
    alsa_aplay \
    alsa_ctl \
    alsa_amixer \
    asound.conf \

AUDIOSERVER_MULTILIB := 64

# for AVB and GPTP services
PRODUCT_PROPERTY_OVERRIDES += persist.eavb.mode=m

# for gPTP service in automotive profile or not
PRODUCT_PROPERTY_OVERRIDES += persist.gptp.automotive_profile={{automotive_profile}}

# for AVB service in D6 mode or not
PRODUCT_PROPERTY_OVERRIDES += persist.d6.mode=n

# SmartX module Properties
smxelements := CFG SMX EVT RZN AHD MDL SXC SHM SMW RB DP DBG TST SMJ

PRODUCT_PROPERTY_OVERRIDES += \
    $(foreach item, $(smxelements), persist.media.smartx.$(item)log=3)

PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.audioConf=AudioParameterFramework-tdf8532-eavb-master.xml

PRODUCT_PROPERTY_OVERRIDES += \
    persist.avb.target.name=GrMrb \
    persist.avb.profile.name=MRB_Master_Audio \
    persist.avb.ifname=eth0 \
    persist.avb.pcibus=2 \
    persist.avb.ptp.pdelaycount=0 \
    persist.avb.ptp.synccount=0 \
    persist.avb.audio.tstamp.buffer=0 \
    persist.avb.compatibility.audio="" \
    persist.avb.alsa.groupname=audio \
    persist.avb.igb.to.cnt=5

# AVB Properties
avbelements := _AMN _ASH _ENV _DMY _RXE _TXE _TX1 _TX2 _AAS _ACS _AVS _LAB _LVB _AJI _AEN _PTP _SCD _HCD _RCD _PCD _MCD _ACC _COC _AUI _SHM

PRODUCT_PROPERTY_OVERRIDES += \
    $(foreach item,$(avbelements),persist.avb.debug.loglevel.$(item)=4)
