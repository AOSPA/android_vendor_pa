# Copyright (C) 2021 Paranoid Android
# SPDX-License-Identifier: MIT

# ADB
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    adb_root
endif

# AOSP Packages
PRODUCT_PACKAGES += \
    ThemePicker

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
