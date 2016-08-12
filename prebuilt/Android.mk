LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE        := libjni_latinimegoogle
LOCAL_MODULE_CLASS  := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_STRIP_MODULE  := false
LOCAL_MULTILIB      := both
LOCAL_OVERRIDES_PACKAGES := libjni_latinime
LOCAL_MODULE_TAGS   := optional
LOCAL_SRC_FILES_32  := lib/libjni_latinimegoogle.so
LOCAL_SRC_FILES_64  := lib64/libjni_latinimegoogle.so
LOCAL_MODULE_PATH_32   := $(PRODUCT_OUT)/system/lib
LOCAL_MODULE_PATH_64   := $(PRODUCT_OUT)/system/lib64
include $(BUILD_PREBUILT)
