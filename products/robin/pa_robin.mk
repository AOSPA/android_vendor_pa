# Copyright (C) 2016 ParanoidAndroid Project
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
ifeq (pa_robin,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Include ParanoidAndroid common configuration
TARGET_BOOT_ANIMATION_RES := 1080
include vendor/pa/main.mk

# Inherit AOSP device configuration
$(call inherit-product, device/nextbit/robin/device.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_robin
PRODUCT_DEVICE := robin
BOARD_VENDOR := nextbit
TARGET_VENDOR := nextbit
PRODUCT_BRAND := Nextbit
PRODUCT_MODEL := Robin
PRODUCT_MANUFACTURER := Nextbit

PRODUCT_BUILD_PROP_OVERRIDES += \
     BUILD_FINGERPRINT=Nextbit/ether/ether:6.0.1/MMB29M/00WW_1_290:user/release-keys \
     PRIVATE_BUILD_DESC="ether-user 6.0.1 MMB29M 00WW_1_290 release-keys"

endif
