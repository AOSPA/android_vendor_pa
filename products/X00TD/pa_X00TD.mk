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
ifeq (pa_X00TD,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o_mr1.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Inherit device configuration
$(call inherit-product, device/asus/X00TD/device.mk)

# Inherit common PA configuration
$(call inherit-product, vendor/pa/config/common_full_phone.mk)

# Override build properties
PRODUCT_BRAND := asus
PRODUCT_DEVICE := X00TD
PRODUCT_MANUFACTURER := asus
PRODUCT_NAME := pa_X00TD

PRODUCT_GMS_CLIENTID_BASE := android-asus

TARGET_VENDOR := asus
TARGET_VENDOR_PRODUCT_NAME := X00TD

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="sdm660_64-user 9 PKQ1 1455 release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := google/walleye/walleye:8.1.0/OPM1.171019.011/4448085:user/release-keys
# The following system and vendor props will be set by vendor init
PRODUCT_SYSTEM_PROPERTY_BLACKLIST := \
    ro.product.device \
    ro.product.model \
    ro.product.name

PRODUCT_VENDOR_PROPERTY_BLACKLIST := \
    ro.vendor.product.device \
    ro.vendor.product.model \
    ro.vendor.product.name

# Bootanimation
TARGET_BOOT_ANIMATION_RES := 1080

endif