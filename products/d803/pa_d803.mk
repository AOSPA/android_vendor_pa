# Copyright (C) 2016 The Paranoid Android Project
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
ifeq (pa_d803,$(TARGET_PRODUCT))

# Inherit the AOSP telephony configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Include the common makefile for QCOM devices
include device/qcom/common/common.mk

# Include PA common configuration
TARGET_BOOT_ANIMATION_RES := 1080
include vendor/pa/main.mk

# Inherit device configuration
$(call inherit-product, device/lge/d803/d803.mk)

# Override device properties
PRODUCT_DEVICE := d803
PRODUCT_NAME := pa_d803
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG-D803
PRODUCT_MANUFACTURER := LGE
PRODUCT_BUILD_PROP_OVERRIDES += \
	BUILD_FINGERPRINT=lge/g2_ca/g2:4.4.2/KOT49I.D803B20e/D803B20e.1394602420:user/release-keys \
	PRIVATE_BUILD_DESC="g2_ca-user 4.4.2 KOT49I D803B20e.1394602420 release-keys"

endif
