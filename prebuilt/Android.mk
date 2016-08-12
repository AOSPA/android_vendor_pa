LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE        := libjni_latinimegoogle
LOCAL_MODULE_CLASS  := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_STRIP_MODULE  := false
LOCAL_MULTILIB      := 32
LOCAL_OVERRIDES_PACKAGES := libjni_latinime
LOCAL_MODULE_TAGS   := optional
LOCAL_SRC_FILES  := lib/libjni_latinimegoogle.so
LOCAL_MODULE_PATH   := $(PRODUCT_OUT)/system/lib
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_PREBUILT)

$(LOCAL_INSTALLED_MODULE): $(LOCAL_BUILT_MODULE) | $(ACP)
	@echo "Install (overridden): $@"
	$(hide) $(ACP) -fp $< $(dir $@)libjni_latinime.so

include $(CLEAR_VARS)
LOCAL_MODULE        := libjni_latinimegoogle
LOCAL_MODULE_CLASS  := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_STRIP_MODULE  := false
LOCAL_MULTILIB      := 64
LOCAL_OVERRIDES_PACKAGES := libjni_latinime
LOCAL_MODULE_TAGS   := optional
LOCAL_SRC_FILES  := lib64/libjni_latinimegoogle.so
LOCAL_MODULE_PATH := $(PRODUCT_OUT)/system/lib64
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_PREBUILT)

$(LOCAL_INSTALLED_MODULE): $(LOCAL_BUILT_MODULE) | $(ACP)
	@echo "Install (overridden): $@"
	$(hide) $(ACP) -fp $< $(dir $@)libjni_latinime.so
