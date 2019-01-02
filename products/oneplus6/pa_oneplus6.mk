#
# Copyright (C) 2018 The LineageOS Project
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

# Inherit from those products. Most specific first.

# Check for target product
ifeq (pa_oneplus6,$(TARGET_PRODUCT))

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

TARGET_BOOT_ANIMATION_RES := 1080

include device/qcom/common/common.mk
include vendor/qcom/common/qti-vendor.mk

# Inherit from oneplus6 device
$(call inherit-product, device/oneplus/oneplus6/device.mk)

PRODUCT_NAME := pa_oneplus6
PRODUCT_DEVICE := oneplus6
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_BRAND := OnePlus

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

# Paranoid Android platform
include vendor/pa/main.mk

endif
