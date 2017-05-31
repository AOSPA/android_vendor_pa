# Copyright (C) 2016-2017 Paranoid Android
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
ifeq ($(TARGET_PRODUCT),pa_gts210ltexx)

# Inherit device configuration
$(call inherit-product, device/samsung/gts210ltexx/device.mk)
$(call inherit-product, device/samsung/gts2-common/device-common.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Include Paranoid Android common configuration
TARGET_BOOT_ANIMATION_RES := 1440
include vendor/pa/main.mk

# Override AOSP build properties
PRODUCT_NAME := pa_gts210ltexx
PRODUCT_DEVICE := gts210ltexx
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-T815
PRODUCT_MANUFACTURER := Samsung
PRODUCT_BUILD_PROP_OVERRIDES += \
	PRODUCT_NAME=gts210ltexx

endif
