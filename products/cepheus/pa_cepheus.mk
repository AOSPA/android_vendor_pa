# Copyright (C) 2019 Paranoid Android
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
ifeq (pa_cepheus,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Include Paranoid Android common configuration
TARGET_BOOT_ANIMATION_RES := 1080

TARGET_USES_AOSP := false
TARGET_USES_QCOM_BSP := false

include device/qcom/common/common.mk
include vendor/pa/main.mk

# Inherit AOSP device configuration
$(call inherit-product, device/xiaomi/cepheus/msmnile.mk)
$(call inherit-product, vendor/gapps/config.mk)

TARGET_GAPPS_ARCH := arm64

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := pa_cepheus
PRODUCT_DEVICE := cepheus
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := MI 9
PRODUCT_MANUFACTURER := Xiaomi

BUILD_FINGERPRINT := "Xiaomi/cepheus_eea/cepheus:9/PKQ1.181121.001/V10.2.15.0.PFAEUXM:user/release-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="cepheus-user 9 PKQ1.181121.001 V10.2.15.0.PFAEUXM release-keys" \
    PRODUCT_NAME="cepheus" \
    TARGET_DEVICE="cepheus"

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

endif
