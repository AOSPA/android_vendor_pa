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
ifeq (pa_onyx,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_l_mr1.mk)

TARGET_BOOT_ANIMATION_RES := 1080

# Inherit device configuration
$(call inherit-product, device/oneplus/onyx/device.mk)

# Inherit common PA configuration
$(call inherit-product, device/qcom/common/common.mk)
$(call inherit-product, vendor/pa/config/common_full_phone.mk)

# GApps
TARGET_DISABLES_GAPPS := true

# Override build properties
PRODUCT_NAME := pa_onyx
PRODUCT_DEVICE := onyx
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := OnePlus
PRODUCT_MANUFACTURER := OnePlus

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="OnePlus-user 6.0.1 MMB29M 10281213 release-keys"

BUILD_FINGERPRINT := OnePlus/OnePlus/OnePlus:6.0.1/MMB29M/10281213:user/release-keys

endif
