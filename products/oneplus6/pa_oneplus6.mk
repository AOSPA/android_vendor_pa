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
ifeq (pa_oneplus6,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Include Paranoid Android common configuration
TARGET_BOOT_ANIMATION_RES := 1080

TARGET_USES_AOSP := false
TARGET_USES_QCOM_BSP := false

include device/qcom/common/common.mk
include vendor/pa/config/common_full_phone.mk

# Inherit AOSP device configuration
$(call inherit-product, device/oneplus/oneplus6/oneplus6.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_oneplus6
PRODUCT_DEVICE := oneplus6
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := OnePlus 6
PRODUCT_MANUFACTURER := OnePlus

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

TARGET_VENDOR_PRODUCT_NAME := OnePlus6
TARGET_VENDOR_DEVICE_NAME := OnePlus6

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=OnePlus6 \
    PRODUCT_NAME=OnePlus6 \
    PRIVATE_BUILD_DESC="OnePlus6-user 8.1.0 OPM1.171019.011 273 release-keys"

BUILD_FINGERPRINT := OnePlus/OnePlus6/OnePlus6:8.1.0/OPM1.171019.011/06140300:user/release-keys

# HACK, needed to flash in TWRP to avoid following error in flashing zip
# https://github.com/omnirom/android_bootable_recovery/blob/58f2132bc3954fc704787d477500a209eedb8e29/installcommand.cpp#L128
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.device=OnePlus6

endif
