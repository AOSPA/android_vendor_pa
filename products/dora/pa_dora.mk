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
ifeq (pa_dora,$(TARGET_PRODUCT))

# Use the AOSP stack
TARGET_USES_AOSP := true

# Inherit device configuration
$(call inherit-product, device/sony/dora/aosp_f8131.mk)

# Inherit common PA configuration
$(call inherit-product, vendor/pa/config/common_full_phone.mk)

TARGET_BOOT_ANIMATION_RES := 1080

# Override build properties
PRODUCT_NAME := pa_dora
PRODUCT_MODEL := Xperia X Performance (AOSPA)

# Paranoid Android platform
include vendor/pa/config/common_full_phone.mk

endif
