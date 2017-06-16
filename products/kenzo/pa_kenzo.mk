# Copyright (C) 2017 - The Paranoid Android Project
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

# Check for the target product.
ifeq (pa_kenzo,$(TARGET_PRODUCT))

# Inherit from those products, most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Set bootanimation to 1080p display.
TARGET_BOOT_ANIMATION_RES := 1080

# Inherit from our common CAF device tree.
include device/qcom/common/common.mk

# Inherit the device configuration itself.
$(call inherit-product, device/xiaomi/kenzo/device.mk)

# Inherit the main configuration from our vendor.
include vendor/pa/main.mk

# Override device build properties.
PRODUCT_NAME := pa_kenzo
PRODUCT_DEVICE := kenzo
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi Note 3
PRODUCT_MANUFACTURER := Xiaomi
BOARD_VENDOR := Xiaomi
TARGET_VENDOR := Xiaomi

# Google client ID.
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=Xiaomi/kenzo/kenzo:6.0.1/MMB29M/V8.2.1.0.MHOCNDL:user/release-keys \
    PRIVATE_BUILD_DESC="kenzo-user 6.0.1 MMB29M V8.2.1.0.MHOCNDL release-keys"

endif
