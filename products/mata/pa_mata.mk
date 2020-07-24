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

# Ensure Essential PH-1 is the target product.
ifeq (pa_mata,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from our custom device configuration.
$(call inherit-product, device/essential/mata/device.mk)

# Inherit from our AOSPA configuration.
$(call inherit-product, vendor/pa/config/common_full_phone.mk)

TARGET_BOOT_ANIMATION_RES := 1440

# Device identifiers.
PRODUCT_DEVICE := mata
PRODUCT_NAME := pa_mata
PRODUCT_BRAND := Essential
PRODUCT_MODEL := PH-1
PRODUCT_MANUFACTURER := Essential Products

endif
