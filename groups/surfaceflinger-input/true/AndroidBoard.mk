include $(CLEAR_VARS)
LOCAL_MODULE := surfaceflinger-input
LOCAL_REQUIRED_MODULES := init.rc
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)
LOCAL_SURFACEFLINGER_INPUT_DIFF := "diff --git a/rootdir/init.rc b/rootdir/init.rc\nindex 317207c..28a3081 100644\n--- a/rootdir/init.rc\n+++ b/rootdir/init.rc\n@@ -644,7 +644,7 @@ service ril-daemon /system/bin/rild\n service surfaceflinger /system/bin/surfaceflinger\n     class core\n     user system\n-    group graphics drmrpc\n+    group graphics drmrpc input\n     onrestart restart zygote\n     writepid /dev/cpuset/system-background/tasks"
LOCAL_POST_INSTALL_CMD := $(hide) echo -e $(LOCAL_SURFACEFLINGER_INPUT_DIFF) | patch -p2 $(TARGET_ROOT_OUT)/init.rc
include $(BUILD_PHONY_PACKAGE)
