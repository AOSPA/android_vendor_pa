# Copyright (C) 2021 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ifeq (pa_2e,$(TARGET_PRODUCT))

# Inherit from 2e device
$(call inherit-product, device/teracube/2e/device.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

TARGET_BOOT_ANIMATION_RES := 720

# Inherit AOSPA vendor.
$(call inherit-product, vendor/pa/config/common_full_phone.mk)

PRODUCT_DEVICE := 2e
PRODUCT_MANUFACTURER := Teracube
PRODUCT_NAME := pa_2e
PRODUCT_MODEL := Teracube 2e

PRODUCT_GMS_CLIENTID_BASE := android-teracube
TARGET_VENDOR := teracube
TARGET_VENDOR_PRODUCT_NAME := 2e
PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="full_yk673v6_lwg62_64-user 10 QP1A.190711.020 p1k61v164bspP29 release-keys"

endif
