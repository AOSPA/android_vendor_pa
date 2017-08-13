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

# Check for target product
ifeq (pa_oneplus3,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

TARGET_BOOT_ANIMATION_RES := 1080

# Advanced platform features
TARGET_WANTS_EXTENDED_DPM_PLATFORM := true
TARGET_DISABLE_DASH := false
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

include device/qcom/common/common.mk

# Inherit AOSP device configuration
$(call inherit-product, device/oneplus/oneplus3/oneplus3.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_oneplus3
PRODUCT_DEVICE := oneplus3
PRODUCT_BRAND := OnePlus
PRODUCT_MANUFACTURER := OnePlus

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

PRODUCT_BUILD_PROP_OVERRIDES += \
     BUILD_FINGERPRINT=OnePlus/OnePlus3/OnePlus3:7.1.1/NMF26F/07151600:user/release-keys \
     PRIVATE_BUILD_DESC="OnePlus3-user 7.1.1 NMF26F 74 dev-keys"

# Paranoid Android platform
include vendor/pa/main.mk

endif
