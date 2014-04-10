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
ifeq (pa_jemlte,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_tvdpi

# Build paprefs from sources
PREFS_FROM_SOURCE ?= false

# Inherit telephony common stuff
$(call inherit-product, vendor/pa/configs/telephony.mk)

# Include ParanoidAndroid common configuration
include vendor/pa/main.mk

# Inherit AOSP device configuration
$(call inherit-product, device/amazon/jemlte/full_jemlte.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_jemlte
PRODUCT_DEVICE := jemlte
PRODUCT_RELEASE_NAME := KindleFireHD
PRODUCT_BRAND := google
PRODUCT_MODEL := Amazon Jem LTE
PRODUCT_MANUFACTURER := android

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=jemlte TARGET_DEVICE=jemlte

endif
