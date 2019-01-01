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

# Ensure Essential PH-1 is the target product.
ifeq (pa_mata,$(TARGET_PRODUCT))

# Inherit from the device configuration.
$(call inherit-product, device/essential/mata/aosp_mata.mk)

# Inherit from the PA configuration.
$(call inherit-product, vendor/pa/config/common_full_phone.mk)

# Include the common CAF configurations.
$(call inherit-product, device/qcom/common/common.mk)
$(call inherit-product, vendor/qcom/common/av/qti-av.mk)
$(call inherit-product, vendor/qcom/common/perf/qti-perf.mk)

# Only exclude normal SEPolicy so we can opt into legacy.
TARGET_EXCLUDE_QCOM_SEPOLICY := true

# PA declarations.
TARGET_BOOT_ANIMATION_RES := 1440
DISABLE_EAP_PROXY := true

# Device identifiers.
PRODUCT_DEVICE := mata
PRODUCT_NAME := pa_mata
PRODUCT_BRAND := Essential
PRODUCT_MODEL := PH-1
PRODUCT_MANUFACTURER := Essential Products
PRODUCT_RELEASE_NAME := mata

endif
