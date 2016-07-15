include $(CLEAR_VARS)
LOCAL_MODULE := surfaceflinger-input
LOCAL_REQUIRED_MODULES := surfaceflinger
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)
LOCAL_SURFACEFLINGER_INPUT_DIFF := "diff --git a/services/surfaceflinger/surfaceflinger.rc b/services/surfaceflinger\nindex 2b4ea2a..0eca220 100644\n--- a/services/surfaceflinger/surfaceflinger.rc\n+++ b/services/surfaceflinger/surfaceflinger.rc\n@@ -1,6 +1,6 @@\n service surfaceflinger /system/bin/surfaceflinger\n     class core\n     user system\n-    group graphics drmrpc readproc\n+    group graphics drmrpc readproc input\n     onrestart restart zygote\n     writepid /sys/fs/cgroup/stune/foreground/tasks"
LOCAL_POST_INSTALL_CMD := $(hide) echo -e $(LOCAL_SURFACEFLINGER_INPUT_DIFF) | patch -p2 $(TARGET_OUT_ETC)/init/surfaceflinger.rc
include $(BUILD_PHONY_PACKAGE)
