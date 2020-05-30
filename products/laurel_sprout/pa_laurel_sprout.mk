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
ifeq (pa_laurel_sprout,$(TARGET_PRODUCT))

$(call inherit-product, device/xiaomi/laurel_sprout/device.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Inherit some common ps stuff.
$(call inherit-product, vendor/pa/config/common_full_phone.mk)
$(call inherit-product, device/qcom/common/common.mk)

TARGET_BOOT_ANIMATION_RES := 720

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := pa_laurel_sprout
PRODUCT_DEVICE := laurel_sprout
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi A3
PRODUCT_MANUFACTURER := Xiaomi

BUILD_FINGERPRINT := "Xiaomi/laurel_sprout/laurel_sprout:10/QKQ1.190910.002/V11.0.7.0.QFQMIXM:user/release-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="qssi-user 10 QKQ1.190910.002 V11.0.7.0.QFQMIXM release-keys" \
    PRODUCT_NAME="laurel_sprout" \
    TARGET_DEVICE="laurel_sprout"

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

endif
