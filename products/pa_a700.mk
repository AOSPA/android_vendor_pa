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
ifeq (pa_a700,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_hdpi

# Build paprefs from sources
PREFS_FROM_SOURCE ?= false

# Inherit telephony common stuff
$(call inherit-product, vendor/pa/configs/telephony.mk)

# Include ParanoidAndroid common configuration
include vendor/pa/main.mk

# Inherit AOSP device configuration
$(call inherit-product, device/acer/a700/full_a700.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_a700
PRODUCT_DEVICE := a700
PRODUCT_BRAND := Acer
PRODUCT_MODEL := A700
PRODUCT_MANUFACTURER := acer
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=a700_emea_cus1 TARGET_DEVICE=picasso_mf BUILD_FINGERPRINT="acer/a700_emea_cus1/picasso_mf:4.0.4/IMM76D/1337332281:user/release-keys" PRIVATE_BUILD_DESC="a700_emea_cus1-user 4.0.4 IMM76D 1337332281 release-keys"

endif
