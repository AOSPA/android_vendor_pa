#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
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
ifeq (pa_potter,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_n.mk)

TARGET_BOOT_ANIMATION_RES := 1080

include device/qcom/common/common.mk

# Inherit from potter device
$(call inherit-product, device/motorola/potter/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := potter
PRODUCT_NAME := pa_potter
PRODUCT_BRAND := motorola
PRODUCT_MANUFACTURER := motorola
PRODUCT_MODEL := Moto G5 Plus
PRODUCT_RELEASE_NAME := potter

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
	PRODUCT_NAME="potter" \
	PRIVATE_BUILD_DESC="potter-7.0/NPNS25.137-33-11/11:user/release-keys"

	BUILD_FINGERPRINT := motorola/payton/payton:8.0.0/OPWS27.57-25-6-10/12:user/release-keys



# for specific
$(call inherit-product, vendor/motorola/potter/potter-vendor.mk)

# Paranoid Android platform
include vendor/pa/main.mk

endif
