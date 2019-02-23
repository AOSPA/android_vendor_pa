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
ifeq (pa_daisy,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Include Paranoid Android common configuration
TARGET_BOOT_ANIMATION_RES := 1080

TARGET_USES_AOSP := false
TARGET_USES_QCOM_BSP := false

# Advanced platform features
#TARGET_WANTS_EXTENDED_DPM_PLATFORM := true
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

include device/qcom/common/common.mk
include vendor/pa/main.mk

# Inherit AOSP device configuration
$(call inherit-product, device/xiaomi/daisy/device.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_daisy
PRODUCT_DEVICE := daisy
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := MI A2 Lite
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

BUILD_FINGERPRINT := "xiaomi/daisy/daisy_sprout:9/PKQ1.180917.001/V10.0.1.0.PDLMIFJ:user/release-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="daisy-user 9 PKQ1.180917.001 V10.0.1.0.PDLMIFJ release-keys" \
    PRODUCT_NAME="daisy" \
    TARGET_DEVICE="daisy"

endif
