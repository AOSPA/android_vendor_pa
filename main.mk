# Copyright (C) 2013-2017 Paranoid Android
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

export VENDOR := pa

# Enable SIP+VoIP
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Include vendor overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/common

# Recommend using the non debug dexpreopter
USE_DEX2OAT_DEBUG := false

# Include APN information
PRODUCT_COPY_FILES += vendor/pa/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# Include support for preconfigured permissions
PRODUCT_COPY_FILES += vendor/pa/prebuilt/etc/default-permissions/pa-permissions.xml:system/etc/default-permissions/pa-permissions.xml

# Include needed privapp permissions whitelist
PRODUCT_COPY_FILES += vendor/pa/prebuilt/etc/privapp-permissions/pa-permissions.xml:system/etc/sysconfig/pa-permissions.xml

# Copy PA specific init file
PRODUCT_COPY_FILES += vendor/pa/prebuilt/root/init.pa.rc:root/init.pa.rc

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += libprotobuf-cpp-full

# Include support for additional filesystems
PRODUCT_PACKAGES += \
    e2fsck \
    mke2fs \
    tune2fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g

# Include support for GApps backup
PRODUCT_COPY_FILES += \
    vendor/pa/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/pa/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/pa/prebuilt/bin/50-backuptool.sh:system/addon.d/50-backuptool.sh

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/pa/prebuilt/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/pa/prebuilt/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/pa/prebuilt/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# Include hostapd configuration
PRODUCT_COPY_FILES += \
    vendor/pa/prebuilt/etc/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    vendor/pa/prebuilt/etc/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny \
    vendor/pa/prebuilt/etc/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept

# Build Chromium Browser
PRODUCT_PACKAGES += ChromePublic

# Build ParanoidCamera
ifneq ($(TARGET_USES_AOSP_CAMERA),true)
PRODUCT_PACKAGES += ParanoidCamera
endif

# Build ParanoidHub
PRODUCT_PACKAGES += ParanoidHub

# Build ParanoidPapers
PRODUCT_PACKAGES += ParanoidPapers

# Build Snapdragon apps
PRODUCT_PACKAGES += \
    SnapdragonGallery \
    SnapdragonMusic

# Build sound recorder
PRODUCT_PACKAGES += SoundRecorder

# Build WallpaperPicker
PRODUCT_PACKAGES += WallpaperPicker

# Include the custom PA bootanimation
ifeq ($(TARGET_BOOT_ANIMATION_RES),480)
     PRODUCT_COPY_FILES += vendor/pa/prebuilt/bootanimation/480.zip:system/media/bootanimation.zip
endif
ifeq ($(TARGET_BOOT_ANIMATION_RES),720)
     PRODUCT_COPY_FILES += vendor/pa/prebuilt/bootanimation/720.zip:system/media/bootanimation.zip
endif
ifeq ($(TARGET_BOOT_ANIMATION_RES),1080)
     PRODUCT_COPY_FILES += vendor/pa/prebuilt/bootanimation/1080.zip:system/media/bootanimation.zip
endif
ifeq ($(TARGET_BOOT_ANIMATION_RES),1440)
     PRODUCT_COPY_FILES += vendor/pa/prebuilt/bootanimation/1440.zip:system/media/bootanimation.zip
endif
ifeq ($(TARGET_BOOT_ANIMATION_RES),2160)
     PRODUCT_COPY_FILES += vendor/pa/prebuilt/bootanimation/2160.zip:system/media/bootanimation.zip
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

ifeq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=1
else
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=0
endif

# TCP Connection Management
PRODUCT_PACKAGES += tcmiface
PRODUCT_BOOT_JARS += tcmiface

# RCS Service
PRODUCT_PACKAGES += \
    rcscommon \
    rcscommon.xml \
    rcsservice \
    rcs_service_aidl \
    rcs_service_aidl.xml \
    rcs_service_aidl_static \
    rcs_service_api \
    rcs_service_api.xml

# Bluetooth Audio (A2DP)
PRODUCT_PACKAGES += libbthost_if

# MSIM manual provisioning
PRODUCT_PACKAGES += telephony-ext
PRODUCT_BOOT_JARS += telephony-ext

# Include vendor SEPolicy changes
include vendor/pa/sepolicy/sepolicy.mk

# Include proprietary header flags if vendor/head exists
-include vendor/head/head-capabilities.mk

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
