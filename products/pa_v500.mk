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

ifeq (pa_v500,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_xhdpi

# Build paprefs from sources
PREFS_FROM_SOURCE ?= false

# Inherit telephony common stuff

# Include AOSPA common configuration
include vendor/pa/main.mk

# Inherit device configuration
$(call inherit-product, device/lge/v500/v500.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := v500
PRODUCT_NAME := pa_v500
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG-V500
PRODUCT_MANUFACTURER := lge
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=awifi_open_eu BUILD_FINGERPRINT=lge/awifi_open_eu/awifi:4.2.2/JDQ39B/V50010a.1380629540:user/release-keys PRIVATE_BUILD_DESC="awifi_open_eu-user 4.2.2 JDQ39B V50010a.1380629540 release-keys"

endif
