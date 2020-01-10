# Copyright (C) 2016-2020 Paranoid Android
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

# Ensure OnePlus 3/T is the target product.
ifeq (pa_oneplus3,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit the PA configuration.
$(call inherit-product, vendor/pa/config/common_full_phone.mk)

# Inherit the common QCOM configurations.
$(call inherit-product, device/qcom/common/common.mk)
$(call inherit-product, vendor/qcom/common/av/qti-av.mk)

# Inherit our custom device configuration.
$(call inherit-product, device/oneplus/oneplus3/device.mk)

TARGET_BOOT_ANIMATION_RES := 1080

# Override the AOSP build properties.
PRODUCT_NAME := pa_oneplus3
PRODUCT_DEVICE := oneplus3
PRODUCT_BRAND := OnePlus
PRODUCT_MANUFACTURER := OnePlus

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

PRODUCT_BUILD_PROP_OVERRIDES += \
     BUILD_FINGERPRINT=OnePlus/OnePlus3/OnePlus3:9/PKQ1.181203.001/1911042107:user/release-keys \
     PRIVATE_BUILD_DESC="OnePlus3-user 9 PKQ1.181203.001 1911042107 release-keys"

endif
