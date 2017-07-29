# Copyright (C) 2016-2017 Paranoid Android
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

ifeq (pa_libra,$(TARGET_PRODUCT))

# Boot animation
TARGET_BOOT_ANIMATION_RES := 1080

# Inherit 64-bit configs
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Generic CAF packages
include device/qcom/common/common.mk

# Inherit device configuration
$(call inherit-product, device/xiaomi/libra/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := pa_libra
PRODUCT_DEVICE := libra
BOARD_VENDOR := Xiaomi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi-4c
PRODUCT_MANUFACTURER := Xiaomi
TARGET_VENDOR := Xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
     PRODUCT_NAME="libra" \
     BUILD_FINGERPRINT="Xiaomi/libra/libra:7.0/NRD90M/V8.5.1.0.NXKCNED:user/release-keys" \
     PRIVATE_BUILD_DESC="libra-user 7.0 NRD90M V8.5.1.0.NXKCNED release-keys"

TARGET_OTA_ASSERT_DEVICE := libra
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Paranoid Android platform
include vendor/pa/main.mk
endif
