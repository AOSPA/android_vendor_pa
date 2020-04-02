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

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=MM-dd-yyyy \
    media.recorder.show_manufacturer_and_model=true \
    net.tethering.noprovisioning=true \
    persist.sys.disable_rescue=true \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.build.selinux=1 \
    ro.carrier=unknown \
    ro.com.android.dataroaming=false \
    ro.config.bt_sco_vol_steps=30 \
    ro.config.media_vol_steps=30 \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.opa.eligible_device=true \
    ro.setupwizard.enterprise_mode=1 \
    ro.storage_manager.enabled=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.boot.vendor.overlay.theme=com.android.internal.systemui.navbar.gestural \
    persist.sys.fflag.override.settings_network_and_internet_v2=true

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# Default notification/alarm sounds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.alarm_alert=Bright_morning.ogg \
    ro.config.notification_sound=End_note.ogg

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

# Power whitelist
PRODUCT_COPY_FILES += \
    vendor/pa/config/permissions/pa-power-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/pa-power-whitelist.xml \
    vendor/pa/config/permissions/qti_whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/qti_whitelist.xml

# Copy all pa-specific init rc files
$(foreach f,$(wildcard vendor/pa/prebuilt/etc/init/*.rc),\
    $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM)/etc/init/$(notdir $f)))

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.sip.voip.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/handheld_core_hardware.xml \
    vendor/pa/config/permissions/privapp-permissions-pa-system.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-pa.xml \
    vendor/pa/config/permissions/privapp-permissions-pa-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-pa.xml

# Fonts
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/pa/prebuilt/fonts,$(TARGET_COPY_OUT_PRODUCT)/fonts) \
	vendor/pa/prebuilt/etc/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml

# Markup Google
PRODUCT_COPY_FILES += \
    vendor/pa/prebuilt/lib/libsketchology_native.so:system/lib/libsketchology_native.so \
    vendor/pa/prebuilt/lib64/libsketchology_native.so:system/lib64/libsketchology_native.so

# Enforce privapp-permissions whitelist
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.control_privapp_permissions=enforce

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Common overlay
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/pa/overlay/common
DEVICE_PACKAGE_OVERLAYS += vendor/pa/overlay/common

ifeq ($(TARGET_BUILD_VARIANT),user)
# Enable ADB authentication
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=1
else
# Disable ADB authentication
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=0
PRODUCT_PACKAGES += \
    adb_root
endif

# Include the custom PA bootanimation
ifneq ($(TARGET_BOOT_ANIMATION_RES),)
PRODUCT_COPY_FILES += \
    vendor/pa/prebuilt/bootanimation/$(TARGET_BOOT_ANIMATION_RES).zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
endif

# Packages
include vendor/pa/config/packages.mk

# PA version
include vendor/pa/config/version.mk

# QCOM
include vendor/pa/config/qcom_utils.mk

# Sdclang
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

# Optimize everything for preopt
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := everything

# Use default filter for problematic apps
PRODUCT_DEXPREOPT_QUICKEN_APPS += \
    Dialer \
    ChromePublic

# Enable ALLOW_MISSING_DEPENDENCIES on Vendorless Builds
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
  ALLOW_MISSING_DEPENDENCIES := true
endif

# Disable EAP Proxy because it depends on proprietary headers
# and breaks WPA Supplicant compilation.
DISABLE_EAP_PROXY := true

#skip boot jars check
SKIP_BOOT_JARS_CHECK := true

# Charger mode images
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    android.hidl.base@1.0.vendor \
    android.hidl.manager@1.0.vendor

# Move Wi-Fi modules to vendor
PRODUCT_VENDOR_MOVE_ENABLED := true

# SECCOMP Extension
BOARD_SECCOMP_POLICY += vendor/pa/seccomp

# video seccomp policy files
PRODUCT_COPY_FILES += \
    vendor/pa/seccomp/codec2.software.ext.policy:$(TARGET_COPY_OUT)/etc/seccomp_policy/codec2.software.ext.policy \
    vendor/pa/seccomp/codec2.vendor.ext.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/codec2.vendor.ext.policy \
    vendor/pa/seccomp/mediacodec-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    vendor/pa/seccomp/mediaextractor-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

$(call inherit-product-if-exists, vendor/partner_gms/products/gms.mk)
$(call inherit-product-if-exists, vendor/partner_gms/products/turbo.mk)
