# Copyright (C) 2015 ParanoidAndroid Project
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
ifeq (pa_onyx,$(TARGET_PRODUCT))

# Use AOSP Camera Application
TARGET_USES_AOSP_CAMERA := true

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Include ParanoidAndroid common configuration
TARGET_BOOT_ANIMATION_RES := 1080

include device/qcom/common/common.mk

# Inherit AOSP device configuration
$(call inherit-product, device/oneplus/onyx/onyx.mk)

include vendor/pa/main.mk

# Override AOSP build properties
PRODUCT_NAME := pa_onyx
PRODUCT_DEVICE := onyx
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := X
PRODUCT_MANUFACTURER := OnePlus

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

endif
