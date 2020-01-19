# Copyright (C) 2018 Paranoid Android
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
ifeq (pa_X01BD,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Include Paranoid Android common configuration
TARGET_BOOT_ANIMATION_RES := 1080

include device/qcom/common/common.mk
include vendor/pa/config/common_full_phone.mk

# Inherit AOSP device configuration
$(call inherit-product, device/asus/X01BD/device.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_X01BD
PRODUCT_DEVICE := X01BD
PRODUCT_BRAND := Asus
PRODUCT_MODEL := Zenfone Max Pro M2
PRODUCT_MANUFACTURER := Asus

PRODUCT_GMS_CLIENTID_BASE := android-asus

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="asus/WW_X01BD/ASUS_X01BD_1:9/PKQ1/16.2017.1910.071-20190920:user/release-keys" \
    PRIVATE_BUILD_DESC="sdm660_64-user 9 PKQ1 1287 release-keys"
endif
