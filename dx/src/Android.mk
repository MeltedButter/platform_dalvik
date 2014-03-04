# Copyright 2006 The Android Open Source Project
#
LOCAL_PATH := $(call my-dir)

# This tool is prebuilt if we're doing an app-only build.
ifeq ($(TARGET_BUILD_APPS),)

# dx java library
# ============================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(call all-subdir-java-files)
LOCAL_SRC_FILES += $(call all-java-files-under,../../../libcore/dex/src/main/java)
LOCAL_JAR_MANIFEST := ../etc/manifest.txt
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE:= dx

include $(BUILD_HOST_JAVA_LIBRARY)

INTERNAL_DALVIK_MODULES += $(LOCAL_INSTALLED_MODULE)

endif # TARGET_BUILD_APPS

# dx java library for target
# ============================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(call all-subdir-java-files)
LOCAL_SRC_FILES += $(call all-java-files-under,../../../libcore/dex/src/main/java)
LOCAL_JAR_MANIFEST := ../etc/manifest.txt
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := dx-target

include $(BUILD_JAVA_LIBRARY)

# permissions .xml
# ============================================================
include $(CLEAR_VARS)

LOCAL_MODULE := dx-target.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/permissions
LOCAL_SRC_FILES := $(LOCAL_MODULE)

include $(BUILD_PREBUILT)

# the documentation
# ============================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(call all-subdir-java-files) $(call all-subdir-html-files)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE:= dx
LOCAL_DROIDDOC_OPTIONS := -hidden
LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_IS_HOST_MODULE := true

include $(BUILD_DROIDDOC)
