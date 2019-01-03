#
# Copyright 2016-2018 The Android Open Source Project
#                     Paranoid Android
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

ifeq (pa_dipper,$(TARGET_PRODUCT))

# Get the defaults going.
TARGET_BOOT_ANIMATION_RES := 1080

# Inherit from default AOSP configuration
$(call inherit-product, device/xiaomi/dipper/aosp_dipper.mk)

# Generic CAF packages
include device/qcom/common/common.mk

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := pa_dipper
PRODUCT_DEVICE := dipper
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := MI 8
PRODUCT_MANUFACTURER := Xiaomi

BUILD_FINGERPRINT := "Xiaomi/dipper/dipper:8.1.0/OPM1.171019.011/V9.5.11.0.OEACNFA:user/release-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="dipper-user 8.1.0 OPM1.171019.011 V9.5.11.0.OEACNFA release-keys" \
    PRODUCT_NAME="dipper" \
    TARGET_DEVICE="dipper"

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Paranoid Android platform
include vendor/pa/main.mk

endif
