# Copyright (C) 2013 ParanoidAndroid Project
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

# Check for target product

ifeq (pa_i9100,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_hdpi

PREFS_FROM_SOURCE ?= false

# Inherit telephony common stuff
$(call inherit-product, vendor/pa/configs/telephony.mk)

# Include AOSPA common configuration
include vendor/pa/main.mk

# Inherit device configuration
$(call inherit-product, device/samsung/i9100/full_i9100.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_i9100
PRODUCT_DEVICE := i9100
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := GT-I9100
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=GT-I9100 TARGET_DEVICE=GT-I9100 BUILD_FINGERPRINT=samsung/GT-I9100/GT-I9100:4.0.3/IML74K/XXLPQ:user/release-keys PRIVATE_BUILD_DESC="GT-I9100-user 4.0.3 IML74K XXLPQ release-keys"

endif