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
ifeq (pa_gts210wifi,$(TARGET_PRODUCT))

# Include ParanoidAndroid common configuration
TARGET_BOOT_ANIMATION_RES := 1440
include vendor/pa/main.mk

# Inherit AOSP device configuration
$(call inherit-product, device/samsung/gts210wifi/aosp_gts210wifi.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_gts210wifi
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-T810
PRODUCT_MANUFACTURER := Samsung
PRODUCT_BUILD_PROP_OVERRIDES += \
	PRODUCT_NAME=gts210wifi

# Assert
TARGET_OTA_ASSERT_DEVICE := gts210wifi,gts210wifixx

endif
