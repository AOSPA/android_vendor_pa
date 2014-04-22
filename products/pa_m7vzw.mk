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

ifeq (pa_m7vzw,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_xhdpi

# Build paprefs from sources
PREFS_FROM_SOURCE ?= false

# Inherit telephony common stuff
$(call inherit-product, vendor/pa/configs/telephony.mk)

# Include AOSPA common configuration
include vendor/pa/main.mk

# Inherit device configuration
$(call inherit-product, device/htc/m7vzw/full_m7vzw.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := m7vzw
PRODUCT_NAME := pa_m7vzw
PRODUCT_BRAND := HTC
PRODUCT_MODEL := One
PRODUCT_MANUFACTURER := HTC

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=m7vzw BUILD_ID=KOT49H BUILD_FINGERPRINT="VERIZON/HTCOneVZW/m7wlv:4.4.2/KOT49H/303687.4:user/release-keys" PRIVATE_BUILD_DESC="4.06.651.4 CL303687 release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-verizon

endif
