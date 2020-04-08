#
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
#

# Check for target product
ifeq (pa_A6020,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_l_mr1.mk)

# Inherit from A6020 device
$(call inherit-product, device/lenovo/A6020/device.mk)

# Inherit some common Paranoid Android stuff
$(call inherit-product, vendor/pa/config/common_full_phone.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := A6020
PRODUCT_NAME := pa_A6020
PRODUCT_BRAND := Lenovo
PRODUCT_MODEL := Vibe K5
PRODUCT_MANUFACTURER := Lenovo
PRODUCT_GMS_CLIENTID_BASE := android-lenovo

# Bootanimation
TARGET_BOOT_ANIMATION_RES := 720

endif
