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

# Check for the target product.
ifeq (pa_cedric,$(TARGET_PRODUCT))

# Inherit from those products, most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Set bootanimation to 1080p display.
TARGET_BOOT_ANIMATION_RES := 1080

# Inherit from our common CAF device tree.
include device/qcom/common/common.mk

# Inherit the device configuration itself.
$(call inherit-product, device/motorola/cedric/device.mk)

# Override device build properties.
PRODUCT_NAME := pa_cedric
PRODUCT_DEVICE := cedric
PRODUCT_BRAND := Motorola
PRODUCT_MODEL := Moto G5
PRODUCT_MANUFACTURER := Motorola

# Google client ID.
PRODUCT_GMS_CLIENTID_BASE := android-motorola

TARGET_VENDOR := Motorola

# Paranoid Android platform
include vendor/pa/config/common_full_phone.mk

endif
