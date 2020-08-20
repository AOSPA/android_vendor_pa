#
# Copyright (C) 2020 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Check for target product
ifeq (pa_TP1803,$(TARGET_PRODUCT))

# Release name
PRODUCT_RELEASE_NAME := TP1803

# Inherit from build system
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/pa/config/common_full_phone.mk)

# Inherit from device
$(call inherit-product, device/nubia/TP1803/device.mk)

PRODUCT_VENDOR_MOVE_ENABLED := true

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := TP1803
PRODUCT_NAME := statix_TP1803
PRODUCT_BRAND := Nubia
PRODUCT_MODEL := Nubia Mini 5G
PRODUCT_MANUFACTURER := Nubia

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=TP1803
    PRIVATE_BUILD_DESC="TP1803-user 9 PKQ1.190504.001 eng.nubia.20190618.151633 release-keys"

BUILD_FINGERPRINT := nubia/TP1803/TP1803:9/PKQ1.190504.001/nubia06181515:user/release-keys

endif
