# Copyright (C) 2021 Paranoid Android
# SPDX-License-Identifier: MIT

# ADB
ifeq ($(TARGET_BUILD_VARIANT),user)
# Enable ADB authentication.
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=1
else
# Disable ADB authentication.
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=0
endif

# Bluetooth
# Disable AAC whitelist
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.vendor.bt.a2dp.aac_whitelist=false

# Blurs
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.sf.blurs_are_expensive=1 \
    ro.surface_flinger.supports_background_blur=1

# Enforce privapp-permissions whitelist.
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.control_privapp_permissions=enforce

# Fingerprint
ifeq ($(TARGET_BUILD_VARIANT),user)
BUILD_FINGERPRINT ?= google/redfin/redfin:11/RQ3A.210705.001/7380771:user/release-keys
endif

# Gestures
ifneq ($(TARGET_USES_HARDWARE_KEYS),true)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.boot.vendor.overlay.theme=com.android.internal.systemui.navbar.gestural
endif

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    media.recorder.show_manufacturer_and_model=true

# Storage Manager
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.storage_manager.enabled=true

# Volume Steps
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.config.bt_sco_vol_steps=30 \
    ro.config.media_vol_steps=30
