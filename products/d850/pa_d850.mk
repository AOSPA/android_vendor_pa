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
ifeq (pa_d850,$(TARGET_PRODUCT))

# Inherit the AOSP telephony configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Include the common makefile for QCOM devices
include device/qcom/common/common.mk

# Include PA common configuration
TARGET_BOOT_ANIMATION_RES := 1440
include vendor/pa/main.mk

# Inherit device configuration
$(call inherit-product, device/lge/d850/d850.mk)

# Override device properties
PRODUCT_NAME := pa_d850
PRODUCT_DEVICE := d850
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG-D850
PRODUCT_MANUFACTURER := LGE
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE="g3" \
    PRODUCT_NAME="g3_att_us" \
    BUILD_FINGERPRINT="lge/g3_att_us/g3:4.4.2/KVT49L.D85010d/D85010d.1403173065:user/release-keys" \
    PRIVATE_BUILD_DESC="g3_att_us-user 4.4.2 KVT49L.D85010d D85010d.1403173065 release-keys"

endif
