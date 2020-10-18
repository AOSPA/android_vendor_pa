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
ifeq (pa_obiwan,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

TARGET_BOOT_ANIMATION_RES := 1080

# Inherit device configuration
$(call inherit-product, device/asus/obiwan/device.mk)

# Inherit common PA configuration
$(call inherit-product, vendor/pa/config/common_full_phone.mk)

# Override build properties
PRODUCT_NAME := pa_obiwan
PRODUCT_DEVICE := obiwan
PRODUCT_BRAND := asus
PRODUCT_MODEL := ASUS_I003D
PRODUCT_MANUFACTURER := asus

PRODUCT_GMS_CLIENTID_BASE := android-asus

# Build info
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE=ASUS_I003_1 \
    PRODUCT_NAME=WW_I003D \
    PRIVATE_BUILD_DESC="WW_I003D-user 10 QKQ1.200419.002 17.0823.2008.78-0 release-keys" \
    TARGET_DEVICE=ZS661KS

BUILD_FINGERPRINT := "asus/WW_I003D/ASUS_I003_1:10/QKQ1.200419.002/17.0823.2008.78-0:user/release-keys"

endif
