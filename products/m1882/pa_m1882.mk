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

# Check for target product
ifeq (pa_m1882,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

TARGET_BOOT_ANIMATION_RES := 1080

# Inherit device configuration
$(call inherit-product, device/meizu/m1882/device.mk)

# Inherit common PA configuration
$(call inherit-product, vendor/pa/config/common_full_phone.mk)

# Override build properties
PRODUCT_NAME := pa_m1882
PRODUCT_DEVICE := m1882
PRODUCT_BRAND := Meizu
PRODUCT_MODEL := 16th
PRODUCT_MANUFACTURER := Meizu

PRODUCT_GMS_CLIENTID_BASE := android-meizu

BUILD_FINGERPRINT := "meizu/qssi/qssi:10/QKQ1.191222.002/1594833800:user/release-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="meizu_16th_CN-user 10 QKQ1.191222.002 1594833800 release-keys" \
    PRODUCT_NAME="meizu_16th_CN" \
    TARGET_DEVICE="16th"

endif
