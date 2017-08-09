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

# Check for target product
ifeq (pa_shamu,$(TARGET_PRODUCT))

# Use AOSP Camera Application
TARGET_USES_AOSP_CAMERA := true

# Use the AOSP stack
TARGET_USES_AOSP := true

# Inherit AOSP device configuration
$(call inherit-product, device/moto/shamu/aosp_shamu.mk)

# Generic CAF packages
include device/qcom/common/common.mk

TARGET_BOOT_ANIMATION_RES := 1440

# Override AOSP build properties
PRODUCT_NAME := pa_shamu
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 6
PRODUCT_MANUFACTURER := motorola
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=shamu \
    BUILD_FINGERPRINT=google/shamu/shamu:7.1.1/N8I11B/4171878:user/release-keys \
    PRIVATE_BUILD_DESC="shamu-user 7.1.1 N8I11B 4171878 release-keys"

# Paranoid Android platform
include vendor/pa/main.mk

endif
