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
ifeq (pa_kugo,$(TARGET_PRODUCT))

# Use the AOSP stack
TARGET_USES_AOSP := true

# Inherit AOSP device configuration
$(call inherit-product, device/sony/kugo/aosp_f5321.mk)

# Generic CAF packages
include device/qcom/common/common.mk

# Include Paranoid Android common configuration
TARGET_BOOT_ANIMATION_RES := 1080
include vendor/pa/main.mk

# Override AOSP build properties
PRODUCT_NAME := pa_kugo
PRODUCT_MODEL := Xperia X Compact (AOSPA)

endif
