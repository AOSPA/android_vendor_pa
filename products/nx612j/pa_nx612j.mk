#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
# Copyright (c) 2017-2018, Flowertome.
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
ifeq (pa_nx612j,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

include device/qcom/common/common.mk

# Inherit device configuration
$(call inherit-product, device/nubia/nx612j/common.mk)

# Device identifier. This is for the vendor's private library
BOARD_VENDOR := nubia
TARGET_VENDOR := nubia

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := nx612j
PRODUCT_NAME := pa_nx612j
PRODUCT_BRAND := nubia
PRODUCT_MODEL := NX612J
PRODUCT_MANUFACTURER := nubia

PRODUCT_GMS_CLIENTID_BASE := android-nubia

# Build fingerprint variant
PRODUCT_BUILD_PROP_OVERRIDES += \
     BUILD_FINGERPRINT=nubia/NX612J/NX612J:7.1.2/N2G47H/eng.nubia.20180521.161116:user/release-keys \
     PRIVATE_BUILD_DESC="NX612-user 7.1.2 N2G47H eng.nubia.20180521.161116 release-keys"

# Paranoid Android platform
include vendor/pa/main.mk

endif
