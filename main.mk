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
#PRODUCT_PACKAGES += ParanoidHub

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
ifneq ($(TARGET_BOOT_ANIMATION_RES),)
PRODUCT_COPY_FILES += vendor/pa/prebuilt/bootanimation/$(TARGET_BOOT_ANIMATION_RES).zip:system/media/bootanimation.zip
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
#PRODUCT_BOOT_JARS += tcmiface

# Bluetooth Audio (A2DP)
PRODUCT_PACKAGES += libbthost_if

# MSIM manual provisioning
PRODUCT_PACKAGES += telephony-ext
#PRODUCT_BOOT_JARS += telephony-ext

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

PRODUCT_VERSION_MAJOR = 10
PRODUCT_VERSION_MAINTENANCE := 1

ifeq ($(TARGET_VENDOR_SHOW_MAINTENANCE_VERSION),true)
    PA_VERSION_MAINTENANCE := $(PRODUCT_VERSION_MAINTENANCE)
else
    PA_VERSION_MAINTENANCE := 0
endif

# Set PA_BUILDTYPE from the env RELEASE_TYPE, for jenkins compat

ifndef PA_BUILDTYPE
    ifdef RELEASE_TYPE
        # Starting with "PA_" is optional
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^PA_||g')
        PA_BUILDTYPE := $(RELEASE_TYPE)
    endif
endif

# Filter out random types, so it'll reset to UNOFFICIAL
ifeq ($(filter RELEASE NIGHTLY SNAPSHOT EXPERIMENTAL,$(PA_BUILDTYPE)),)
    PA_BUILDTYPE :=
endif

ifdef PA_BUILDTYPE
    ifneq ($(PA_BUILDTYPE), SNAPSHOT)
        ifdef PA_EXTRAVERSION
            # Force build type to EXPERIMENTAL
            PA_BUILDTYPE := EXPERIMENTAL
            # Remove leading dash from PA_EXTRAVERSION
            PA_EXTRAVERSION := $(shell echo $(PA_EXTRAVERSION) | sed 's/-//')
            # Add leading dash to PA_EXTRAVERSION
            PA_EXTRAVERSION := -$(PA_EXTRAVERSION)
        endif
    else
        ifndef PA_EXTRAVERSION
            # Force build type to EXPERIMENTAL, SNAPSHOT mandates a tag
            PA_BUILDTYPE := EXPERIMENTAL
        else
            # Remove leading dash from PA_EXTRAVERSION
            PA_EXTRAVERSION := $(shell echo $(PA_EXTRAVERSION) | sed 's/-//')
            # Add leading dash to PA_EXTRAVERSION
            PA_EXTRAVERSION := -$(PA_EXTRAVERSION)
        endif
    endif
else
    # If PA_BUILDTYPE is not defined, set to UNOFFICIAL
    PA_BUILDTYPE := UNOFFICIAL
    PA_EXTRAVERSION :=
endif


ifeq ($(PA_BUILDTYPE), UNOFFICIAL)
    ifneq ($(TARGET_UNOFFICIAL_BUILD_ID),)
        PA_EXTRAVERSION := -$(TARGET_UNOFFICIAL_BUILD_ID)
    endif
endif

ifeq ($(PA_BUILDTYPE), RELEASE)
    ifndef TARGET_VENDOR_RELEASE_BUILD_ID
        PA_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MAINTENANCE)$(PRODUCT_VERSION_DEVICE_SPECIFIC)-$(PA_BUILD)
    else
        ifeq ($(TARGET_BUILD_VARIANT),user)
            ifeq ($(PA_VERSION_MAINTENANCE),0)
                PA_VERSION := $(PRODUCT_VERSION_MAJOR)-$(TARGET_VENDOR_RELEASE_BUILD_ID)-$(PA_BUILD)
            else
                PA_VERSION := $(PRODUCT_VERSION_MAJOR).$(PA_VERSION_MAINTENANCE)-$(TARGET_VENDOR_RELEASE_BUILD_ID)-$(PA_BUILD)
            endif
        else
            PA_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MAINTENANCE)$(PRODUCT_VERSION_DEVICE_SPECIFIC)-$(PA_BUILD)
        endif
    endif
else
    ifeq ($(PA_VERSION_MAINTENANCE),0)
        ifeq ($(PA_VERSION_APPEND_TIME_OF_DAY),true)
            PA_VERSION := $(PRODUCT_VERSION_MAJOR)-$(shell date -u +%Y%m%d_%H%M%S)-$(PA_BUILD)-$(PA_BUILDTYPE)$(PA_EXTRAVERSION)
        else
            PA_VERSION := $(PRODUCT_VERSION_MAJOR)-$(shell date -u +%Y%m%d)-$(PA_BUILD)-$(PA_BUILDTYPE)$(PA_EXTRAVERSION)
        endif
    else
        ifeq ($(PA_VERSION_APPEND_TIME_OF_DAY),true)
            PA_VERSION := $(PRODUCT_VERSION_MAJOR).$(PA_VERSION_MAINTENANCE)-$(shell date -u +%Y%m%d_%H%M%S)-$(PA_BUILD)-$(PA_BUILDTYPE)$(PA_EXTRAVERSION)
        else
            PA_VERSION := $(PRODUCT_VERSION_MAJOR).$(PA_VERSION_MAINTENANCE)-$(shell date -u +%Y%m%d)-$(PA_BUILD)-$(PA_BUILDTYPE)$(PA_EXTRAVERSION)
        endif
    endif
endif

PA_DISPLAY_VERSION := $(PA_VERSION)
