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
ifeq (pa_oneplus5,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Include Paranoid Android common configuration
TARGET_BOOT_ANIMATION_RES := 1080

# Include necessary makefiles
include vendor/pa/main.mk
include device/qcom/common/common.mk

# Inherit device configuration
$(call inherit-product, device/oneplus/oneplus5/oneplus5.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_oneplus5
PRODUCT_DEVICE := oneplus5
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := ONEPLUS A5000
PRODUCT_MANUFACTURER := OnePlus

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=OnePlus/OnePlus5/OnePlus5:9/PKQ1.180716.001/1905271736:user/release-keys \
    PRIVATE_BUILD_DESC="OnePlus5-user 9 PKQ1.180716.001 1905271736 release-keys"

endif
