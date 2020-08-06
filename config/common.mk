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

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/pa/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/pa/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/pa/prebuilt/bin/50-backuptool.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-backuptool.sh \

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/pa/prebuilt/bin/backuptool_ab.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.sh \
    vendor/pa/prebuilt/bin/backuptool_ab.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.functions \
    vendor/pa/prebuilt/bin/backuptool_postinstall.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_postinstall.sh
endif

# Boot Animation
ifneq ($(TARGET_BOOT_ANIMATION_RES),)
PRODUCT_COPY_FILES += \
    vendor/pa/prebuilt/bootanimation/$(TARGET_BOOT_ANIMATION_RES).zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
endif

# Charger Images
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/pa/charger,$(TARGET_COPY_OUT_PRODUCT)/etc/res)

# Filesystem
TARGET_FS_CONFIG_GEN += vendor/pa/config/config.fs

# Fonts
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/pa/prebuilt/fonts,$(TARGET_COPY_OUT_PRODUCT)/fonts) \
    vendor/pa/prebuilt/etc/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml

# GApps
ifneq ($(TARGET_DISABLES_GAPPS), true)

# Inherit GApps Makefiles
$(call inherit-product-if-exists, vendor/partner_gms/products/gms.mk)
$(call inherit-product-if-exists, vendor/partner_gms/products/turbo.mk)
$(call inherit-product-if-exists, vendor/google/gms/gms-vendor.mk)
$(call inherit-product-if-exists, vendor/google/pixel/pixel-vendor.mk)

# Do not preoptimize prebuilts when building GApps
DONT_DEXPREOPT_PREBUILTS := true

else

# Use default filter for problematic AOSP apps
PRODUCT_DEXPREOPT_QUICKEN_APPS += \
    Dialer \
    ChromeModernPublic

endif #TARGET_DISABLES_GAPPS

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
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/handheld_core_hardware.xml \
    vendor/pa/config/permissions/pa-default-permissions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/default-permissions/pa-default-permissions.xml \
    vendor/pa/config/permissions/privapp-permissions-pa-system.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-pa.xml \
    vendor/pa/config/permissions/privapp-permissions-pa-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-pa.xml \
    vendor/pa/config/permissions/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-qti.xml \
    vendor/pa/config/permissions/qti_whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/qti_whitelist.xml \
    vendor/pa/config/permissions/telephony_product_privapp-permissions-qti.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/telephony_product_privapp-permissions-qti.xml

ifeq ($(TARGET_DISABLES_GAPPS), true)
PRODUCT_COPY_FILES += \
    vendor/gapps/system/product/etc/permissions/privapp-permissions-google-p.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-google-p.xml
endif

# QCOM
include vendor/pa/config/qcom_utils.mk
# Include Common Qualcomm Device Tree on Qualcomm Boards
$(call inherit-product-if-exists, device/qcom/common/common.mk)

# Ramdisk
# Copy all pa-specific init rc files
$(foreach f,$(wildcard vendor/pa/prebuilt/etc/init/*.rc),\
    $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM)/etc/init/$(notdir $f)))

# SECCOMP Extension
BOARD_SECCOMP_POLICY += vendor/pa/seccomp

PRODUCT_COPY_FILES += \
    vendor/pa/seccomp/codec2.software.ext.policy:$(TARGET_COPY_OUT)/etc/seccomp_policy/codec2.software.ext.policy \
    vendor/pa/seccomp/codec2.vendor.ext.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/codec2.vendor.ext.policy \
    vendor/pa/seccomp/mediacodec-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    vendor/pa/seccomp/mediaextractor-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

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
