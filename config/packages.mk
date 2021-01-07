# Copyright (C) 2021 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# ADB
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    adb_root
endif

# Abstruct
PRODUCT_PACKAGES += \
    Abstruct

# AOSP Packages
PRODUCT_PACKAGES += \
    ThemePicker

# Camera
PRODUCT_PACKAGES += \
    GoogleCameraGo

# Charger Images
PRODUCT_PACKAGES += \
    charger_res_images

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    android.hidl.base@1.0.vendor \
    android.hidl.manager@1.0.vendor

# Neural Network
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-rtti

# Paranoid Packages
PRODUCT_PACKAGES += \
    ParanoidPapers \
    ParanoidQuickStep

ifneq ($(filter RELEASE BETA,$(PA_BUILDTYPE)),)
#    PRODUCT_PACKAGES += \
#    ParanoidHub
endif

# Face Sense
TARGET_ENABLE_FACE_SENSE := true

PRODUCT_PACKAGES += \
    ParanoidFaceSense

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.face.sense_service=$(TARGET_ENABLE_FACE_SENSE)

# Gestures
PRODUCT_PACKAGES += \
    vendor.aospa.power-service

# QTI VNDK Framework Detect
PRODUCT_PACKAGES += \
    libvndfwk_detect_jni.qti \
    libqti_vndfwk_detect \
    libvndfwk_detect_jni.qti.vendor \
    libqti_vndfwk_detect.vendor

# Shell
PRODUCT_PACKAGES += \
    nano

# SystemUI Plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet
