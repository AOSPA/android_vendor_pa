# Copyright (C) 2018 Paranoid Android
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
ifeq (pa_beryllium,$(TARGET_PRODUCT))

# Include Paranoid Android common configuration
TARGET_BOOT_ANIMATION_RES := 1080

include device/qcom/common/common.mk
include vendor/pa/config/common_full_phone.mk

# Inherit AOSP device configuration
$(call inherit-product, device/xiaomi/beryllium/device.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_beryllium
PRODUCT_DEVICE := beryllium
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Poco F1
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

BUILD_FINGERPRINT := "Xiaomi/beryllium/beryllium:9/PKQ1.180729.001/V10.2.3.0.PEJMIXM:user/release-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="beryllium-user 9 PKQ1.180729.001 V10.2.3.0.PEJMIXM release-keys" \
    PRODUCT_DEVICE="beryllium" \
    PRODUCT_NAME="beryllium"

endif
