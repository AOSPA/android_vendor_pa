LOCAL_PATH := $(call my-dir)

# Java Library
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(call all-subdir-java-files)

LOCAL_MODULE := pa-services

LOCAL_MODULE_TAGS := optional

LOCAL_NO_STANDARD_LIBRARIES := true

LOCAL_JAVA_LIBRARIES := core-oj core-libart framework

LOCAL_OVERRIDES_PACKAGES := oem-services

LOCAL_MODULE_OWNER := pa
LOCAL_PROGUARD_ENABLED := disabled

include $(BUILD_JAVA_LIBRARY)

# Permissions file
include $(CLEAR_VARS)

LOCAL_MODULE := co.aospa.power.ShutdownAOSPA.xml

LOCAL_MODULE_TAGS := optional

LOCAL_MODULE_CLASS := ETC

LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/permissions

LOCAL_SRC_FILES := $(LOCAL_MODULE)

include $(BUILD_PREBUILT)
