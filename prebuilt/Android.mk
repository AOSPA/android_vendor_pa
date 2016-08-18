LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE        := PA_Browser
LOCAL_SRC_FILES     := app/PA_Browser.apk
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_CLASS  := APPS
LOCAL_CERTIFICATE   := platform
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)

LOCAL_OVERRIDES_PACKAGES := Browser Browser2
LOCAL_MULTILIB := both

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := libjni_latinimegoogle
LOCAL_MODULE_CLASS  := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_STRIP_MODULE  := false
LOCAL_MULTILIB      := 64
LOCAL_MODULE_TAGS   := optional
LOCAL_SRC_FILES_arm64  := lib64/libjni_latinimegoogle.so
LOCAL_MODULE_PATH_arm64   := $(PRODUCT_OUT)/system/lib64
include $(BUILD_PREBUILT)

$(LOCAL_INSTALLED_MODULE): $(LOCAL_BUILT_MODULE) | $(ACP)
	@echo "Install (overridden): $@"
	$(hide) $(ACP) -fp $< $(dir $@)libjni_latinime.so
