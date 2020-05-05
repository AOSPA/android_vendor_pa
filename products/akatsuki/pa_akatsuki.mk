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

# Check for target product
ifeq (pa_akatsuki,$(TARGET_PRODUCT))

# Use the AOSP stack
TARGET_USES_AOSP := true
TARGET_EXCLUDE_QCOM_SEPOLICY := true
BOARD_USE_ENFORCING_SELINUX := false
BUILD_WITHOUT_VENDOR := true
ALLOW_MISSING_DEPENDENCIES := true

# Inherit AOSP device configuration
$(call inherit-product, device/sony/akatsuki/aosp_h8416.mk)

TARGET_BOOT_ANIMATION_RES := 1440

# Override AOSP build properties
PRODUCT_NAME := pa_akatsuki
PRODUCT_MODEL := Xperia XZ3 (AOSPA)

BUILD_FINGERPRINT := Sony/H8416/H8416:9/52.0.A.3.27/2935389866:user/release-keys

PA_TARGET_PACKAGE := $(PRODUCT_OUT)/pa-$(PA_VERSION).zip

# Paranoid Android platform
include vendor/pa/config/common_full_phone.mk

endif
