# Copyright (C) 2012 ParanoidAndroid Project
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
ifeq (pa_a510,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_mdpi

# Build paprefs from sources
PREFS_FROM_SOURCE ?= false

# Inherit telephony common stuff
$(call inherit-product, vendor/pa/configs/telephony.mk)

# Include ParanoidAndroid common configuration
include vendor/pa/main.mk

# Inherit AOSP device configuration
$(call inherit-product, device/acer/a510/full_a510.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_a510
PRODUCT_DEVICE := a510
PRODUCT_BRAND := Acer
PRODUCT_MODEL := A510
PRODUCT_MANUFACTURER := acer
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=a510_pa_cus1 TARGET_DEVICE=picasso_m BUILD_FINGERPRINT="acer/a510_pa_cus1/picasso_m:4.1.2/JZO54K/1354108731:user/release-keys" PRIVATE_BUILD_DESC="a510_pa_cus1-user 4.1.2 JZ054K 1354108731 release-keys"

endif
