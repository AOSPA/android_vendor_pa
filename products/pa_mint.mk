# Copyright (C) 2014 ParanoidAndroid Project
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

ifeq (pa_mint,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_xhdpi

PREFS_FROM_SOURCE ?= false

# Inherit telephony common stuff
$(call inherit-product, vendor/pa/configs/telephony.mk)

# Include AOSPA common configuration
include vendor/pa/main.mk

# Inherit device configuration
$(call inherit-product, device/sony/mint/full_mint.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_mint
PRODUCT_DEVICE := mint
PRODUCT_BRAND := sony
PRODUCT_MANUFACTURER := Sony
PRODUCT_MODEL := Xperia T
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=LT30p \
    BUILD_FINGERPRINT=Sony/LT30p/LT30p:4.3/9.2.A.0.295/2P7_tg:user/release-keys \
    PRIVATE_BUILD_DESC="LT30p-user 4.3 JB-MR2-BLUE-CAF-140119-1326 51 test-keys"

endif
