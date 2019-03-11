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
ifeq (pa_suzu_ds,$(TARGET_PRODUCT))

# Use the AOSP stack
TARGET_USES_AOSP := true
TARGET_EXCLUDE_QCOM_SEPOLICY=true
BOARD_USE_ENFORCING_SELINUX:= true

# Inherit AOSP device configuration
$(call inherit-product, device/sony/suzu/aosp_f5122.mk)

TARGET_BOOT_ANIMATION_RES := 1080

# Override AOSP build properties
PRODUCT_NAME := pa_suzu_ds
PRODUCT_MODEL := Xperia X (AOSPA)

# Paranoid Android platform
include vendor/pa/main.mk

endif
