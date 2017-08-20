# Copyright (C) 2015-2017 Paranoid Android
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
ifeq (pa_thea,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

TARGET_BOOT_ANIMATION_RES := 720

include device/qcom/common/common.mk

# Inherit AOSP device configuration
$(call inherit-product, device/motorola/thea/full_thea.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_thea
PRODUCT_DEVICE := thea
PRODUCT_BRAND := Motorola
PRODUCT_MODEL := Moto G 2014 4G
PRODUCT_MANUFACTURER := Motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola

# Paranoid Android platform
include vendor/pa/main.mk

endif
