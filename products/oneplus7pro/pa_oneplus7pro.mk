# Copyright (C) 2019 Paranoid Android
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
ifeq (pa_oneplus7pro,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Include Paranoid Android common configuration
TARGET_BOOT_ANIMATION_RES := 1440

TARGET_USES_AOSP := false
TARGET_USES_QCOM_BSP := false

# Advanced platform features
#TARGET_WANTS_EXTENDED_DPM_PLATFORM := true
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

include device/qcom/common/common.mk
include vendor/pa/config/common_full_phone.mk

# Inherit AOSP device configuration
$(call inherit-product, device/oneplus/oneplus7pro/device.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_oneplus7pro
PRODUCT_DEVICE := oneplus7pro
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := OnePlus 7 Pro
PRODUCT_MANUFACTURER := OnePlus

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

TARGET_VENDOR_PRODUCT_NAME := OnePlus7Pro
TARGET_VENDOR_DEVICE_NAME := OnePlus7Pro

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=OnePlus7Pro \
    PRODUCT_NAME=OnePlus7Pro \
    PRIVATE_BUILD_DESC="OnePlus7Pro-user 10 QKQ1.190716.003 1909131115 release-keys" \
    BUILD_FINGERPRINT="OnePlus/OnePlus7Pro/OnePlus7Pro:10/QKQ1.190716.003/1910071200:user/release-keys"

# HACK
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.device=OnePlus7Pro

endif
