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
ifeq (pa_nx627j,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Include Paranoid Android common configuration
TARGET_BOOT_ANIMATION_RES := 1080

include device/qcom/common/common.mk
include vendor/pa/config/common_full_phone.mk

# Inherit AOSP device configuration
$(call inherit-product, device/nubia/nx627j/nubia.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_nx627j
PRODUCT_DEVICE := NX627J
PRODUCT_BRAND := nubia
PRODUCT_MODEL := nubia Z20
PRODUCT_MANUFACTURER := nubia

PRODUCT_GMS_CLIENTID_BASE := android-nubia

BUILD_FINGERPRINT := "nubia/NX627J/NX627J:9/PKQ1.190714.001/eng.nubia.20191016.215019:user/release-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="NX627J-user 9 PKQ1.190714.001 eng.nubia.20191016.215019 release-keys" \
    PRODUCT_NAME="NX627J" \
    TARGET_DEVICE="NX627J"

endif
