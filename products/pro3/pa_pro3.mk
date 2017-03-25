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
ifeq (pa_pro3,$(TARGET_PRODUCT))

# Inherit from those products, most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Set bootanimation to 1080p display.
TARGET_BOOT_ANIMATION_RES := 1080

# Most advanced platform features, first.
TARGET_WANTS_EXTENDED_DPM_PLATFORM := true
TARGET_DISABLE_DASH := false
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Inherit from our common CAF device tree.
include device/qcom/common/common.mk

# Inherit the device configuration itself.
$(call inherit-product, device/leeco/pro3/pro3.mk)

# Inherit the main configuration from our vendor.
include vendor/pa/main.mk

# Override device build properties.
PRODUCT_NAME := pa_pro3
PRODUCT_DEVICE := pro3
PRODUCT_BRAND := LeEco
PRODUCT_MANUFACTURER := LeMobile

PRODUCT_GMS_CLIENTID_BASE := android-letv

PRODUCT_BUILD_PROP_OVERRIDES += \
     BUILD_FINGERPRINT=LeEco/le_zl1/LePro3:6.0.1/MMB29M/362280:user/release-keys \
     PRIVATE_BUILD_DESC="LePro3-user 6.0.1 MMB29M 24 dev-keys"

endif
