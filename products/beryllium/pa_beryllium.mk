# Copyright (C) 2018 Paranoid Android
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
ifeq (pa_beryllium,$(TARGET_PRODUCT))

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
$(call inherit-product, device/xiaomi/beryllium/device.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_beryllium
PRODUCT_DEVICE := beryllium
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Poco F1
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi-rev1

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="beryllium-user 8.1.0 OPM1.171019.011 V9.6.18.0.OEJMIFD release-keys" \
    PRODUCT_NAME="beryllium" \
    TARGET_DEVICE="beryllium"

endif
