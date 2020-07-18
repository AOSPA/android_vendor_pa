# Copyright (C) 2020 Paranoid Android
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

ifeq (pa_oneplus8,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from our custom device configuration.
$(call inherit-product, device/oneplus/oneplus8/device.mk)

# Inherit from our PA configuration.
$(call inherit-product, vendor/pa/config/common_full_phone.mk)

TARGET_BOOT_ANIMATION_RES := 1080

PRODUCT_BRAND := OnePlus
PRODUCT_DEVICE := oneplus8
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_MODEL := OnePlus 8
PRODUCT_NAME := pa_oneplus8

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

endif
