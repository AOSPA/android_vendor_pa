# Copyright (C) 2020 Paranoid Android
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

# Android Beam
PRODUCT_COPY_FILES += \
    vendor/pa/config/permissions/android.software.nfc.beam.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.nfc.beam.xml

# ART
# Optimize everything for preopt
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := everything
ifeq ($(TARGET_SUPPORTS_64_BIT_APPS), true)
# Use 64-bit dex2oat for better dexopt time.
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat64.enabled=true
endif

# Boot Animation
ifneq ($(TARGET_BOOT_ANIMATION_RES),)
PRODUCT_COPY_FILES += \
    vendor/pa/prebuilt/bootanimation/$(TARGET_BOOT_ANIMATION_RES).zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
endif

# DRM
ifeq ($(TARGET_SUPPORTS_64_BIT_APPS), true)
TARGET_ENABLE_MEDIADRM_64 := true
endif

# Face Sense
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml

# Filesystem
TARGET_FS_CONFIG_GEN += vendor/pa/config/config.fs

# Fonts
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/pa/prebuilt/fonts/,$(TARGET_COPY_OUT_PRODUCT)/fonts) \
    vendor/pa/prebuilt/etc/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml

# GMS
ifneq ($(TARGET_DISABLES_GMS), true)

# Inherit GMS, Pixel Features, and Modules.
$(call inherit-product, vendor/google/gms/config.mk)
ifeq ($(TARGET_FLATTEN_APEX), false)
$(call inherit-product-if-exists, vendor/google/modules/build/mainline_modules_r.mk)
else
$(call inherit-product-if-exists, vendor/google/modules/build/mainline_modules_r_flatten_apex.mk)
endif

# Don't preoptimize prebuilts when building GMS.
DONT_DEXPREOPT_PREBUILTS := true

else

# Use default filter for problematic AOSP apps.
PRODUCT_DEXPREOPT_QUICKEN_APPS += \
    Dialer

endif #TARGET_DISABLES_GMS

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
     vendor/pa/config/aospa_vendor_framework_compatibility_matrix.xml

# Overlays
include vendor/pa/overlay/overlays.mk

# Packages
include vendor/pa/config/packages.mk

# Properties
include vendor/pa/config/properties.mk

# Version
include vendor/pa/config/version.mk

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    vendor/pa/config/permissions/pa-default-permissions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/default-permissions/pa-default-permissions.xml \
    vendor/pa/config/permissions/privapp-permissions-aospa-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-aospa.xml \
    vendor/pa/config/permissions/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-qti.xml \
    vendor/pa/config/permissions/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml \
    vendor/pa/config/permissions/qti_whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/qti_whitelist.xml

# Pixel Features
$(call inherit-product, vendor/google/pixel/config.mk)

# Include Common Qualcomm Device Tree on Qualcomm Boards
$(call inherit-product-if-exists, device/qcom/common/common.mk)

# Init
PRODUCT_PACKAGES += \
    init.aospa.rc

# Skip boot jars check
SKIP_BOOT_JARS_CHECK := true

# Snapdragon LLVM Compiler
ifneq ($(HOST_OS),linux)
ifneq ($(sdclang_already_warned),true)
$(warning **********************************************)
$(warning * SDCLANG is not supported on non-linux hosts.)
$(warning **********************************************)
sdclang_already_warned := true
endif
else
# include definitions for SDCLANG
include vendor/pa/sdclang/sdclang.mk
endif

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Treble
# Enable ALLOW_MISSING_DEPENDENCIES on Vendorless Builds
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
  ALLOW_MISSING_DEPENDENCIES := true
endif


# Wi-Fi

# Disable EAP Proxy because it depends on proprietary headers
# and breaks WPA Supplicant compilation.
DISABLE_EAP_PROXY := true

# Move Wi-Fi modules to vendor
PRODUCT_VENDOR_MOVE_ENABLED := true
