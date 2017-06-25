# Copyright (C) 2017 Paranoid Android
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
ifeq (pa_zl1,$(TARGET_PRODUCT))

# Inherit from those products, most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Set bootanimation to 1080p display.
TARGET_BOOT_ANIMATION_RES := 1080

# Most advanced platform features.
TARGET_WANTS_EXTENDED_DPM_PLATFORM := true
TARGET_DISABLE_DASH := false
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Inherit from our common CAF device tree.
include device/qcom/common/common.mk

# Inherit the device configuration itself.
$(call inherit-product, device/leeco/zl1/zl1.mk)

# Inherit the main configuration from our vendor.
include vendor/pa/main.mk

# Override default AOSP build properties.
PRODUCT_NAME := pa_zl1
PRODUCT_DEVICE := zl1
PRODUCT_BRAND := LeEco
PRODUCT_MANUFACTURER := LeMobile
PRODUCT_BUILD_PROP_OVERRIDES += TARGET_DEVICE=le_zl1 PRODUCT_NAME=ZL1_NA

# Google client ID property.
PRODUCT_GMS_CLIENTID_BASE := android-leeco

# Build fingerprint from USA variant.
PRODUCT_BUILD_PROP_OVERRIDES += \
     BUILD_FINGERPRINT=LeEco/ZL1_NA/le_zl1:6.0.1/WEXNAOP5802012101S/letv12100148:user/release-keys \
     PRIVATE_BUILD_DESC="le_zl1-user 6.0.1 WEXNAOP5802012101S eng.letv.20161210.014420 release-keys"

# The model (X720/X727) is set from init.
PRODUCT_SYSTEM_PROPERTY_BLACKLIST += ro.product.model

endif
