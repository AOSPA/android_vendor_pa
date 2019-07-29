#
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
#

# Check for target product
ifeq (pa_sanders,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_n_mr1.mk)
# Inherit from device
$(call inherit-product, device/motorola/sanders/device.mk)

# Inherit common Paranoid Android config
$(call inherit-product, vendor/pa/config/common_full_phone.mk)

# PA Bootanimation
TARGET_BOOT_ANIMATION_RES := 1080

# Device identifiers
PRODUCT_DEVICE := sanders
PRODUCT_NAME := pa_sanders
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto G (5S) plus
PRODUCT_MANUFACTURER := Motorola
PRODUCT_RELEASE_NAME := sanders

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=sanders

# for specific
$(call inherit-product, vendor/motorola/sanders/sanders-vendor.mk)

endif
