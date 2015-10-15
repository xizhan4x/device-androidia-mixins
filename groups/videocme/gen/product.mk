#WebRTC library and reference app
PRODUCT_PACKAGES += videoP2P \
    libwebrtc-video-p2p-jni \
    libwebrtc_full \
    libjingle_full \
    libjingle_peerconnection_so

PRODUCT_PACKAGES += AppRTC
PRODUCT_PACKAGES_DEBUG += WebRTCDemo
# cve video
PRODUCT_PACKAGES += \
    libvideocme-server \
    VideoCmeService \
    com.intel.ir94.videocme \
    com.intel.ir94.videocme.xml \
    libvideocme-jni \
    com.intel.rcs.vsh.vcme
