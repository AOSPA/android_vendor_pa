# Copyright (C) 2016-2017 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ifeq (pa_marlin,$(TARGET_PRODUCT))

# We have our own power HAL
TARGET_USES_DEVICE_SPECIFIC_POWERHAL := true

# Use the AOSP stack
TARGET_USES_AOSP := true

# Use the sepolicies which are being shipped with our device
TARGET_EXCLUDE_QCOM_SEPOLICY := true

# Inherit AOSP device configuration for marlin.
$(call inherit-product, device/google/marlin/aosp_marlin.mk)

# Generic CAF packages
include device/qcom/common/common.mk

# Get the defaults going.
TARGET_BOOT_ANIMATION_RES := 1440

# Override AOSP defaults that we want changed.
PRODUCT_NAME := pa_marlin
PRODUCT_DEVICE := marlin
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel XL
PRODUCT_MANUFACTURER := Google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=marlin \
    PRIVATE_BUILD_DESC="marlin-user 9 PQ3A.190705.001 5565753 release-keys"

BUILD_FINGERPRINT="google/marlin/marlin:9/PQ3A.190705.001/5565753:user/release-keys"
BUILD_THUMBPRINT="9/PQ3A.190705.001/5565753:user/release-keys"

# Paranoid Android platform
include vendor/pa/main.mk

endif
