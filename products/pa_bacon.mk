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

ifeq (pa_bacon,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_xxhdpi

# Build paprefs from sources
PREFS_FROM_SOURCE ?= true

# Include ParanoidAndroid common configuration
include vendor/pa/main.mk

# Inherit AOSP device configuration
$(call inherit-product, device/oneplus/bacon/full_bacon.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_bacon
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := One A0001
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=occam BUILD_FINGERPRINT="google/occam/mako:4.4.4/KTU84P/1227136:user/release-keys" PRIVATE_BUILD_DESC="occam-user 4.4.4 KTU84P 1227136 release-keys"

endif
