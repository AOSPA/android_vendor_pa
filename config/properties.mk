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
BUILD_FINGERPRINT ?= google/redfin/redfin:11/RQ3A.210605.005/7349499:user/release-keys
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
